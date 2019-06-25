set("dart_optimizer-nlopt_DEPENDENCIES" dart)
set("dart_optimizer-nlopt_LIBRARIES" dart-optimizer-nlopt)

set_property(DIRECTORY PROPERTY "DART_optimizer-nlopt_FOUND" TRUE)
foreach(external_dep NLOPT)
  include(${CMAKE_CURRENT_LIST_DIR}/DARTFind${external_dep}.cmake)

  string(TOUPPER ${external_dep} EXTERNAL_DEP_UPPER)
  if(NOT ${external_dep}_FOUND AND NOT ${EXTERNAL_DEP_UPPER}_FOUND)
    set_property(DIRECTORY PROPERTY DART_optimizer-nlopt_FOUND FALSE)
    if(NOT DART_FIND_QUIETLY)
      message(WARNING
        "Cannot retrieve dart-optimizer-nlopt because the dependency "
        "${external_dep} could not be found. This usually indicates a broken "
        "installation.")
    endif()
  endif()

endforeach()
