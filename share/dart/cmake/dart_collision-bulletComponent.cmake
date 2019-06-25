set("dart_collision-bullet_DEPENDENCIES" dart)
set("dart_collision-bullet_LIBRARIES" dart-collision-bullet)

set_property(DIRECTORY PROPERTY "DART_collision-bullet_FOUND" TRUE)
foreach(external_dep Bullet)
  include(${CMAKE_CURRENT_LIST_DIR}/DARTFind${external_dep}.cmake)

  string(TOUPPER ${external_dep} EXTERNAL_DEP_UPPER)
  if(NOT ${external_dep}_FOUND AND NOT ${EXTERNAL_DEP_UPPER}_FOUND)
    set_property(DIRECTORY PROPERTY DART_collision-bullet_FOUND FALSE)
    if(NOT DART_FIND_QUIETLY)
      message(WARNING
        "Cannot retrieve dart-collision-bullet because the dependency "
        "${external_dep} could not be found. This usually indicates a broken "
        "installation.")
    endif()
  endif()

endforeach()
