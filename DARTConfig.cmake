###############################################################################
# CMake config file for DART
#
# This sets the following variables:
#   DART_INCLUDE_DIRS - Directories containing the DART include files.
#   DART_LIBRARIES    - Libraries needed to use DART.
#   DART_VERSION      - DART version.
#
# and the following `IMPORTED` targets:
#   dart     - Main target.
#   dart-<C> - Target for specific component (e.g., dart-collision-bullet).

#===============================================================================
# Helper Function Definitions
#===============================================================================


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was DARTConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

#===============================================================================
function(dart_traverse_components output_variable)
  set(output_components)

  foreach(component ${ARGN})
    # We should be able to elminate the <C>_VISITED property by detecting
    # whether the <C>_FOUND property is DEFINED. Unfortunately, DEFINED checks
    # whether or not define_property() was called, not whether the variable was
    # set. The exact behavior seems to vary between CMake versions, so we use
    # an extra variable instead.
    get_property(is_visited DIRECTORY PROPERTY "DART_${component}_VISITED")
    set_property(DIRECTORY PROPERTY "DART_${component}_VISITED" TRUE)

    if(NOT is_visited)
      set(component_include
        "${CMAKE_CURRENT_LIST_DIR}/dart_${component}Component.cmake")
      set(target_include
        "${CMAKE_CURRENT_LIST_DIR}/dart_${component}Targets.cmake")

      if(EXISTS "${component_include}" AND EXISTS "${target_include}")
        include("${component_include}")

        set_property(DIRECTORY
          PROPERTY "DART_${component}_INCLUDE_DIRS"
          ${dart_${component}_INCLUDE_DIRS})
        set_property(DIRECTORY
          PROPERTY "DART_${component}_DEFINITIONS"
          ${dart_${component}_DEFINITIONS})
        set_property(DIRECTORY
          PROPERTY "DART_${component}_LIBRARIES"
          ${dart_${component}_LIBRARIES})
        set_property(DIRECTORY
          PROPERTY "DART_${component}_DEPENDENCIES"
          ${dart_${component}_DEPENDENCIES})

        dart_traverse_components("${output_variable}"
          ${dart_${component}_DEPENDENCIES})

        include("${target_include}")

        # This is not necessary in recent versions of cmake, which supports
        # transitive includes via INTERFACE_INCLUDE_DIRECTORIES.
        foreach(dependency ${dart_${component}_DEPENDENCIES})
          set_property(DIRECTORY APPEND
            PROPERTY "DART_${component}_INCLUDE_DIRS"
            ${dart_${dependency}_INCLUDE_DIRS})
          set_property(DIRECTORY APPEND
            PROPERTY "DART_${component}_DEFINITIONS"
            ${dart_${dependency}_DEFINITIONS})
          # LIBRARIES is automatically inherited via INTERFACE_LINK_LIBRARIES.
        endforeach()

        list(APPEND output_components "${component}")
      else()
        set_property(DIRECTORY PROPERTY "DART_${component}_FOUND" FALSE)
      endif()
    endif()
  endforeach()

  set("${output_variable}" ${output_components} PARENT_SCOPE)
endfunction()

#===============================================================================
function(dart_export_variable variable)
  set("${variable}" ${${variable}} CACHE INTERNAL "")
endfunction()

#===============================================================================
function(dart_export_property variable)
  get_property(value DIRECTORY PROPERTY "${variable}")
  set("${variable}" ${value} CACHE INTERNAL "")
endfunction()

#===============================================================================
function(dart_export_notfound variable)
  set("${variable}" "${variable}-NOTFOUND" CACHE INTERNAL "")
endfunction()

#===============================================================================
function(dart_package_init)
  dart_traverse_components(required_components "${ARGN}")

  set(DART_INCLUDE_DIRS)
  set(DART_DEFINITIONS)
  set(DART_LIBRARIES)

  foreach(component ${ARGN})
    dart_export_property("DART_${component}_FOUND")

    if(DART_${component}_FOUND)
      dart_export_property("DART_${component}_INCLUDE_DIRS")
      dart_export_property("DART_${component}_DEFINITIONS")
      dart_export_property("DART_${component}_LIBRARIES")
      dart_export_property("DART_${component}_DEPENDENCIES")

      list(APPEND DART_INCLUDE_DIRS ${DART_${component}_INCLUDE_DIRS})
      list(APPEND DART_DEFINITIONS ${DART_${component}_DEFINITIONS})
      list(APPEND DART_LIBRARIES ${DART_${component}_LIBRARIES})
    else()
      dart_export_notfound("DART_${component}_INCLUDE_DIRS")
      dart_export_notfound("DART_${component}_DEFINITIONS")
      dart_export_notfound("DART_${component}_LIBRARIES")
      dart_export_notfound("DART_${component}_DEPENDENCIES")
    endif()
  endforeach()

  dart_export_variable(DART_INCLUDE_DIRS)
  dart_export_variable(DART_DEFINITIONS)
  dart_export_variable(DART_LIBRARIES)
endfunction()

#===============================================================================
# Main
#===============================================================================

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})

# Default component: dart
list(APPEND DART_FIND_COMPONENTS dart)

# Components
if(DART_FIND_COMPONENTS)
  set_and_check(DART_PACKAGE_INCLUDE_DIRS "${PACKAGE_PREFIX_DIR}/include")
  set(DART_INCLUDE_DIRS
    ${DART_PACKAGE_INCLUDE_DIRS}
    
    CACHE INTERNAL "")

  dart_package_init(${DART_FIND_COMPONENTS})
endif()

list(REMOVE_AT CMAKE_MODULE_PATH -1)

# Use find_package_handle_standard_args to generate output. This handles the
# REQUIRED keyword, sets DART_FOUND, and generates the appropriate
# STATUS and FATAL_ERROR messages.
include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(DART
  FOUND_VAR DART_FOUND
  REQUIRED_VARS DART_INCLUDE_DIRS DART_LIBRARIES
  HANDLE_COMPONENTS)
