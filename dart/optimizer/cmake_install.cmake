# Install script for directory: /home/mrl/dart/dart/optimizer

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/optimizer" TYPE FILE FILES
    "/home/mrl/dart/dart/optimizer/MultiObjectiveSolver.hpp"
    "/home/mrl/dart/dart/optimizer/GenericMultiObjectiveProblem.hpp"
    "/home/mrl/dart/dart/optimizer/GradientDescentSolver.hpp"
    "/home/mrl/dart/dart/optimizer/MultiObjectiveProblem.hpp"
    "/home/mrl/dart/dart/optimizer/Population.hpp"
    "/home/mrl/dart/dart/optimizer/Function.hpp"
    "/home/mrl/dart/dart/optimizer/Problem.hpp"
    "/home/mrl/dart/dart/optimizer/Solver.hpp"
    "/home/mrl/dart/HandTasks/dart/optimizer/optimizer.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mrl/dart/HandTasks/dart/optimizer/ipopt/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/optimizer/nlopt/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/optimizer/pagmo/cmake_install.cmake")
  include("/home/mrl/dart/HandTasks/dart/optimizer/snopt/cmake_install.cmake")

endif()

