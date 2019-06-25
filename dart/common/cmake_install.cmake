# Install script for directory: /home/mrl/dart/dart/common

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/common" TYPE FILE FILES
    "/home/mrl/dart/dart/common/SharedLibrary.hpp"
    "/home/mrl/dart/dart/common/Factory.hpp"
    "/home/mrl/dart/dart/common/sub_ptr.hpp"
    "/home/mrl/dart/dart/common/StlHelpers.hpp"
    "/home/mrl/dart/dart/common/Platform.hpp"
    "/home/mrl/dart/dart/common/Cloneable.hpp"
    "/home/mrl/dart/dart/common/ResourceRetriever.hpp"
    "/home/mrl/dart/dart/common/Singleton.hpp"
    "/home/mrl/dart/dart/common/Memory.hpp"
    "/home/mrl/dart/dart/common/Virtual.hpp"
    "/home/mrl/dart/dart/common/Signal.hpp"
    "/home/mrl/dart/dart/common/Subject.hpp"
    "/home/mrl/dart/dart/common/VersionCounter.hpp"
    "/home/mrl/dart/dart/common/EmbeddedAspect.hpp"
    "/home/mrl/dart/dart/common/LocalResourceRetriever.hpp"
    "/home/mrl/dart/dart/common/Deprecated.hpp"
    "/home/mrl/dart/dart/common/Timer.hpp"
    "/home/mrl/dart/dart/common/NameManager.hpp"
    "/home/mrl/dart/dart/common/RequiresAspect.hpp"
    "/home/mrl/dart/dart/common/LocalResource.hpp"
    "/home/mrl/dart/dart/common/Empty.hpp"
    "/home/mrl/dart/dart/common/Resource.hpp"
    "/home/mrl/dart/dart/common/Observer.hpp"
    "/home/mrl/dart/dart/common/ProxyAspect.hpp"
    "/home/mrl/dart/dart/common/CompositeJoiner.hpp"
    "/home/mrl/dart/dart/common/SpecializedForAspect.hpp"
    "/home/mrl/dart/dart/common/Aspect.hpp"
    "/home/mrl/dart/dart/common/Console.hpp"
    "/home/mrl/dart/dart/common/LockableReference.hpp"
    "/home/mrl/dart/dart/common/Uri.hpp"
    "/home/mrl/dart/dart/common/Composite.hpp"
    "/home/mrl/dart/dart/common/AspectWithVersion.hpp"
    "/home/mrl/dart/dart/common/SmartPointer.hpp"
    "/home/mrl/dart/HandTasks/dart/common/common.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/common/detail" TYPE FILE FILES
    "/home/mrl/dart/dart/common/detail/sub_ptr.hpp"
    "/home/mrl/dart/dart/common/detail/TemplateJoinerDispatchMacro.hpp"
    "/home/mrl/dart/dart/common/detail/Cloneable.hpp"
    "/home/mrl/dart/dart/common/detail/SharedLibraryManager.hpp"
    "/home/mrl/dart/dart/common/detail/Factory-impl.hpp"
    "/home/mrl/dart/dart/common/detail/LockableReference-impl.hpp"
    "/home/mrl/dart/dart/common/detail/Signal.hpp"
    "/home/mrl/dart/dart/common/detail/ConnectionBody.hpp"
    "/home/mrl/dart/dart/common/detail/EmbeddedAspect.hpp"
    "/home/mrl/dart/dart/common/detail/NoOp.hpp"
    "/home/mrl/dart/dart/common/detail/NameManager.hpp"
    "/home/mrl/dart/dart/common/detail/RequiresAspect.hpp"
    "/home/mrl/dart/dart/common/detail/ProxyAspect.hpp"
    "/home/mrl/dart/dart/common/detail/CompositeJoiner.hpp"
    "/home/mrl/dart/dart/common/detail/Memory-impl.hpp"
    "/home/mrl/dart/dart/common/detail/SpecializedForAspect.hpp"
    "/home/mrl/dart/dart/common/detail/Aspect.hpp"
    "/home/mrl/dart/dart/common/detail/Singleton-impl.hpp"
    "/home/mrl/dart/dart/common/detail/AlignedAllocator.hpp"
    "/home/mrl/dart/dart/common/detail/CompositeData.hpp"
    "/home/mrl/dart/dart/common/detail/Composite.hpp"
    "/home/mrl/dart/dart/common/detail/AspectWithVersion.hpp"
    )
endif()

