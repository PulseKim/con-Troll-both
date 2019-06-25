# Install script for directory: /home/mrl/dart/dart/gui/osg/render

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/gui/osg/render" TYPE FILE FILES
    "/home/mrl/dart/dart/gui/osg/render/CapsuleShapeNode.hpp"
    "/home/mrl/dart/dart/gui/osg/render/ShapeNode.hpp"
    "/home/mrl/dart/dart/gui/osg/render/BoxShapeNode.hpp"
    "/home/mrl/dart/dart/gui/osg/render/CylinderShapeNode.hpp"
    "/home/mrl/dart/dart/gui/osg/render/MultiSphereShapeNode.hpp"
    "/home/mrl/dart/dart/gui/osg/render/EllipsoidShapeNode.hpp"
    "/home/mrl/dart/dart/gui/osg/render/WarningShapeNode.hpp"
    "/home/mrl/dart/dart/gui/osg/render/SoftMeshShapeNode.hpp"
    "/home/mrl/dart/dart/gui/osg/render/LineSegmentShapeNode.hpp"
    "/home/mrl/dart/dart/gui/osg/render/MeshShapeNode.hpp"
    "/home/mrl/dart/dart/gui/osg/render/PlaneShapeNode.hpp"
    "/home/mrl/dart/dart/gui/osg/render/ConeShapeNode.hpp"
    "/home/mrl/dart/dart/gui/osg/render/SphereShapeNode.hpp"
    "/home/mrl/dart/HandTasks/dart/gui/osg/render/render.hpp"
    )
endif()
