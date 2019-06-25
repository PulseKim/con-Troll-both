# Install script for directory: /home/mrl/dart/examples

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
  include("/home/mrl/dart/HandTasks/examples/addDeleteSkels/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/atlasSimbicon/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/bipedStand/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/hardcodedDesign/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/hybridDynamics/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/jointConstraints/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/mixedChain/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/operationalSpaceControl/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/rigidChain/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/rigidCubes/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/rigidLoop/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/rigidShapes/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/simpleFrames/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/softBodies/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/speedTest/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/vehicle/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/humanJointLimits/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/examples/osgExamples/cmake_install.cmake")

endif()

