#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0600
#endif

#include <winsock2.h>
#include <iphlpapi.h>
#include <ws2tcpip.h>
#include <stdio.h>
#include <stdlib.h>

#pragma comment(lib, "ws2_32.lib")
#pragma comment(lib, "iphlpapi.lib")

int main() {

    WSADATA d;
    if (WSAStartup(MAKEWORD(2, 2), &d)) {
        printf("Failed to initialize.\n");
        return -1;
    }


    DWORD asize = 20000;
    PIP_ADAPTER_ADDRESSES addresses;
    do {
        addresses = (PIP_ADAPTER_ADDRESSES)malloc(asize);

        if (!addresses) {
            printf("Couldn't allocate %ld bytes for addresses.\n", asize);
            WSACleanup();
            return -1;
        }

        int r = GetAdaptersAddresses(AF_UNSPEC, GAA_FLAG_INCLUDE_PREFIX, 0, addresses, &asize);
        if (r == ERROR_BUFFER_OVERFLOW) {
            printf("GetAdaptersAddresses wants %ld bytes.\n", asize);
            free(addresses);
        } else if (r == ERROR_SUCCESS) {
            break;
        } else {
            printf("Error from GetAdaptersAddresses: %d\n", r);
            free(addresses);
            WSACleanup();
            return -1;
        }
    } while (!addresses);


    PIP_ADAPTER_ADDRESSES address = addresses;
    while (address) {
        printf("\nAdapter name: %S\n", address->FriendlyName);

        PIP_ADAPTER_UNICAST_ADDRESS add = address->FirstUnicastAddress;
        while (add) {
            printf("\t%s", add->Address.lpSockaddr->sa_family == AF_INET ? "IPv4" : "IPv6");

            char ap[100];

            getnameinfo(add->Address.lpSockaddr, add->Address.iSockaddrLength, ap, sizeof(ap), 0, 0, NI_NUMERICHOST);
            printf("\t%s\n", ap);

            add = add->Next;
        }

        address = address->Next;
    }


    free(addresses);
    WSACleanup();
    return 0;
}
