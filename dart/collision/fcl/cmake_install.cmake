# Install script for directory: /home/mrl/dart/dart/collision/fcl

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/collision/fcl" TYPE FILE FILES
    "/home/mrl/dart/dart/collision/fcl/BackwardCompatibility.hpp"
    "/home/mrl/dart/dart/collision/fcl/FCLCollisionObject.hpp"
    "/home/mrl/dart/dart/collision/fcl/FCLTypes.hpp"
    "/home/mrl/dart/dart/collision/fcl/CollisionShapes.hpp"
    "/home/mrl/dart/dart/collision/fcl/tri_tri_intersection_test.hpp"
    "/home/mrl/dart/dart/collision/fcl/FCLCollisionGroup.hpp"
    "/home/mrl/dart/dart/collision/fcl/FCLCollisionDetector.hpp"
    "/home/mrl/dart/HandTasks/dart/collision/fcl/fcl.hpp"
    )
endif()

