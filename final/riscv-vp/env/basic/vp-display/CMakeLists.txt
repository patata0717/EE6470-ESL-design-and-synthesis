cmake_minimum_required(VERSION 3.5)
project(vp-display) # Your project name

set(CMAKE_CXX_STANDARD 11) # This is equal to QMAKE_CXX_FLAGS += -std=c++0x


# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)


find_package(Qt5Widgets CONFIG REQUIRED)

set(SOURCES
	main.cpp
	mainwindow.cpp
    vpdisplayserver.cpp
)

set(HEADERS
	mainwindow.h
	vpdisplayserver.h
	framebuffer.h
)

set(UI mainwindow.ui)

add_executable(vp-display ${SOURCES} ${HEADERS} ${UI})

target_link_libraries(vp-display Qt5::Widgets pthread)

