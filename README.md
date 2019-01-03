[![Build Status](https://travis-ci.org/codeplea/Hands-On-Network-Programming-with-C.svg?branch=master)](https://travis-ci.org/codeplea/Hands-On-Network-Programming-with-C)
[![Build status](https://ci.appveyor.com/api/projects/status/0swjf3ss11ep244f?svg=true)](https://ci.appveyor.com/project/codeplea/hands-on-network-programming-with-c)

# Hands-On-Network-Programming-with-C

This repo contains the code which accompanies the book "Hands-On Network
Programming with C", written by Lewis Van Winkle. The code is released under
the MIT license.

Unless otherwise noted, all programs will compile cleanly on Windows, Linux,
and macOS, and as C or C++. Code is tested with MinGW and Visual Studio on
Windows, gcc and clang on Linux and macOS.


## Chapter 1

* **chap01/win_init.c** Example code to initialize Winsock. (Windows only)
* **chap01/win_list.c** List all local IP addresses. (Windows only)
* **chap01/unix_list.c** List all local IP addresses. (Linux and macOS only)

## Chapter 2

* **chap02/sock_init.c** Example program to include all needed headers and initialize.
* **chap02/time_console.c** Prints to console the current date and time.
* **chap02/time_server.c** Serves a web page giving current date and time.
* **chap02/time_server_ipv6.c** As above, but listening for IPv6 connections.
* **chap02/time_server_dual.c** As above, but listening for IPv6/IPv4 dual stack connections.

## Chapter 3

* **chap03/tcp_client.c** Establish TCP connection and send/receive data from the console.
* **chap03/tcp_serve_toupper.c** TCP server servicing multiple connections using `select()`. Echos received data back to client in all upper-case.
* **chap03/tcp_serve_toupper_fork.c** As above, but uses `fork()` instead of `select()`. (Linux and macOS only)
* **chap03/tcp_serve_chat.c** TCP server which relays received data to every other connected client.

## Chapter 4

* **chap04/udp_client.c** Send/receive UDP data from the console.
* **chap04/udp_recvfrom.c** Uses `recvfrom()` to receive one UDP packet.
* **chap04/udp_sendto.c** Uses `sendto()` to send one UDP packet.
* **chap04/udp_serve_toupper.c** Receives UDP data, and echos it back to the sender in all upper-case.
* **chap04/udp_serve_toupper_simple.c** As above, but doesn't use `select()`.

## Chapter 5

* **chap05/lookup.c** Uses `getaddrinfo()` to lookup addresses for a given hostname.
* **chap05/dns_query.c** Encodes and sends a DNS query, then decodes the response.

## Chapter 6

* **chap06/web_get.c** A minimal HTTP client which will download a web resource from a given URL.

## Chapter 7

* **chap07/web_server.c** A minimal web server.
* **chap07/web_server2.c** A minimal web server (no globals).
