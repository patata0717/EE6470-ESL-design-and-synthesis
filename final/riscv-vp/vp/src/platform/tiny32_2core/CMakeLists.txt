file(GLOB_RECURSE HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/*.h)

add_executable(tiny32_2core
        tiny32_main.cpp
		PE_Add1.cpp
        ${HEADERS})

target_link_libraries(tiny32_2core rv32 platform-common gdb-mc
	${Boost_LIBRARIES} systemc pthread)

INSTALL(TARGETS tiny32_2core RUNTIME DESTINATION bin)
