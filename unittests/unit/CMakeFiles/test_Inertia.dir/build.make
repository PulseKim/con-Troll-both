# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mrl/dart

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mrl/dart/HandTasks

# Include any dependencies generated for this target.
include unittests/unit/CMakeFiles/test_Inertia.dir/depend.make

# Include the progress variables for this target.
include unittests/unit/CMakeFiles/test_Inertia.dir/progress.make

# Include the compile flags for this target's objects.
include unittests/unit/CMakeFiles/test_Inertia.dir/flags.make

unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o: unittests/unit/CMakeFiles/test_Inertia.dir/flags.make
unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o: ../unittests/unit/test_Inertia.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mrl/dart/HandTasks/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o"
	cd /home/mrl/dart/HandTasks/unittests/unit && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o -c /home/mrl/dart/unittests/unit/test_Inertia.cpp

unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_Inertia.dir/test_Inertia.cpp.i"
	cd /home/mrl/dart/HandTasks/unittests/unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mrl/dart/unittests/unit/test_Inertia.cpp > CMakeFiles/test_Inertia.dir/test_Inertia.cpp.i

unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_Inertia.dir/test_Inertia.cpp.s"
	cd /home/mrl/dart/HandTasks/unittests/unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mrl/dart/unittests/unit/test_Inertia.cpp -o CMakeFiles/test_Inertia.dir/test_Inertia.cpp.s

unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o.requires:

.PHONY : unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o.requires

unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o.provides: unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o.requires
	$(MAKE) -f unittests/unit/CMakeFiles/test_Inertia.dir/build.make unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o.provides.build
.PHONY : unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o.provides

unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o.provides.build: unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o


# Object files for target test_Inertia
test_Inertia_OBJECTS = \
"CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o"

# External object files for target test_Inertia
test_Inertia_EXTERNAL_OBJECTS =

unittests/unit/test_Inertia: unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o
unittests/unit/test_Inertia: unittests/unit/CMakeFiles/test_Inertia.dir/build.make
unittests/unit/test_Inertia: lib/libdart.so.6.8.0
unittests/unit/test_Inertia: lib/libgtest.a
unittests/unit/test_Inertia: unittests/libgtest_main.a
unittests/unit/test_Inertia: dart/external/odelcpsolver/libdart-external-odelcpsolver.so.6.8.0
unittests/unit/test_Inertia: /usr/lib/x86_64-linux-gnu/libccd.so
unittests/unit/test_Inertia: /usr/lib/libfcl.so
unittests/unit/test_Inertia: /usr/lib/x86_64-linux-gnu/libassimp.so
unittests/unit/test_Inertia: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
unittests/unit/test_Inertia: /usr/lib/x86_64-linux-gnu/libboost_system.so
unittests/unit/test_Inertia: /usr/lib/liboctomap.so
unittests/unit/test_Inertia: /usr/lib/liboctomath.so
unittests/unit/test_Inertia: /usr/lib/x86_64-linux-gnu/libboost_regex.so
unittests/unit/test_Inertia: lib/libgtest.a
unittests/unit/test_Inertia: unittests/unit/CMakeFiles/test_Inertia.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mrl/dart/HandTasks/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_Inertia"
	cd /home/mrl/dart/HandTasks/unittests/unit && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_Inertia.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
unittests/unit/CMakeFiles/test_Inertia.dir/build: unittests/unit/test_Inertia

.PHONY : unittests/unit/CMakeFiles/test_Inertia.dir/build

unittests/unit/CMakeFiles/test_Inertia.dir/requires: unittests/unit/CMakeFiles/test_Inertia.dir/test_Inertia.cpp.o.requires

.PHONY : unittests/unit/CMakeFiles/test_Inertia.dir/requires

unittests/unit/CMakeFiles/test_Inertia.dir/clean:
	cd /home/mrl/dart/HandTasks/unittests/unit && $(CMAKE_COMMAND) -P CMakeFiles/test_Inertia.dir/cmake_clean.cmake
.PHONY : unittests/unit/CMakeFiles/test_Inertia.dir/clean

unittests/unit/CMakeFiles/test_Inertia.dir/depend:
	cd /home/mrl/dart/HandTasks && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mrl/dart /home/mrl/dart/unittests/unit /home/mrl/dart/HandTasks /home/mrl/dart/HandTasks/unittests/unit /home/mrl/dart/HandTasks/unittests/unit/CMakeFiles/test_Inertia.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : unittests/unit/CMakeFiles/test_Inertia.dir/depend

