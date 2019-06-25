# Install script for directory: /home/mrl/dart/dart/gui/osg

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dart/cmake/dart_gui-osgTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dart/cmake/dart_gui-osgTargets.cmake"
         "/home/mrl/dart/HandTasks/dart/gui/osg/CMakeFiles/Export/share/dart/cmake/dart_gui-osgTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dart/cmake/dart_gui-osgTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dart/cmake/dart_gui-osgTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dart/cmake" TYPE FILE FILES "/home/mrl/dart/HandTasks/dart/gui/osg/CMakeFiles/Export/share/dart/cmake/dart_gui-osgTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dart/cmake" TYPE FILE FILES "/home/mrl/dart/HandTasks/dart/gui/osg/CMakeFiles/Export/share/dart/cmake/dart_gui-osgTargets-release.cmake")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart-gui-osg.so.6.8.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart-gui-osg.so.6.8"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart-gui-osg.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/mrl/dart/HandTasks/lib/libdart-gui-osg.so.6.8.0"
    "/home/mrl/dart/HandTasks/lib/libdart-gui-osg.so.6.8"
    "/home/mrl/dart/HandTasks/lib/libdart-gui-osg.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart-gui-osg.so.6.8.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart-gui-osg.so.6.8"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdart-gui-osg.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/mrl/dart/HandTasks/lib:/home/mrl/dart/HandTasks/dart/external/odelcpsolver:/home/mrl/dart/HandTasks/dart/external/lodepng:/home/mrl/dart/HandTasks/dart/external/imgui:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/gui/osg" TYPE FILE FILES
    "/home/mrl/dart/dart/gui/osg/Utils.hpp"
    "/home/mrl/dart/dart/gui/osg/WorldNode.hpp"
    "/home/mrl/dart/dart/gui/osg/TrackballManipulator.hpp"
    "/home/mrl/dart/dart/gui/osg/Viewer.hpp"
    "/home/mrl/dart/dart/gui/osg/InteractiveFrame.hpp"
    "/home/mrl/dart/dart/gui/osg/ShapeFrameNode.hpp"
    "/home/mrl/dart/dart/gui/osg/ImGuiWidget.hpp"
    "/home/mrl/dart/dart/gui/osg/RealTimeWorldNode.hpp"
    "/home/mrl/dart/dart/gui/osg/SupportPolygonVisual.hpp"
    "/home/mrl/dart/dart/gui/osg/ImGuiViewer.hpp"
    "/home/mrl/dart/dart/gui/osg/DragAndDrop.hpp"
    "/home/mrl/dart/dart/gui/osg/MouseEventHandler.hpp"
    "/home/mrl/dart/dart/gui/osg/DefaultEventHandler.hpp"
    "/home/mrl/dart/dart/gui/osg/ImGuiHandler.hpp"
    "/home/mrl/dart/HandTasks/dart/gui/osg/osg.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mrl/dart/HandTasks/dart/gui/osg/render/cmake_install.cmake")

endif()

