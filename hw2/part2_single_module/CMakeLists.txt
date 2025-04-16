cmake_minimum_required(VERSION 3.8)

# Define the project name of these source code
project (LoG)

# Define the C++ standard -std=c++17
# This is required to match the systemc installed with Ubuntu
set (CMAKE_CXX_STANDARD 17)

# Add optimization & warning flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -Wall")

# Set clock period = 1 ns
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D CLOCK_PERIOD=1.0")

# Set file name
set(FILE_NAME "mandril_color") # modify here
set(INPUT_FILE "${FILE_NAME}_gray_noise.bmp")
set(GOLDEN_FILE "${FILE_NAME}_gray_noise_gaussian_laplacian2.bmp")

# Set image size
set(WIDTH 512) # modify here
set(HEIGHT 512) # modify here

# Configure filter_def.h
configure_file(${CMAKE_SOURCE_DIR}/filter_def.h.in ${CMAKE_SOURCE_DIR}/filter_def.h @ONLY)

# Include the generated file
include_directories(${CMAKE_BINARY_DIR})

# Define the executable name and its source code
file(GLOB SRC "*.cpp")
add_executable(LoG ${SRC})

# Define the used libraries of the executable, Equal to -l flags of g++
# In here, the libraries are given in apsolute path. hence no needs for -L
# flag
target_link_libraries(LoG systemc)

# Add test LoG filter command
set(OUT_FILE "out.bmp")
add_custom_command(OUTPUT ${OUT_FILE}
	COMMAND ./LoG ../../SW/golden/${INPUT_FILE} ./${OUT_FILE}
	DEPENDS LoG
	WORKING_DIRECTORY ${CMAKE_BINARY_DIR}	
)
add_custom_target(run 
	DEPENDS ${OUT_FILE}
)

# Compare output & golden
add_custom_target(check
	COMMAND diff -s ${CMAKE_BINARY_DIR}/${OUT_FILE} ../SW/golden/${GOLDEN_FILE}
	DEPENDS run
	WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}	
)
