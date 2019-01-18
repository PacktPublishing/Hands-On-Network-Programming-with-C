/*
 * MIT License
 *
 * Copyright (c) 2018 Lewis Van Winkle
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#include "chap08.h"
#include <ctype.h>

#define MAXINPUT 512

void wait_on_response(SOCKET server, int expecting) {
#define RESPONSE_SIZE 1024
    char response[RESPONSE_SIZE+1];
    char *p = response;
    char *end = response + RESPONSE_SIZE;

    int code = 0;

    do {
        printf("waiting for response\n");
        int bytes_received = recv(server, p, end - p, 0);

        if (bytes_received < 1) {
            fprintf(stderr, "Connection dropped.\n");
            exit(1);
        }
        printf("received %d bytes\n", bytes_received);

        p += bytes_received;
        *p = 0;

        if (p == end) {
            fprintf(stderr, "Server response too large:\n");
            fprintf(stderr, "%s", response);
            exit(1);
        }


        if (p - response > 4) {
            char *k;
            for (k = response; k < end-3; ++k) {
                if (k == response || k[-1] == '\n') {
                    if (isdigit(k[0]) && isdigit(k[1]) && isdigit(k[2])) {
                        if (k[3] != '-') {
                            if (strstr(k, "\r\n")) {
                                code = strtol(k, 0, 10);
                                break;
                            }
                        }
                    }
                }
            }
        }

    } while (code == 0);


    if (code != expecting) {
        fprintf(stderr, "Error from server:\n");
        fprintf(stderr, "%s", response);
        exit(1);
    }

    printf("OK! Got: %s\n", response);
}

void send_format(SOCKET server, char *text, ...) {
    char buffer[1024];
    va_list args;
    va_start(args, text);
    vsprintf(buffer, text, args);
    va_end(args);

    send(server, buffer, strlen(buffer), 0);

    printf("Sent:'%s'", buffer);
}


void get_input(const char *prompt, char *buffer)
{
    printf("%s", prompt);

    buffer[0] = 0;
    fgets(buffer, MAXINPUT, stdin);
    const int read = strlen(buffer);
    if (read > 0 && buffer[read-1] == '\n')
        buffer[read-1] = 0;
}


SOCKET connect_to_host(char *hostname, char *port) {
    printf("Configuring remote address...\n");
    struct addrinfo hints;
    memset(&hints, 0, sizeof(hints));
    hints.ai_socktype = SOCK_STREAM;
    struct addrinfo *peer_address;
    if (getaddrinfo(hostname, port, &hints, &peer_address)) {
        fprintf(stderr, "getaddrinfo() failed. (%d)\n", GETSOCKETERRNO());
        exit(1);
    }

    printf("Remote address is: ");
    char address_buffer[100];
    char service_buffer[100];
    getnameinfo(peer_address->ai_addr, peer_address->ai_addrlen,
            address_buffer, sizeof(address_buffer),
            service_buffer, sizeof(service_buffer),
            NI_NUMERICHOST);
    printf("%s %s\n", address_buffer, service_buffer);

    printf("Creating socket...\n");
    SOCKET server;
    server = socket(peer_address->ai_family,
            peer_address->ai_socktype, peer_address->ai_protocol);
    if (!ISVALIDSOCKET(server)) {
        fprintf(stderr, "socket() failed. (%d)\n", GETSOCKETERRNO());
        exit(1);
    }

    printf("Connecting...\n");
    if (connect(server,
                peer_address->ai_addr, peer_address->ai_addrlen)) {
        fprintf(stderr, "connect() failed. (%d)\n", GETSOCKETERRNO());
        exit(1);
    }
    freeaddrinfo(peer_address);

    printf("Connected.\n\n");

    return server;
}



int main() {

#if defined(_WIN32)
    WSADATA d;
    if (WSAStartup(MAKEWORD(2, 2), &d)) {
        fprintf(stderr, "Failed to initialize.\n");
        return 1;
    }
#endif


    char hostname[MAXINPUT] = {};
    get_input("mail server: ", hostname);

    printf("Connecting to host: %s:25\n", hostname);

    SOCKET server = connect_to_host(hostname, "25");
    wait_on_response(server, 220);

    send_format(server, "HELO HONPWC\r\n");
    wait_on_response(server, 250);


    char *sender = "lv@aeuouoeuaoe.com";
    char *recipient = "lv@atdhq.com";

    send_format(server, "MAIL FROM:<%s>\r\n", sender);
    wait_on_response(server, 250);

    send_format(server, "RCPT TO:<%s>\r\n", recipient);
    wait_on_response(server, 250);

    send_format(server, "DATA\r\n");
    wait_on_response(server, 354);

    send_format(server, "From: \"Your best pal\" <%s>\r\n", sender);
    send_format(server, "To: \"Just a man\" <differnt@address.com>\r\n", recipient);
    send_format(server, "Subject:%s\r\n", "just a simple mail here");


    time_t timer;
    time(&timer);

    struct tm *timeinfo;
    timeinfo = gmtime(&timer);

    char date[128];
    strftime (date, 128, "%a, %d %b %Y %H:%M:%S +0000", timeinfo);

    send_format(server, "Date:%s\r\n", date);

    send_format(server, "\r\n");
    send_format(server, "Message for you. Haha.\r\n..\r\n.a");



    send_format(server, "\r\n.\r\n");
    wait_on_response(server, 250);

    send_format(server, "QUIT\r\n");
    wait_on_response(server, 221);

    printf("\nClosing socket...\n");
    CLOSESOCKET(server);

#if defined(_WIN32)
    WSACleanup();
#endif

    printf("Finished.\n");
    return 0;
}

