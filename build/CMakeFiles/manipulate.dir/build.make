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
CMAKE_SOURCE_DIR = /home/mrl/dart/HandTasks

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mrl/dart/HandTasks/build

# Include any dependencies generated for this target.
include CMakeFiles/manipulate.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/manipulate.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/manipulate.dir/flags.make

CMakeFiles/manipulate.dir/IkSolver.cpp.o: CMakeFiles/manipulate.dir/flags.make
CMakeFiles/manipulate.dir/IkSolver.cpp.o: ../IkSolver.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mrl/dart/HandTasks/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/manipulate.dir/IkSolver.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/manipulate.dir/IkSolver.cpp.o -c /home/mrl/dart/HandTasks/IkSolver.cpp

CMakeFiles/manipulate.dir/IkSolver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/manipulate.dir/IkSolver.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mrl/dart/HandTasks/IkSolver.cpp > CMakeFiles/manipulate.dir/IkSolver.cpp.i

CMakeFiles/manipulate.dir/IkSolver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/manipulate.dir/IkSolver.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mrl/dart/HandTasks/IkSolver.cpp -o CMakeFiles/manipulate.dir/IkSolver.cpp.s

CMakeFiles/manipulate.dir/IkSolver.cpp.o.requires:

.PHONY : CMakeFiles/manipulate.dir/IkSolver.cpp.o.requires

CMakeFiles/manipulate.dir/IkSolver.cpp.o.provides: CMakeFiles/manipulate.dir/IkSolver.cpp.o.requires
	$(MAKE) -f CMakeFiles/manipulate.dir/build.make CMakeFiles/manipulate.dir/IkSolver.cpp.o.provides.build
.PHONY : CMakeFiles/manipulate.dir/IkSolver.cpp.o.provides

CMakeFiles/manipulate.dir/IkSolver.cpp.o.provides.build: CMakeFiles/manipulate.dir/IkSolver.cpp.o


CMakeFiles/manipulate.dir/ArmMaker.cpp.o: CMakeFiles/manipulate.dir/flags.make
CMakeFiles/manipulate.dir/ArmMaker.cpp.o: ../ArmMaker.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mrl/dart/HandTasks/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/manipulate.dir/ArmMaker.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/manipulate.dir/ArmMaker.cpp.o -c /home/mrl/dart/HandTasks/ArmMaker.cpp

CMakeFiles/manipulate.dir/ArmMaker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/manipulate.dir/ArmMaker.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mrl/dart/HandTasks/ArmMaker.cpp > CMakeFiles/manipulate.dir/ArmMaker.cpp.i

CMakeFiles/manipulate.dir/ArmMaker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/manipulate.dir/ArmMaker.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mrl/dart/HandTasks/ArmMaker.cpp -o CMakeFiles/manipulate.dir/ArmMaker.cpp.s

CMakeFiles/manipulate.dir/ArmMaker.cpp.o.requires:

.PHONY : CMakeFiles/manipulate.dir/ArmMaker.cpp.o.requires

CMakeFiles/manipulate.dir/ArmMaker.cpp.o.provides: CMakeFiles/manipulate.dir/ArmMaker.cpp.o.requires
	$(MAKE) -f CMakeFiles/manipulate.dir/build.make CMakeFiles/manipulate.dir/ArmMaker.cpp.o.provides.build
.PHONY : CMakeFiles/manipulate.dir/ArmMaker.cpp.o.provides

CMakeFiles/manipulate.dir/ArmMaker.cpp.o.provides.build: CMakeFiles/manipulate.dir/ArmMaker.cpp.o


CMakeFiles/manipulate.dir/MyWindow.cpp.o: CMakeFiles/manipulate.dir/flags.make
CMakeFiles/manipulate.dir/MyWindow.cpp.o: ../MyWindow.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mrl/dart/HandTasks/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/manipulate.dir/MyWindow.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/manipulate.dir/MyWindow.cpp.o -c /home/mrl/dart/HandTasks/MyWindow.cpp

CMakeFiles/manipulate.dir/MyWindow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/manipulate.dir/MyWindow.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mrl/dart/HandTasks/MyWindow.cpp > CMakeFiles/manipulate.dir/MyWindow.cpp.i

CMakeFiles/manipulate.dir/MyWindow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/manipulate.dir/MyWindow.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mrl/dart/HandTasks/MyWindow.cpp -o CMakeFiles/manipulate.dir/MyWindow.cpp.s

CMakeFiles/manipulate.dir/MyWindow.cpp.o.requires:

.PHONY : CMakeFiles/manipulate.dir/MyWindow.cpp.o.requires

CMakeFiles/manipulate.dir/MyWindow.cpp.o.provides: CMakeFiles/manipulate.dir/MyWindow.cpp.o.requires
	$(MAKE) -f CMakeFiles/manipulate.dir/build.make CMakeFiles/manipulate.dir/MyWindow.cpp.o.provides.build
.PHONY : CMakeFiles/manipulate.dir/MyWindow.cpp.o.provides

CMakeFiles/manipulate.dir/MyWindow.cpp.o.provides.build: CMakeFiles/manipulate.dir/MyWindow.cpp.o


CMakeFiles/manipulate.dir/Controller.cpp.o: CMakeFiles/manipulate.dir/flags.make
CMakeFiles/manipulate.dir/Controller.cpp.o: ../Controller.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mrl/dart/HandTasks/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/manipulate.dir/Controller.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/manipulate.dir/Controller.cpp.o -c /home/mrl/dart/HandTasks/Controller.cpp

CMakeFiles/manipulate.dir/Controller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/manipulate.dir/Controller.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mrl/dart/HandTasks/Controller.cpp > CMakeFiles/manipulate.dir/Controller.cpp.i

CMakeFiles/manipulate.dir/Controller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/manipulate.dir/Controller.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mrl/dart/HandTasks/Controller.cpp -o CMakeFiles/manipulate.dir/Controller.cpp.s

CMakeFiles/manipulate.dir/Controller.cpp.o.requires:

.PHONY : CMakeFiles/manipulate.dir/Controller.cpp.o.requires

CMakeFiles/manipulate.dir/Controller.cpp.o.provides: CMakeFiles/manipulate.dir/Controller.cpp.o.requires
	$(MAKE) -f CMakeFiles/manipulate.dir/build.make CMakeFiles/manipulate.dir/Controller.cpp.o.provides.build
.PHONY : CMakeFiles/manipulate.dir/Controller.cpp.o.provides

CMakeFiles/manipulate.dir/Controller.cpp.o.provides.build: CMakeFiles/manipulate.dir/Controller.cpp.o


CMakeFiles/manipulate.dir/SkelParser.cpp.o: CMakeFiles/manipulate.dir/flags.make
CMakeFiles/manipulate.dir/SkelParser.cpp.o: ../SkelParser.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mrl/dart/HandTasks/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/manipulate.dir/SkelParser.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/manipulate.dir/SkelParser.cpp.o -c /home/mrl/dart/HandTasks/SkelParser.cpp

CMakeFiles/manipulate.dir/SkelParser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/manipulate.dir/SkelParser.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mrl/dart/HandTasks/SkelParser.cpp > CMakeFiles/manipulate.dir/SkelParser.cpp.i

CMakeFiles/manipulate.dir/SkelParser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/manipulate.dir/SkelParser.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mrl/dart/HandTasks/SkelParser.cpp -o CMakeFiles/manipulate.dir/SkelParser.cpp.s

CMakeFiles/manipulate.dir/SkelParser.cpp.o.requires:

.PHONY : CMakeFiles/manipulate.dir/SkelParser.cpp.o.requires

CMakeFiles/manipulate.dir/SkelParser.cpp.o.provides: CMakeFiles/manipulate.dir/SkelParser.cpp.o.requires
	$(MAKE) -f CMakeFiles/manipulate.dir/build.make CMakeFiles/manipulate.dir/SkelParser.cpp.o.provides.build
.PHONY : CMakeFiles/manipulate.dir/SkelParser.cpp.o.provides

CMakeFiles/manipulate.dir/SkelParser.cpp.o.provides.build: CMakeFiles/manipulate.dir/SkelParser.cpp.o


CMakeFiles/manipulate.dir/main.cpp.o: CMakeFiles/manipulate.dir/flags.make
CMakeFiles/manipulate.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mrl/dart/HandTasks/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/manipulate.dir/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/manipulate.dir/main.cpp.o -c /home/mrl/dart/HandTasks/main.cpp

CMakeFiles/manipulate.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/manipulate.dir/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mrl/dart/HandTasks/main.cpp > CMakeFiles/manipulate.dir/main.cpp.i

CMakeFiles/manipulate.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/manipulate.dir/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mrl/dart/HandTasks/main.cpp -o CMakeFiles/manipulate.dir/main.cpp.s

CMakeFiles/manipulate.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/manipulate.dir/main.cpp.o.requires

CMakeFiles/manipulate.dir/main.cpp.o.provides: CMakeFiles/manipulate.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/manipulate.dir/build.make CMakeFiles/manipulate.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/manipulate.dir/main.cpp.o.provides

CMakeFiles/manipulate.dir/main.cpp.o.provides.build: CMakeFiles/manipulate.dir/main.cpp.o


# Object files for target manipulate
manipulate_OBJECTS = \
"CMakeFiles/manipulate.dir/IkSolver.cpp.o" \
"CMakeFiles/manipulate.dir/ArmMaker.cpp.o" \
"CMakeFiles/manipulate.dir/MyWindow.cpp.o" \
"CMakeFiles/manipulate.dir/Controller.cpp.o" \
"CMakeFiles/manipulate.dir/SkelParser.cpp.o" \
"CMakeFiles/manipulate.dir/main.cpp.o"

# External object files for target manipulate
manipulate_EXTERNAL_OBJECTS =

manipulate: CMakeFiles/manipulate.dir/IkSolver.cpp.o
manipulate: CMakeFiles/manipulate.dir/ArmMaker.cpp.o
manipulate: CMakeFiles/manipulate.dir/MyWindow.cpp.o
manipulate: CMakeFiles/manipulate.dir/Controller.cpp.o
manipulate: CMakeFiles/manipulate.dir/SkelParser.cpp.o
manipulate: CMakeFiles/manipulate.dir/main.cpp.o
manipulate: CMakeFiles/manipulate.dir/build.make
manipulate: /usr/local/lib/libdart-gui.so.6.8.0
manipulate: /usr/local/lib/libdart-collision-bullet.so.6.8.0
manipulate: /usr/local/lib/libdart-optimizer-ipopt.so.6.8.0
manipulate: /usr/local/lib/libdart-utils.so.6.8.0
manipulate: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
manipulate: /usr/lib/x86_64-linux-gnu/libglut.so
manipulate: /usr/lib/x86_64-linux-gnu/libXmu.so
manipulate: /usr/lib/x86_64-linux-gnu/libXi.so
manipulate: /usr/lib/x86_64-linux-gnu/libGLU.so
manipulate: /usr/lib/x86_64-linux-gnu/libGL.so
manipulate: /usr/local/lib/libdart-external-lodepng.so.6.8.0
manipulate: /usr/local/lib/libdart-external-imgui.so.6.8.0
manipulate: /usr/lib/x86_64-linux-gnu/libBulletDynamics.so
manipulate: /usr/lib/x86_64-linux-gnu/libBulletCollision.so
manipulate: /usr/lib/x86_64-linux-gnu/libLinearMath.so
manipulate: /usr/lib/x86_64-linux-gnu/libBulletSoftBody.so
manipulate: /usr/local/lib/libdart.so.6.8.0
manipulate: /usr/local/lib/libdart-external-odelcpsolver.so.6.8.0
manipulate: /usr/lib/x86_64-linux-gnu/libccd.so
manipulate: /usr/lib/libfcl.so
manipulate: /usr/lib/x86_64-linux-gnu/libassimp.so
manipulate: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
manipulate: /usr/lib/x86_64-linux-gnu/libboost_system.so
manipulate: /usr/lib/liboctomap.so
manipulate: /usr/lib/liboctomath.so
manipulate: /usr/lib/x86_64-linux-gnu/libboost_regex.so
manipulate: /usr/lib/libipopt.so
manipulate: CMakeFiles/manipulate.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mrl/dart/HandTasks/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable manipulate"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/manipulate.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/manipulate.dir/build: manipulate

.PHONY : CMakeFiles/manipulate.dir/build

CMakeFiles/manipulate.dir/requires: CMakeFiles/manipulate.dir/IkSolver.cpp.o.requires
CMakeFiles/manipulate.dir/requires: CMakeFiles/manipulate.dir/ArmMaker.cpp.o.requires
CMakeFiles/manipulate.dir/requires: CMakeFiles/manipulate.dir/MyWindow.cpp.o.requires
CMakeFiles/manipulate.dir/requires: CMakeFiles/manipulate.dir/Controller.cpp.o.requires
CMakeFiles/manipulate.dir/requires: CMakeFiles/manipulate.dir/SkelParser.cpp.o.requires
CMakeFiles/manipulate.dir/requires: CMakeFiles/manipulate.dir/main.cpp.o.requires

.PHONY : CMakeFiles/manipulate.dir/requires

CMakeFiles/manipulate.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/manipulate.dir/cmake_clean.cmake
.PHONY : CMakeFiles/manipulate.dir/clean

CMakeFiles/manipulate.dir/depend:
	cd /home/mrl/dart/HandTasks/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mrl/dart/HandTasks /home/mrl/dart/HandTasks /home/mrl/dart/HandTasks/build /home/mrl/dart/HandTasks/build /home/mrl/dart/HandTasks/build/CMakeFiles/manipulate.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/manipulate.dir/depend

