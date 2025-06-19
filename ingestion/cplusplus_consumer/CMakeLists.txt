cmake_minimum_required(VERSION 3.20)
project(KafkaPostgresConsumer)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find packages installed by vcpkg
find_package(RdKafka CONFIG REQUIRED)
find_package(PostgreSQL REQUIRED)
find_package(nlohmann_json CONFIG REQUIRED)

# Add executable
add_executable(kafka_consumer src/main.cpp)

# Link libraries
target_link_libraries(kafka_consumer 
    PRIVATE 
    RdKafka::rdkafka 
    RdKafka::rdkafka++
    PostgreSQL::PostgreSQL
    nlohmann_json::nlohmann_json
)

# Include directories
target_include_directories(kafka_consumer PRIVATE ${PostgreSQL_INCLUDE_DIRS})


# to watch later https://www.youtube.com/watch?v=PzRGsH3dOqI
