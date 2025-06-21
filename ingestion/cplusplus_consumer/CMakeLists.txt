cmake_minimum_required(VERSION 3.20)

project(KafkaPostgresConsumer)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/../../vcpkg/scripts/buildsystems/vcpkg.cmake)

# Add executable
add_executable(consumer src/main.cpp)

find_package(RdKafka CONFIG REQUIRED)
find_package(CppKafka CONFIG REQUIRED)
find_package(nlohmann_json CONFIG REQUIRED)
find_package(libpqxx CONFIG REQUIRED)

# Link libraries
target_link_libraries(consumer PRIVATE
    RdKafka::rdkafka
    CppKafka::cppkafka
    nlohmann_json::nlohmann_json
    libpqxx::pqxx
)

if(MSVC)
    target_compile_options(consumer PRIVATE /W4 /WX /MP /ZI)
else()
    target_compile_options(consumer PRIVATE -Wall -Wextra -Wpedantic)
endif()

