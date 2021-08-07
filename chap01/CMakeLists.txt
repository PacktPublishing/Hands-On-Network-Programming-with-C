get_filename_component(DIR_NAME "${CMAKE_CURRENT_SOURCE_DIR}" NAME)
string(REPLACE " " "_" DIR_NAME "${DIR_NAME}")

if (WIN32)
  set(_targets "win_init" "win_list")
else ()
  set(_targets "unix_list")
endif ()

foreach(EXEC_NAME "${_targets}")

  set(Source_Files "${EXEC_NAME}.c")
  source_group("Source Files" FILES "${Source_Files}")

  set(TARGET_NAME "${DIR_NAME}_${EXEC_NAME}")
  add_executable("${TARGET_NAME}" "${Source_Files}")

  target_include_directories(
          "${TARGET_NAME}"
          INTERFACE
          "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>"
          "$<INSTALL_INTERFACE:include>"
  )

  target_link_libraries("${TARGET_NAME}" INTERFACE "${PROJECT_LOWER_NAME}_compiler_flags")
  if (WIN32)
    target_link_libraries("${TARGET_NAME}" PRIVATE wsock32 ws2_32 iphlpapi)
  endif ()

  set_target_properties(
          "${TARGET_NAME}"
          PROPERTIES
          LINKER_LANGUAGE
          C
  )

  # setup the version numbering
  #set_property(TARGET "${TARGET_NAME}" PROPERTY VERSION "1.0.0")
  #set_property(TARGET "${TARGET_NAME}" PROPERTY SOVERSION "1")

  # install rules
  set(installable_libs "${TARGET_NAME}" "${PROJECT_LOWER_NAME}_compiler_flags")
  if (TARGET "${DEPENDANT_LIBRARY}")
    list(APPEND installable_libs "${DEPENDANT_LIBRARY}")
  endif ()
  install(TARGETS ${installable_libs}
          DESTINATION "bin/"
          EXPORT "${TARGET_NAME}Targets")

endforeach (EXEC_NAME)

