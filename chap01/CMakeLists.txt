get_filename_component(EXEC_NAME "${CMAKE_CURRENT_SOURCE_DIR}" NAME)
string(REPLACE " " "_" EXEC_NAME "${EXEC_NAME}")

message(EXEC_NAME = "${EXEC_NAME}")
if (WIN32)
  if (WIN_INIT)
    set(Source_Files "win_init.c")
  else ()
    set(Source_Files "win_list.c")
  endif ()
else ()
  set(Source_Files "unix_list.c")
endif ()
source_group("Source Files" FILES "${Source_Files}")

add_executable("${EXEC_NAME}" "${Source_Files}")

target_include_directories(
        "${EXEC_NAME}"
        INTERFACE
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>"
        "$<INSTALL_INTERFACE:include>"
)

target_link_libraries("${EXEC_NAME}" INTERFACE "${PROJECT_LOWER_NAME}_compiler_flags")
if (WIN32)
  target_link_libraries("${EXEC_NAME}" PRIVATE wsock32 ws2_32)
endif ()

set_target_properties(
        "${EXEC_NAME}"
        PROPERTIES
        LINKER_LANGUAGE
        C
)

# setup the version numbering
#set_property(TARGET "${EXEC_NAME}" PROPERTY VERSION "1.0.0")
#set_property(TARGET "${EXEC_NAME}" PROPERTY SOVERSION "1")

# install rules
set(installable_libs "${EXEC_NAME}" "${PROJECT_LOWER_NAME}_compiler_flags")
if (TARGET "${DEPENDANT_LIBRARY}")
  list(APPEND installable_libs "${DEPENDANT_LIBRARY}")
endif ()
install(TARGETS ${installable_libs}
        DESTINATION "bin"
        EXPORT "${EXEC_NAME}Targets")
