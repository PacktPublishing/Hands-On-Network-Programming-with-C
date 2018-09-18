#include <stdio.h>

int main()
{

    printf("\n");
    printf("os: ");
#if defined(_WIN32)
    printf("windows\n");
#elif defined(__linux__)
    printf("linux\n");
#elif defined(__APPLE__)
    printf("osx\n");
#else
    printf("unknown\n");
#endif


    printf("compiler: ");
#if defined(_MSC_VER)
#if _MSC_VER == 1800
    printf("msc 2013\n");
#elif _MSC_VER == 1900
    printf("msc 2015\n");
#elif _MSC_VER >= 1910 && _MSC_VER <= 1915
    printf("msc 2017\n");
#else
    printf("msc unknown %d\n", _MSC_VER);
#endif
#elif defined(__clang__)
    printf("clang-%d.%d\n", __clang_major__, __clang_minor__);
#elif defined(__GNUC__)
    printf("gcc-%d.%d\n", __GNUC__, __GNUC_MINOR__);
#else
    printf("unknown\n");
#endif


printf("language: ");
#ifdef __cplusplus
    printf("c++\n");
#else
    printf("c\n");
#endif

    printf("arch: ");
    if (sizeof(void*) == 4) {
        printf("x86\n");
    } else if (sizeof(void*) == 8) {
        printf("x64\n");
    } else {
        printf("unknown\n");
    }


    printf("\n");
    return 0;
}
