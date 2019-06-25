#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "dart-collision-bullet" for configuration "Release"
set_property(TARGET dart-collision-bullet APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(dart-collision-bullet PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libdart-collision-bullet.so.6.8.0"
  IMPORTED_SONAME_RELEASE "libdart-collision-bullet.so.6.8"
  )

list(APPEND _IMPORT_CHECK_TARGETS dart-collision-bullet )
list(APPEND _IMPORT_CHECK_FILES_FOR_dart-collision-bullet "${_IMPORT_PREFIX}/lib/libdart-collision-bullet.so.6.8.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
