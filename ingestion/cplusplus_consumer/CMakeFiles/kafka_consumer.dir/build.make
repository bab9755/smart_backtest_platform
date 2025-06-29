# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 4.0

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer

# Include any dependencies generated for this target.
include CMakeFiles/kafka_consumer.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/kafka_consumer.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/kafka_consumer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/kafka_consumer.dir/flags.make

CMakeFiles/kafka_consumer.dir/codegen:
.PHONY : CMakeFiles/kafka_consumer.dir/codegen

CMakeFiles/kafka_consumer.dir/src/main.cpp.o: CMakeFiles/kafka_consumer.dir/flags.make
CMakeFiles/kafka_consumer.dir/src/main.cpp.o: src/main.cpp
CMakeFiles/kafka_consumer.dir/src/main.cpp.o: CMakeFiles/kafka_consumer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/kafka_consumer.dir/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/kafka_consumer.dir/src/main.cpp.o -MF CMakeFiles/kafka_consumer.dir/src/main.cpp.o.d -o CMakeFiles/kafka_consumer.dir/src/main.cpp.o -c /Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer/src/main.cpp

CMakeFiles/kafka_consumer.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/kafka_consumer.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer/src/main.cpp > CMakeFiles/kafka_consumer.dir/src/main.cpp.i

CMakeFiles/kafka_consumer.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/kafka_consumer.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer/src/main.cpp -o CMakeFiles/kafka_consumer.dir/src/main.cpp.s

# Object files for target kafka_consumer
kafka_consumer_OBJECTS = \
"CMakeFiles/kafka_consumer.dir/src/main.cpp.o"

# External object files for target kafka_consumer
kafka_consumer_EXTERNAL_OBJECTS =

kafka_consumer: CMakeFiles/kafka_consumer.dir/src/main.cpp.o
kafka_consumer: CMakeFiles/kafka_consumer.dir/build.make
kafka_consumer: vcpkg_installed/arm64-osx/debug/lib/librdkafka.a
kafka_consumer: vcpkg_installed/arm64-osx/debug/lib/librdkafka++.a
kafka_consumer: vcpkg_installed/arm64-osx/lib/libpq.a
kafka_consumer: vcpkg_installed/arm64-osx/debug/lib/librdkafka.a
kafka_consumer: vcpkg_installed/arm64-osx/debug/lib/liblz4d.a
kafka_consumer: vcpkg_installed/arm64-osx/lib/libpgport.a
kafka_consumer: vcpkg_installed/arm64-osx/lib/libpgcommon.a
kafka_consumer: vcpkg_installed/arm64-osx/debug/lib/libssl.a
kafka_consumer: vcpkg_installed/arm64-osx/debug/lib/libcrypto.a
kafka_consumer: CMakeFiles/kafka_consumer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable kafka_consumer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kafka_consumer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/kafka_consumer.dir/build: kafka_consumer
.PHONY : CMakeFiles/kafka_consumer.dir/build

CMakeFiles/kafka_consumer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/kafka_consumer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/kafka_consumer.dir/clean

CMakeFiles/kafka_consumer.dir/depend:
	cd /Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer /Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer /Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer /Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer /Users/boubalkaly/Desktop/development/portfolio/smart-backtest-platform/ingestion/cplusplus_consumer/CMakeFiles/kafka_consumer.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/kafka_consumer.dir/depend

