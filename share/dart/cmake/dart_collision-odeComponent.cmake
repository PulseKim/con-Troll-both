set("dart_collision-ode_DEPENDENCIES" dart)
set("dart_collision-ode_LIBRARIES" dart-collision-ode)

set_property(DIRECTORY PROPERTY "DART_collision-ode_FOUND" TRUE)
foreach(external_dep ODE)
  include(${CMAKE_CURRENT_LIST_DIR}/DARTFind${external_dep}.cmake)

  string(TOUPPER ${external_dep} EXTERNAL_DEP_UPPER)
  if(NOT ${external_dep}_FOUND AND NOT ${EXTERNAL_DEP_UPPER}_FOUND)
    set_property(DIRECTORY PROPERTY DART_collision-ode_FOUND FALSE)
    if(NOT DART_FIND_QUIETLY)
      message(WARNING
        "Cannot retrieve dart-collision-ode because the dependency "
        "${external_dep} could not be found. This usually indicates a broken "
        "installation.")
    endif()
  endif()

endforeach()
