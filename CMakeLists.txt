cmake_minimum_required(VERSION 3.19)

# set the project name and version
project(hands_on_net_programming VERSION 0.0.1 LANGUAGES C)
string(TOLOWER "${PROJECT_NAME}" PROJECT_LOWER_NAME)

set(CMAKE_C_STANDARD 90)
set(CMAKE_VERBOSE_MAKEFILE ON)

add_library("${PROJECT_LOWER_NAME}_compiler_flags" INTERFACE)
target_compile_features("${PROJECT_LOWER_NAME}_compiler_flags" INTERFACE "c_std_90")

# add compiler warning flags just when building this project via
# the BUILD_INTERFACE genex
set(gcc_like "$<COMPILE_LANG_AND_ID:C,CXX,ARMClang,AppleClang,Clang,GNU>")
set(msvc "$<COMPILE_LANG_AND_ID:C,CXX,MSVC>")
target_compile_options(
        "${PROJECT_LOWER_NAME}_compiler_flags"
        INTERFACE
        "$<${gcc_like}:$<BUILD_INTERFACE:-Wshadow;-Wformat=2;-Wall;-Wunused-macros;-pedantic>>"
        # "-Wgnu-zero-variadic-macro-arguments"
        "$<${msvc}:$<BUILD_INTERFACE:-W3;-WX;-Zi;-permissive->>"
)

# control where the static and shared libraries are built so that on windows
# we don't need to tinker with the path to run the executable
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")

option(BUILD_SHARED_LIBS "Build using shared libraries" OFF)

if(APPLE)
    set(CMAKE_INSTALL_RPATH "@executable_path/../lib")
elseif(UNIX)
    set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib")
endif()

configure_file(
        "${PROJECT_NAME}Config.h.in"
        "config/${PROJECT_NAME}Config.h"
)

foreach(chapter RANGE 1 13)
    if(chapter LESS 10)
        set(chapter "0${chapter}")
    endif()
    if(chapter EQUAL 12)
        continue ()
    endif ()
    add_subdirectory("chap${chapter}")
    message(STATUS "Built chap${chapter}")
endforeach ()

if (BUILD_TESTS)
    add_subdirectory("test")
    message(STATUS "test")
endif ()

#set_target_properties(
#        "${PROJECT_NAME}"
#        PROPERTIES
#        LINKER_LANGUAGE
#        C
#)

## add the binary tree to the search path for include files
## so that we will find "${PROJECT_NAME}Config.h"
#target_include_directories(
#        "${PROJECT_NAME}"
#        PUBLIC
#        "${PROJECT_BINARY_DIR}/config"
#)
