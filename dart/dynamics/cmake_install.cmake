# Install script for directory: /home/mrl/dart/dart/dynamics

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/dynamics" TYPE FILE FILES
    "/home/mrl/dart/dart/dynamics/CapsuleShape.hpp"
    "/home/mrl/dart/dart/dynamics/Branch.hpp"
    "/home/mrl/dart/dart/dynamics/MultiSphereShape.hpp"
    "/home/mrl/dart/dart/dynamics/AssimpInputResourceAdaptor.hpp"
    "/home/mrl/dart/dart/dynamics/Skeleton.hpp"
    "/home/mrl/dart/dart/dynamics/InverseKinematics.hpp"
    "/home/mrl/dart/dart/dynamics/BoxShape.hpp"
    "/home/mrl/dart/dart/dynamics/ArrowShape.hpp"
    "/home/mrl/dart/dart/dynamics/WeldJoint.hpp"
    "/home/mrl/dart/dart/dynamics/ScrewJoint.hpp"
    "/home/mrl/dart/dart/dynamics/FixedFrame.hpp"
    "/home/mrl/dart/dart/dynamics/EulerJoint.hpp"
    "/home/mrl/dart/dart/dynamics/BodyNode.hpp"
    "/home/mrl/dart/dart/dynamics/Linkage.hpp"
    "/home/mrl/dart/dart/dynamics/ShapeNode.hpp"
    "/home/mrl/dart/dart/dynamics/SimpleFrame.hpp"
    "/home/mrl/dart/dart/dynamics/BallJoint.hpp"
    "/home/mrl/dart/dart/dynamics/SoftBodyNode.hpp"
    "/home/mrl/dart/dart/dynamics/CompositeNode.hpp"
    "/home/mrl/dart/dart/dynamics/Shape.hpp"
    "/home/mrl/dart/dart/dynamics/Inertia.hpp"
    "/home/mrl/dart/dart/dynamics/SphereShape.hpp"
    "/home/mrl/dart/dart/dynamics/ShapeFrame.hpp"
    "/home/mrl/dart/dart/dynamics/CylinderShape.hpp"
    "/home/mrl/dart/dart/dynamics/FreeJoint.hpp"
    "/home/mrl/dart/dart/dynamics/UniversalJoint.hpp"
    "/home/mrl/dart/dart/dynamics/ZeroDofJoint.hpp"
    "/home/mrl/dart/dart/dynamics/ReferentialSkeleton.hpp"
    "/home/mrl/dart/dart/dynamics/EntityNode.hpp"
    "/home/mrl/dart/dart/dynamics/InvalidIndex.hpp"
    "/home/mrl/dart/dart/dynamics/HierarchicalIK.hpp"
    "/home/mrl/dart/dart/dynamics/Node.hpp"
    "/home/mrl/dart/dart/dynamics/SoftMeshShape.hpp"
    "/home/mrl/dart/dart/dynamics/MetaSkeleton.hpp"
    "/home/mrl/dart/dart/dynamics/FixedJacobianNode.hpp"
    "/home/mrl/dart/dart/dynamics/ConeShape.hpp"
    "/home/mrl/dart/dart/dynamics/Entity.hpp"
    "/home/mrl/dart/dart/dynamics/SpecializedNodeManager.hpp"
    "/home/mrl/dart/dart/dynamics/MultiSphereConvexHullShape.hpp"
    "/home/mrl/dart/dart/dynamics/TranslationalJoint2D.hpp"
    "/home/mrl/dart/dart/dynamics/Group.hpp"
    "/home/mrl/dart/dart/dynamics/MeshShape.hpp"
    "/home/mrl/dart/dart/dynamics/PlanarJoint.hpp"
    "/home/mrl/dart/dart/dynamics/LineSegmentShape.hpp"
    "/home/mrl/dart/dart/dynamics/EllipsoidShape.hpp"
    "/home/mrl/dart/dart/dynamics/TemplatedJacobianNode.hpp"
    "/home/mrl/dart/dart/dynamics/Joint.hpp"
    "/home/mrl/dart/dart/dynamics/HeightmapShape.hpp"
    "/home/mrl/dart/dart/dynamics/GenericJoint.hpp"
    "/home/mrl/dart/dart/dynamics/EndEffector.hpp"
    "/home/mrl/dart/dart/dynamics/RevoluteJoint.hpp"
    "/home/mrl/dart/dart/dynamics/PrismaticJoint.hpp"
    "/home/mrl/dart/dart/dynamics/TranslationalJoint.hpp"
    "/home/mrl/dart/dart/dynamics/SharedLibraryIkFast.hpp"
    "/home/mrl/dart/dart/dynamics/NodeManagerJoiner.hpp"
    "/home/mrl/dart/dart/dynamics/Frame.hpp"
    "/home/mrl/dart/dart/dynamics/VoxelGridShape.hpp"
    "/home/mrl/dart/dart/dynamics/JacobianNode.hpp"
    "/home/mrl/dart/dart/dynamics/Marker.hpp"
    "/home/mrl/dart/dart/dynamics/DegreeOfFreedom.hpp"
    "/home/mrl/dart/dart/dynamics/SmartPointer.hpp"
    "/home/mrl/dart/dart/dynamics/Chain.hpp"
    "/home/mrl/dart/dart/dynamics/IkFast.hpp"
    "/home/mrl/dart/dart/dynamics/PointMass.hpp"
    "/home/mrl/dart/dart/dynamics/PlaneShape.hpp"
    "/home/mrl/dart/HandTasks/dart/dynamics/dynamics.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/dynamics/detail" TYPE FILE FILES
    "/home/mrl/dart/dart/dynamics/detail/SkeletonAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/BasicNodeManager.hpp"
    "/home/mrl/dart/dart/dynamics/detail/Skeleton.hpp"
    "/home/mrl/dart/dart/dynamics/detail/InverseKinematics.hpp"
    "/home/mrl/dart/dart/dynamics/detail/InverseKinematicsPtr.hpp"
    "/home/mrl/dart/dart/dynamics/detail/BodyNode.hpp"
    "/home/mrl/dart/dart/dynamics/detail/ShapeNode.hpp"
    "/home/mrl/dart/dart/dynamics/detail/ScrewJointAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/CompositeNode.hpp"
    "/home/mrl/dart/dart/dynamics/detail/Shape.hpp"
    "/home/mrl/dart/dart/dynamics/detail/BodyNodeAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/TranslationalJoint2DAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/DegreeOfFreedomPtr.hpp"
    "/home/mrl/dart/dart/dynamics/detail/ShapeFrameAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/UniversalJointAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/JointPtr.hpp"
    "/home/mrl/dart/dart/dynamics/detail/EulerJointAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/EntityNode.hpp"
    "/home/mrl/dart/dart/dynamics/detail/GenericJointAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/SoftBodyNodeAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/Node.hpp"
    "/home/mrl/dart/dart/dynamics/detail/EntityNodeAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/FixedJacobianNode.hpp"
    "/home/mrl/dart/dart/dynamics/detail/FixedFrameAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/BodyNodePtr.hpp"
    "/home/mrl/dart/dart/dynamics/detail/SpecializedNodeManager.hpp"
    "/home/mrl/dart/dart/dynamics/detail/PlanarJointAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/TemplatedJacobianNode.hpp"
    "/home/mrl/dart/dart/dynamics/detail/RevoluteJointAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/GenericJoint.hpp"
    "/home/mrl/dart/dart/dynamics/detail/PrismaticJointAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/JointAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/EndEffectorAspect.hpp"
    "/home/mrl/dart/dart/dynamics/detail/NodePtr.hpp"
    "/home/mrl/dart/dart/dynamics/detail/HeightmapShape-impl.hpp"
    "/home/mrl/dart/dart/dynamics/detail/NodeManagerJoiner.hpp"
    "/home/mrl/dart/dart/dynamics/detail/MarkerAspect.hpp"
    )
endif()

