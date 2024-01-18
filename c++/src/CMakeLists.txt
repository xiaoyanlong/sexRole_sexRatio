set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
include_directories(${CMAKE_SOURCE_DIR}/libs/ $(CMAKE_SYSTEM_PREFIX_PATH}/include/))
set(HEADER_FILES evorole.h recorder.h simulation.h json.h)
add_executable(evorole main.cpp evorole.cpp recorder.cpp simulation.cpp json.cpp)
target_link_libraries(evorole ${TBB} PRIVATE Threads::Threads stdc++fs) #-lstdc++fs is needed to link for using Filesystem for my current GCC version
install(TARGETS evorole DESTINATION bin)
install(TARGETS evorole CONFIGURATIONS Release DESTINATION bin)
