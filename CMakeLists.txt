cmake_minimum_required(VERSION 3.28)

project(cpp-template
  VERSION 0.2.1
  LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_SCAN_FOR_MODULES OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(main src/main.cpp)
set_target_properties(main PROPERTIES OUTPUT_NAME ${PROJECT_NAME})
target_link_libraries(main PRIVATE $<$<CXX_COMPILER_ID:GNU>:stdc++exp>)

install(TARGETS main RUNTIME DESTINATION bin)

enable_testing()
find_package(GTest REQUIRED)
include(GoogleTest)
add_executable(tests tests/example_test.cpp)
target_link_libraries(tests PRIVATE GTest::gtest_main)
gtest_discover_tests(tests DISCOVERY_MODE PRE_TEST)
