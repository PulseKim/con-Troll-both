#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "dart-collision-ode" for configuration "Release"
set_property(TARGET dart-collision-ode APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(dart-collision-ode PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libdart-collision-ode.so.6.8.0"
  IMPORTED_SONAME_RELEASE "libdart-collision-ode.so.6.8"
  )

list(APPEND _IMPORT_CHECK_TARGETS dart-collision-ode )
list(APPEND _IMPORT_CHECK_FILES_FOR_dart-collision-ode "${_IMPORT_PREFIX}/lib/libdart-collision-ode.so.6.8.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
