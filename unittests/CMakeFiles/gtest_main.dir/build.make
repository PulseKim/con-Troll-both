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
include unittests/CMakeFiles/gtest_main.dir/depend.make

# Include the progress variables for this target.
include unittests/CMakeFiles/gtest_main.dir/progress.make

# Include the compile flags for this target's objects.
include unittests/CMakeFiles/gtest_main.dir/flags.make

unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o: unittests/CMakeFiles/gtest_main.dir/flags.make
unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o: ../unittests/gtest/src/gtest_main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mrl/dart/HandTasks/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o"
	cd /home/mrl/dart/HandTasks/unittests && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o -c /home/mrl/dart/unittests/gtest/src/gtest_main.cc

unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.i"
	cd /home/mrl/dart/HandTasks/unittests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mrl/dart/unittests/gtest/src/gtest_main.cc > CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.i

unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.s"
	cd /home/mrl/dart/HandTasks/unittests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mrl/dart/unittests/gtest/src/gtest_main.cc -o CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.s

unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o.requires:

.PHONY : unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o.requires

unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o.provides: unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o.requires
	$(MAKE) -f unittests/CMakeFiles/gtest_main.dir/build.make unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o.provides.build
.PHONY : unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o.provides

unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o.provides.build: unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o


# Object files for target gtest_main
gtest_main_OBJECTS = \
"CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o"

# External object files for target gtest_main
gtest_main_EXTERNAL_OBJECTS =

unittests/libgtest_main.a: unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o
unittests/libgtest_main.a: unittests/CMakeFiles/gtest_main.dir/build.make
unittests/libgtest_main.a: unittests/CMakeFiles/gtest_main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mrl/dart/HandTasks/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libgtest_main.a"
	cd /home/mrl/dart/HandTasks/unittests && $(CMAKE_COMMAND) -P CMakeFiles/gtest_main.dir/cmake_clean_target.cmake
	cd /home/mrl/dart/HandTasks/unittests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gtest_main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
unittests/CMakeFiles/gtest_main.dir/build: unittests/libgtest_main.a

.PHONY : unittests/CMakeFiles/gtest_main.dir/build

unittests/CMakeFiles/gtest_main.dir/requires: unittests/CMakeFiles/gtest_main.dir/gtest/src/gtest_main.cc.o.requires

.PHONY : unittests/CMakeFiles/gtest_main.dir/requires

unittests/CMakeFiles/gtest_main.dir/clean:
	cd /home/mrl/dart/HandTasks/unittests && $(CMAKE_COMMAND) -P CMakeFiles/gtest_main.dir/cmake_clean.cmake
.PHONY : unittests/CMakeFiles/gtest_main.dir/clean

unittests/CMakeFiles/gtest_main.dir/depend:
	cd /home/mrl/dart/HandTasks && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mrl/dart /home/mrl/dart/unittests /home/mrl/dart/HandTasks /home/mrl/dart/HandTasks/unittests /home/mrl/dart/HandTasks/unittests/CMakeFiles/gtest_main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : unittests/CMakeFiles/gtest_main.dir/depend

