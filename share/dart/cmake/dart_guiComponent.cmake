set("dart_gui_DEPENDENCIES" utils;external-lodepng;external-imgui)
set("dart_gui_LIBRARIES" dart-gui)

set_property(DIRECTORY PROPERTY "DART_gui_FOUND" TRUE)
foreach(external_dep OpenGL;GLUT)
  include(${CMAKE_CURRENT_LIST_DIR}/DARTFind${external_dep}.cmake)

  string(TOUPPER ${external_dep} EXTERNAL_DEP_UPPER)
  if(NOT ${external_dep}_FOUND AND NOT ${EXTERNAL_DEP_UPPER}_FOUND)
    set_property(DIRECTORY PROPERTY DART_gui_FOUND FALSE)
    if(NOT DART_FIND_QUIETLY)
      message(WARNING
        "Cannot retrieve dart-gui because the dependency "
        "${external_dep} could not be found. This usually indicates a broken "
        "installation.")
    endif()
  endif()

endforeach()
