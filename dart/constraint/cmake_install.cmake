# Install script for directory: /home/mrl/dart/dart/constraint

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/constraint" TYPE FILE FILES
    "/home/mrl/dart/dart/constraint/DantzigLCPSolver.hpp"
    "/home/mrl/dart/dart/constraint/JointConstraint.hpp"
    "/home/mrl/dart/dart/constraint/ConstraintBase.hpp"
    "/home/mrl/dart/dart/constraint/JointCoulombFrictionConstraint.hpp"
    "/home/mrl/dart/dart/constraint/BallJointConstraint.hpp"
    "/home/mrl/dart/dart/constraint/ContactConstraint.hpp"
    "/home/mrl/dart/dart/constraint/PGSLCPSolver.hpp"
    "/home/mrl/dart/dart/constraint/LCPSolver.hpp"
    "/home/mrl/dart/dart/constraint/ConstraintSolver.hpp"
    "/home/mrl/dart/dart/constraint/JointLimitConstraint.hpp"
    "/home/mrl/dart/dart/constraint/ServoMotorConstraint.hpp"
    "/home/mrl/dart/dart/constraint/SoftContactConstraint.hpp"
    "/home/mrl/dart/dart/constraint/BoxedLcpSolver.hpp"
    "/home/mrl/dart/dart/constraint/WeldJointConstraint.hpp"
    "/home/mrl/dart/dart/constraint/ConstrainedGroup.hpp"
    "/home/mrl/dart/dart/constraint/MimicMotorConstraint.hpp"
    "/home/mrl/dart/dart/constraint/DantzigBoxedLcpSolver.hpp"
    "/home/mrl/dart/dart/constraint/BalanceConstraint.hpp"
    "/home/mrl/dart/dart/constraint/BoxedLcpConstraintSolver.hpp"
    "/home/mrl/dart/dart/constraint/PgsBoxedLcpSolver.hpp"
    "/home/mrl/dart/dart/constraint/SmartPointer.hpp"
    "/home/mrl/dart/HandTasks/dart/constraint/constraint.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/constraint/detail" TYPE FILE FILES "/home/mrl/dart/dart/constraint/detail/BoxedLcpSolver-impl.hpp")
endif()

