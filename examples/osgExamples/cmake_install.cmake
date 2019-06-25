# Install script for directory: /home/mrl/dart/examples/osgExamples

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mrl/dart/HandTasks/examples/osgExamples/osgAtlasPuppet/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/osgExamples/osgAtlasSimbicon/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/osgExamples/osgBoxStacking/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/osgExamples/osgDragAndDrop/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/osgExamples/osgEmpty/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/osgExamples/osgHuboPuppet/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/osgExamples/osgImGui/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/osgExamples/osgOperationalSpaceControl/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/osgExamples/osgSoftBodies/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/osgExamples/osgTinkertoy/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/osgExamples/osgWamIkFast/cmake_install.cmake")

endif()

