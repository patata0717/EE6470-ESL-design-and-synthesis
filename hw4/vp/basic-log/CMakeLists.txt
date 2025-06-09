file(GLOB_RECURSE HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/*.h)

add_library(platform-basic-log
ethernet.cpp
display.cpp
LoGFilter.cpp
GaussianFilter.cpp
LaplacianFilter.cpp
${HEADERS})

target_include_directories(platform-basic-log PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(platform-basic-log systemc)

add_executable(riscv-vp-log
        main.cpp)

target_link_libraries(riscv-vp-log rv32 platform-basic-log platform-common gdb-mc ${Boost_LIBRARIES} systemc pthread)

INSTALL(TARGETS riscv-vp-log RUNTIME DESTINATION bin)
