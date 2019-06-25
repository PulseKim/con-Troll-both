# Install script for directory: /home/mrl/dart/dart/collision

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/collision" TYPE FILE FILES
    "/home/mrl/dart/dart/collision/DistanceResult.hpp"
    "/home/mrl/dart/dart/collision/Option.hpp"
    "/home/mrl/dart/dart/collision/DistanceFilter.hpp"
    "/home/mrl/dart/dart/collision/CollisionGroup.hpp"
    "/home/mrl/dart/dart/collision/CollisionDetector.hpp"
    "/home/mrl/dart/dart/collision/DistanceOption.hpp"
    "/home/mrl/dart/dart/collision/CollisionFilter.hpp"
    "/home/mrl/dart/dart/collision/Contact.hpp"
    "/home/mrl/dart/dart/collision/CollisionOption.hpp"
    "/home/mrl/dart/dart/collision/CollisionResult.hpp"
    "/home/mrl/dart/dart/collision/CollisionObject.hpp"
    "/home/mrl/dart/dart/collision/Result.hpp"
    "/home/mrl/dart/dart/collision/SmartPointer.hpp"
    "/home/mrl/dart/HandTasks/dart/collision/collision.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/collision/detail" TYPE FILE FILES
    "/home/mrl/dart/dart/collision/detail/CollisionGroup.hpp"
    "/home/mrl/dart/dart/collision/detail/CollisionDetector.hpp"
    "/home/mrl/dart/dart/collision/detail/UnorderedPairs.hpp"
    "/home/mrl/dart/dart/collision/detail/Contact-impl.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mrl/dart/HandTasks/dart/collision/dart/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/collision/fcl/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/collision/ode/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/collision/bullet/cmake_install.cmake")

endif()

