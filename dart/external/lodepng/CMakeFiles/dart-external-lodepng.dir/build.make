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
include dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/depend.make

# Include the progress variables for this target.
include dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/progress.make

# Include the compile flags for this target's objects.
include dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/flags.make

dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o: dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/flags.make
dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o: ../dart/external/lodepng/lodepng.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mrl/dart/HandTasks/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o"
	cd /home/mrl/dart/HandTasks/dart/external/lodepng && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o -c /home/mrl/dart/dart/external/lodepng/lodepng.cpp

dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.i"
	cd /home/mrl/dart/HandTasks/dart/external/lodepng && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mrl/dart/dart/external/lodepng/lodepng.cpp > CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.i

dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.s"
	cd /home/mrl/dart/HandTasks/dart/external/lodepng && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mrl/dart/dart/external/lodepng/lodepng.cpp -o CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.s

dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o.requires:

.PHONY : dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o.requires

dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o.provides: dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o.requires
	$(MAKE) -f dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/build.make dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o.provides.build
.PHONY : dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o.provides

dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o.provides.build: dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o


# Object files for target dart-external-lodepng
dart__external__lodepng_OBJECTS = \
"CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o"

# External object files for target dart-external-lodepng
dart__external__lodepng_EXTERNAL_OBJECTS =

dart/external/lodepng/libdart-external-lodepng.so.6.8.0: dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o
dart/external/lodepng/libdart-external-lodepng.so.6.8.0: dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/build.make
dart/external/lodepng/libdart-external-lodepng.so.6.8.0: dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mrl/dart/HandTasks/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libdart-external-lodepng.so"
	cd /home/mrl/dart/HandTasks/dart/external/lodepng && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dart-external-lodepng.dir/link.txt --verbose=$(VERBOSE)
	cd /home/mrl/dart/HandTasks/dart/external/lodepng && $(CMAKE_COMMAND) -E cmake_symlink_library libdart-external-lodepng.so.6.8.0 libdart-external-lodepng.so.6.8 libdart-external-lodepng.so

dart/external/lodepng/libdart-external-lodepng.so.6.8: dart/external/lodepng/libdart-external-lodepng.so.6.8.0
	@$(CMAKE_COMMAND) -E touch_nocreate dart/external/lodepng/libdart-external-lodepng.so.6.8

dart/external/lodepng/libdart-external-lodepng.so: dart/external/lodepng/libdart-external-lodepng.so.6.8.0
	@$(CMAKE_COMMAND) -E touch_nocreate dart/external/lodepng/libdart-external-lodepng.so

# Rule to build all files generated by this target.
dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/build: dart/external/lodepng/libdart-external-lodepng.so

.PHONY : dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/build

dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/requires: dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/lodepng.cpp.o.requires

.PHONY : dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/requires

dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/clean:
	cd /home/mrl/dart/HandTasks/dart/external/lodepng && $(CMAKE_COMMAND) -P CMakeFiles/dart-external-lodepng.dir/cmake_clean.cmake
.PHONY : dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/clean

dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/depend:
	cd /home/mrl/dart/HandTasks && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mrl/dart /home/mrl/dart/dart/external/lodepng /home/mrl/dart/HandTasks /home/mrl/dart/HandTasks/dart/external/lodepng /home/mrl/dart/HandTasks/dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : dart/external/lodepng/CMakeFiles/dart-external-lodepng.dir/depend

