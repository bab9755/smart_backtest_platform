# Start from an Ubuntu image with build tools
FROM ubuntu:22.04

# Avoid interaction prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update the package index and install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    curl \
    pkg-config \
    zip \
    flex \
    bison \
    linux-libc-dev \
    autoconf \
 && rm -rf /var/lib/apt/lists/*

# Clone and bootstrap vcpkg. This is done in one RUN layer to optimize caching.
RUN git clone https://github.com/microsoft/vcpkg.git /opt/vcpkg && \
    /opt/vcpkg/bootstrap-vcpkg.sh

# Install vcpkg dependencies
RUN /opt/vcpkg/vcpkg install cppkafka nlohmann-json libpqxx

# Set the working directory inside the container
WORKDIR /app

# Copy the application source code (the .dockerignore will exclude the build/ dir)
COPY . .

# Configure and build the project using the vcpkg toolchain
RUN cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=/opt/vcpkg/scripts/buildsystems/vcpkg.cmake
RUN cmake --build build

# Run the resulting binary when the container starts
CMD ["./build/consumer"]
