# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kali/PartitionORAM

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kali/PartitionORAM/build

# Include any dependencies generated for this target.
include server/CMakeFiles/server.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include server/CMakeFiles/server.dir/compiler_depend.make

# Include the progress variables for this target.
include server/CMakeFiles/server.dir/progress.make

# Include the compile flags for this target's objects.
include server/CMakeFiles/server.dir/flags.make

server/CMakeFiles/server.dir/main.cc.o: server/CMakeFiles/server.dir/flags.make
server/CMakeFiles/server.dir/main.cc.o: ../server/main.cc
server/CMakeFiles/server.dir/main.cc.o: server/CMakeFiles/server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kali/PartitionORAM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object server/CMakeFiles/server.dir/main.cc.o"
	cd /home/kali/PartitionORAM/build/server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT server/CMakeFiles/server.dir/main.cc.o -MF CMakeFiles/server.dir/main.cc.o.d -o CMakeFiles/server.dir/main.cc.o -c /home/kali/PartitionORAM/server/main.cc

server/CMakeFiles/server.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/main.cc.i"
	cd /home/kali/PartitionORAM/build/server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/PartitionORAM/server/main.cc > CMakeFiles/server.dir/main.cc.i

server/CMakeFiles/server.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/main.cc.s"
	cd /home/kali/PartitionORAM/build/server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/PartitionORAM/server/main.cc -o CMakeFiles/server.dir/main.cc.s

server/CMakeFiles/server.dir/oram_server.cc.o: server/CMakeFiles/server.dir/flags.make
server/CMakeFiles/server.dir/oram_server.cc.o: ../server/oram_server.cc
server/CMakeFiles/server.dir/oram_server.cc.o: server/CMakeFiles/server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kali/PartitionORAM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object server/CMakeFiles/server.dir/oram_server.cc.o"
	cd /home/kali/PartitionORAM/build/server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT server/CMakeFiles/server.dir/oram_server.cc.o -MF CMakeFiles/server.dir/oram_server.cc.o.d -o CMakeFiles/server.dir/oram_server.cc.o -c /home/kali/PartitionORAM/server/oram_server.cc

server/CMakeFiles/server.dir/oram_server.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/oram_server.cc.i"
	cd /home/kali/PartitionORAM/build/server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/PartitionORAM/server/oram_server.cc > CMakeFiles/server.dir/oram_server.cc.i

server/CMakeFiles/server.dir/oram_server.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/oram_server.cc.s"
	cd /home/kali/PartitionORAM/build/server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/PartitionORAM/server/oram_server.cc -o CMakeFiles/server.dir/oram_server.cc.s

server/CMakeFiles/server.dir/oram_storage.cc.o: server/CMakeFiles/server.dir/flags.make
server/CMakeFiles/server.dir/oram_storage.cc.o: ../server/oram_storage.cc
server/CMakeFiles/server.dir/oram_storage.cc.o: server/CMakeFiles/server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kali/PartitionORAM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object server/CMakeFiles/server.dir/oram_storage.cc.o"
	cd /home/kali/PartitionORAM/build/server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT server/CMakeFiles/server.dir/oram_storage.cc.o -MF CMakeFiles/server.dir/oram_storage.cc.o.d -o CMakeFiles/server.dir/oram_storage.cc.o -c /home/kali/PartitionORAM/server/oram_storage.cc

server/CMakeFiles/server.dir/oram_storage.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/oram_storage.cc.i"
	cd /home/kali/PartitionORAM/build/server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/PartitionORAM/server/oram_storage.cc > CMakeFiles/server.dir/oram_storage.cc.i

server/CMakeFiles/server.dir/oram_storage.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/oram_storage.cc.s"
	cd /home/kali/PartitionORAM/build/server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/PartitionORAM/server/oram_storage.cc -o CMakeFiles/server.dir/oram_storage.cc.s

# Object files for target server
server_OBJECTS = \
"CMakeFiles/server.dir/main.cc.o" \
"CMakeFiles/server.dir/oram_server.cc.o" \
"CMakeFiles/server.dir/oram_storage.cc.o"

# External object files for target server
server_EXTERNAL_OBJECTS =

bin/server: server/CMakeFiles/server.dir/main.cc.o
bin/server: server/CMakeFiles/server.dir/oram_server.cc.o
bin/server: server/CMakeFiles/server.dir/oram_storage.cc.o
bin/server: server/CMakeFiles/server.dir/build.make
bin/server: protos/libmessages.a
bin/server: base/libbase.a
bin/server: /usr/local/lib/libabsl_flags_parse.so.2206.0.0
bin/server: /usr/local/lib/libgrpc++.so.1.50.0-dev
bin/server: /usr/local/lib/libprotobuf.so.3.21.5.0
bin/server: /usr/local/lib/libgrpc.so.27.0.0
bin/server: /usr/local/lib/libz.a
bin/server: /usr/local/lib/libcares.a
bin/server: /usr/local/lib/libaddress_sorting.so.27.0.0
bin/server: /usr/local/lib/libre2.so.9.0.0
bin/server: /usr/local/lib/libupb.so.27.0.0
bin/server: /usr/local/lib/libabsl_raw_hash_set.so.2206.0.0
bin/server: /usr/local/lib/libabsl_hashtablez_sampler.so.2206.0.0
bin/server: /usr/local/lib/libabsl_hash.so.2206.0.0
bin/server: /usr/local/lib/libabsl_city.so.2206.0.0
bin/server: /usr/local/lib/libabsl_low_level_hash.so.2206.0.0
bin/server: /usr/local/lib/libabsl_statusor.so.2206.0.0
bin/server: /usr/local/lib/libgpr.so.27.0.0
bin/server: /usr/local/lib/libabsl_bad_variant_access.so.2206.0.0
bin/server: /usr/local/lib/libabsl_status.so.2206.0.0
bin/server: /usr/local/lib/libabsl_strerror.so.2206.0.0
bin/server: /usr/local/lib/libabsl_random_distributions.so.2206.0.0
bin/server: /usr/local/lib/libabsl_random_seed_sequences.so.2206.0.0
bin/server: /usr/local/lib/libabsl_random_internal_pool_urbg.so.2206.0.0
bin/server: /usr/local/lib/libabsl_random_internal_randen.so.2206.0.0
bin/server: /usr/local/lib/libabsl_random_internal_randen_hwaes.so.2206.0.0
bin/server: /usr/local/lib/libabsl_random_internal_randen_hwaes_impl.so.2206.0.0
bin/server: /usr/local/lib/libabsl_random_internal_randen_slow.so.2206.0.0
bin/server: /usr/local/lib/libabsl_random_internal_platform.so.2206.0.0
bin/server: /usr/local/lib/libabsl_random_internal_seed_material.so.2206.0.0
bin/server: /usr/local/lib/libabsl_random_seed_gen_exception.so.2206.0.0
bin/server: /usr/local/lib/libabsl_cord.so.2206.0.0
bin/server: /usr/local/lib/libabsl_bad_optional_access.so.2206.0.0
bin/server: /usr/local/lib/libabsl_cordz_info.so.2206.0.0
bin/server: /usr/local/lib/libabsl_cord_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_cordz_functions.so.2206.0.0
bin/server: /usr/local/lib/libabsl_exponential_biased.so.2206.0.0
bin/server: /usr/local/lib/libabsl_cordz_handle.so.2206.0.0
bin/server: /usr/local/lib/libabsl_str_format_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_synchronization.so.2206.0.0
bin/server: /usr/local/lib/libabsl_stacktrace.so.2206.0.0
bin/server: /usr/local/lib/libabsl_symbolize.so.2206.0.0
bin/server: /usr/local/lib/libabsl_debugging_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_demangle_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_graphcycles_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_malloc_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_time.so.2206.0.0
bin/server: /usr/local/lib/libabsl_strings.so.2206.0.0
bin/server: /usr/local/lib/libabsl_throw_delegate.so.2206.0.0
bin/server: /usr/local/lib/libabsl_int128.so.2206.0.0
bin/server: /usr/local/lib/libabsl_strings_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_base.so.2206.0.0
bin/server: /usr/local/lib/libabsl_spinlock_wait.so.2206.0.0
bin/server: /usr/local/lib/libabsl_raw_logging_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_log_severity.so.2206.0.0
bin/server: /usr/local/lib/libabsl_civil_time.so.2206.0.0
bin/server: /usr/local/lib/libabsl_time_zone.so.2206.0.0
bin/server: /usr/local/lib/libssl.so
bin/server: /usr/local/lib/libcrypto.so
bin/server: /usr/local/lib/libabsl_flags_usage.so.2206.0.0
bin/server: /usr/local/lib/libabsl_flags_usage_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_flags.so.2206.0.0
bin/server: /usr/local/lib/libabsl_flags_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_flags_marshalling.so.2206.0.0
bin/server: /usr/local/lib/libabsl_str_format_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_flags_reflection.so.2206.0.0
bin/server: /usr/local/lib/libabsl_flags_config.so.2206.0.0
bin/server: /usr/local/lib/libabsl_flags_private_handle_accessor.so.2206.0.0
bin/server: /usr/local/lib/libabsl_flags_commandlineflag.so.2206.0.0
bin/server: /usr/local/lib/libabsl_flags_commandlineflag_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_flags_program_name.so.2206.0.0
bin/server: /usr/local/lib/libabsl_hash.so.2206.0.0
bin/server: /usr/local/lib/libabsl_city.so.2206.0.0
bin/server: /usr/local/lib/libabsl_bad_variant_access.so.2206.0.0
bin/server: /usr/local/lib/libabsl_low_level_hash.so.2206.0.0
bin/server: /usr/local/lib/libabsl_cord.so.2206.0.0
bin/server: /usr/local/lib/libabsl_cordz_info.so.2206.0.0
bin/server: /usr/local/lib/libabsl_cord_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_cordz_functions.so.2206.0.0
bin/server: /usr/local/lib/libabsl_cordz_handle.so.2206.0.0
bin/server: /usr/local/lib/libabsl_raw_hash_set.so.2206.0.0
bin/server: /usr/local/lib/libabsl_bad_optional_access.so.2206.0.0
bin/server: /usr/local/lib/libabsl_hashtablez_sampler.so.2206.0.0
bin/server: /usr/local/lib/libabsl_exponential_biased.so.2206.0.0
bin/server: /usr/local/lib/libabsl_synchronization.so.2206.0.0
bin/server: /usr/local/lib/libabsl_graphcycles_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_stacktrace.so.2206.0.0
bin/server: /usr/local/lib/libabsl_symbolize.so.2206.0.0
bin/server: /usr/local/lib/libabsl_malloc_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_debugging_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_demangle_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_time.so.2206.0.0
bin/server: /usr/local/lib/libabsl_strings.so.2206.0.0
bin/server: /usr/local/lib/libabsl_int128.so.2206.0.0
bin/server: /usr/local/lib/libabsl_throw_delegate.so.2206.0.0
bin/server: /usr/local/lib/libabsl_strings_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_base.so.2206.0.0
bin/server: /usr/local/lib/libabsl_spinlock_wait.so.2206.0.0
bin/server: /usr/local/lib/libabsl_raw_logging_internal.so.2206.0.0
bin/server: /usr/local/lib/libabsl_log_severity.so.2206.0.0
bin/server: /usr/local/lib/libabsl_civil_time.so.2206.0.0
bin/server: /usr/local/lib/libabsl_time_zone.so.2206.0.0
bin/server: server/CMakeFiles/server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kali/PartitionORAM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable ../bin/server"
	cd /home/kali/PartitionORAM/build/server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
server/CMakeFiles/server.dir/build: bin/server
.PHONY : server/CMakeFiles/server.dir/build

server/CMakeFiles/server.dir/clean:
	cd /home/kali/PartitionORAM/build/server && $(CMAKE_COMMAND) -P CMakeFiles/server.dir/cmake_clean.cmake
.PHONY : server/CMakeFiles/server.dir/clean

server/CMakeFiles/server.dir/depend:
	cd /home/kali/PartitionORAM/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kali/PartitionORAM /home/kali/PartitionORAM/server /home/kali/PartitionORAM/build /home/kali/PartitionORAM/build/server /home/kali/PartitionORAM/build/server/CMakeFiles/server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : server/CMakeFiles/server.dir/depend

