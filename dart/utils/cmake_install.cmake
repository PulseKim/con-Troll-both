# Install script for directory: /home/mrl/dart/dart/utils

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dart/cmake/dart_utilsTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dart/cmake/dart_utilsTargets.cmake"
         "/home/mrl/dart/HandTasks/dart/utils/CMakeFiles/Export/share/dart/cmake/dart_utilsTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dart/cmake/dart_utilsTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dart/cmake/dart_utilsTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dart/cmake" TYPE FILE FILES "/home/mrl/dart/HandTasks/dart/utils/CMakeFiles/Export/share/dart/cmake/dart_utilsTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dart/cmake" TYPE FILE FILES "/home/mrl/dart/HandTasks/dart/utils/CMakeFiles/Export/share/dart/cmake/dart_utilsTargets-release.cmake")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart-utils.so.6.8.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart-utils.so.6.8"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart-utils.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/mrl/dart/HandTasks/lib/libdart-utils.so.6.8.0"
    "/home/mrl/dart/HandTasks/lib/libdart-utils.so.6.8"
    "/home/mrl/dart/HandTasks/lib/libdart-utils.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart-utils.so.6.8.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart-utils.so.6.8"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart-utils.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/mrl/dart/HandTasks/lib:/home/mrl/dart/HandTasks/dart/external/odelcpsolver:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/utils" TYPE FILE FILES
    "/home/mrl/dart/dart/utils/DartResourceRetriever.hpp"
    "/home/mrl/dart/dart/utils/C3D.hpp"
    "/home/mrl/dart/dart/utils/PackageResourceRetriever.hpp"
    "/home/mrl/dart/dart/utils/FileInfoWorld.hpp"
    "/home/mrl/dart/dart/utils/VskParser.hpp"
    "/home/mrl/dart/dart/utils/CompositeResourceRetriever.hpp"
    "/home/mrl/dart/dart/utils/XmlHelpers.hpp"
    "/home/mrl/dart/dart/utils/SkelParser.hpp"
    "/home/mrl/dart/dart/utils/FileInfoC3D.hpp"
    "/home/mrl/dart/dart/utils/FileInfoDof.hpp"
    "/home/mrl/dart/HandTasks/dart/utils/utils.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mrl/dart/HandTasks/dart/utils/sdf/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/utils/urdf/cmake_install.cmake")

endif()

