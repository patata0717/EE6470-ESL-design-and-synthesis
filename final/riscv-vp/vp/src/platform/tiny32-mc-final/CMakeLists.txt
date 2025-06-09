file(GLOB_RECURSE HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/*.h)

add_executable(tiny32-mc-final
        mc_main.cpp
		PE_Add1.cpp
        ${HEADERS})

target_link_libraries(tiny32-mc-final rv32 platform-common gdb-mc
	${Boost_LIBRARIES} systemc pthread)

INSTALL(TARGETS tiny32-mc-final RUNTIME DESTINATION bin)
