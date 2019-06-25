#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "dart-gui-osg" for configuration "Release"
set_property(TARGET dart-gui-osg APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(dart-gui-osg PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libdart-gui-osg.so.6.8.0"
  IMPORTED_SONAME_RELEASE "libdart-gui-osg.so.6.8"
  )

list(APPEND _IMPORT_CHECK_TARGETS dart-gui-osg )
list(APPEND _IMPORT_CHECK_FILES_FOR_dart-gui-osg "${_IMPORT_PREFIX}/lib/libdart-gui-osg.so.6.8.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
