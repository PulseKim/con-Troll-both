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
include dart/external/imgui/CMakeFiles/dart-external-imgui.dir/depend.make

# Include the progress variables for this target.
include dart/external/imgui/CMakeFiles/dart-external-imgui.dir/progress.make

# Include the compile flags for this target's objects.
include dart/external/imgui/CMakeFiles/dart-external-imgui.dir/flags.make

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/flags.make
dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o: ../dart/external/imgui/imgui_draw.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mrl/dart/HandTasks/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o"
	cd /home/mrl/dart/HandTasks/dart/external/imgui && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o -c /home/mrl/dart/dart/external/imgui/imgui_draw.cpp

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.i"
	cd /home/mrl/dart/HandTasks/dart/external/imgui && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mrl/dart/dart/external/imgui/imgui_draw.cpp > CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.i

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.s"
	cd /home/mrl/dart/HandTasks/dart/external/imgui && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mrl/dart/dart/external/imgui/imgui_draw.cpp -o CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.s

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o.requires:

.PHONY : dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o.requires

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o.provides: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o.requires
	$(MAKE) -f dart/external/imgui/CMakeFiles/dart-external-imgui.dir/build.make dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o.provides.build
.PHONY : dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o.provides

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o.provides.build: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o


dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/flags.make
dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o: ../dart/external/imgui/imgui.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mrl/dart/HandTasks/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o"
	cd /home/mrl/dart/HandTasks/dart/external/imgui && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dart-external-imgui.dir/imgui.cpp.o -c /home/mrl/dart/dart/external/imgui/imgui.cpp

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dart-external-imgui.dir/imgui.cpp.i"
	cd /home/mrl/dart/HandTasks/dart/external/imgui && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mrl/dart/dart/external/imgui/imgui.cpp > CMakeFiles/dart-external-imgui.dir/imgui.cpp.i

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dart-external-imgui.dir/imgui.cpp.s"
	cd /home/mrl/dart/HandTasks/dart/external/imgui && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mrl/dart/dart/external/imgui/imgui.cpp -o CMakeFiles/dart-external-imgui.dir/imgui.cpp.s

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o.requires:

.PHONY : dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o.requires

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o.provides: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o.requires
	$(MAKE) -f dart/external/imgui/CMakeFiles/dart-external-imgui.dir/build.make dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o.provides.build
.PHONY : dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o.provides

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o.provides.build: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o


dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/flags.make
dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o: ../dart/external/imgui/imgui_widgets.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mrl/dart/HandTasks/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o"
	cd /home/mrl/dart/HandTasks/dart/external/imgui && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o -c /home/mrl/dart/dart/external/imgui/imgui_widgets.cpp

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.i"
	cd /home/mrl/dart/HandTasks/dart/external/imgui && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mrl/dart/dart/external/imgui/imgui_widgets.cpp > CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.i

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.s"
	cd /home/mrl/dart/HandTasks/dart/external/imgui && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mrl/dart/dart/external/imgui/imgui_widgets.cpp -o CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.s

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o.requires:

.PHONY : dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o.requires

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o.provides: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o.requires
	$(MAKE) -f dart/external/imgui/CMakeFiles/dart-external-imgui.dir/build.make dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o.provides.build
.PHONY : dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o.provides

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o.provides.build: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o


# Object files for target dart-external-imgui
dart__external__imgui_OBJECTS = \
"CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o" \
"CMakeFiles/dart-external-imgui.dir/imgui.cpp.o" \
"CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o"

# External object files for target dart-external-imgui
dart__external__imgui_EXTERNAL_OBJECTS =

dart/external/imgui/libdart-external-imgui.so.6.8.0: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o
dart/external/imgui/libdart-external-imgui.so.6.8.0: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o
dart/external/imgui/libdart-external-imgui.so.6.8.0: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o
dart/external/imgui/libdart-external-imgui.so.6.8.0: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/build.make
dart/external/imgui/libdart-external-imgui.so.6.8.0: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mrl/dart/HandTasks/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library libdart-external-imgui.so"
	cd /home/mrl/dart/HandTasks/dart/external/imgui && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dart-external-imgui.dir/link.txt --verbose=$(VERBOSE)
	cd /home/mrl/dart/HandTasks/dart/external/imgui && $(CMAKE_COMMAND) -E cmake_symlink_library libdart-external-imgui.so.6.8.0 libdart-external-imgui.so.6.8 libdart-external-imgui.so

dart/external/imgui/libdart-external-imgui.so.6.8: dart/external/imgui/libdart-external-imgui.so.6.8.0
	@$(CMAKE_COMMAND) -E touch_nocreate dart/external/imgui/libdart-external-imgui.so.6.8

dart/external/imgui/libdart-external-imgui.so: dart/external/imgui/libdart-external-imgui.so.6.8.0
	@$(CMAKE_COMMAND) -E touch_nocreate dart/external/imgui/libdart-external-imgui.so

# Rule to build all files generated by this target.
dart/external/imgui/CMakeFiles/dart-external-imgui.dir/build: dart/external/imgui/libdart-external-imgui.so

.PHONY : dart/external/imgui/CMakeFiles/dart-external-imgui.dir/build

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/requires: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_draw.cpp.o.requires
dart/external/imgui/CMakeFiles/dart-external-imgui.dir/requires: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui.cpp.o.requires
dart/external/imgui/CMakeFiles/dart-external-imgui.dir/requires: dart/external/imgui/CMakeFiles/dart-external-imgui.dir/imgui_widgets.cpp.o.requires

.PHONY : dart/external/imgui/CMakeFiles/dart-external-imgui.dir/requires

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/clean:
	cd /home/mrl/dart/HandTasks/dart/external/imgui && $(CMAKE_COMMAND) -P CMakeFiles/dart-external-imgui.dir/cmake_clean.cmake
.PHONY : dart/external/imgui/CMakeFiles/dart-external-imgui.dir/clean

dart/external/imgui/CMakeFiles/dart-external-imgui.dir/depend:
	cd /home/mrl/dart/HandTasks && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mrl/dart /home/mrl/dart/dart/external/imgui /home/mrl/dart/HandTasks /home/mrl/dart/HandTasks/dart/external/imgui /home/mrl/dart/HandTasks/dart/external/imgui/CMakeFiles/dart-external-imgui.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : dart/external/imgui/CMakeFiles/dart-external-imgui.dir/depend

