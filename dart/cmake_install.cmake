# Install script for directory: /home/mrl/dart/dart

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dart/cmake/dart_dartTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dart/cmake/dart_dartTargets.cmake"
         "/home/mrl/dart/HandTasks/dart/CMakeFiles/Export/share/dart/cmake/dart_dartTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dart/cmake/dart_dartTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dart/cmake/dart_dartTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dart/cmake" TYPE FILE FILES "/home/mrl/dart/HandTasks/dart/CMakeFiles/Export/share/dart/cmake/dart_dartTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dart/cmake" TYPE FILE FILES "/home/mrl/dart/HandTasks/dart/CMakeFiles/Export/share/dart/cmake/dart_dartTargets-release.cmake")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart" TYPE FILE FILES "/home/mrl/dart/HandTasks/dart/config.hpp")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart.so.6.8.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart.so.6.8"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/mrl/dart/HandTasks/lib/libdart.so.6.8.0"
    "/home/mrl/dart/HandTasks/lib/libdart.so.6.8"
    "/home/mrl/dart/HandTasks/lib/libdart.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart.so.6.8.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart.so.6.8"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/mrl/dart/HandTasks/dart/external/odelcpsolver:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart" TYPE FILE FILES "/home/mrl/dart/dart/dart.hpp")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mrl/dart/HandTasks/dart/external/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/common/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/math/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/integration/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/lcpsolver/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/optimizer/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/dynamics/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/collision/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/constraint/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/simulation/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/planning/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/utils/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/gui/cmake_install.cmake")

endif()

