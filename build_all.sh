#!/bin/bash

# Get additional build flags from command line arguments
BUILD_FLAGS="$@"

# Find all extreme configs and extract device names
for device in $(find . -iname "*extreme_*" | sed -E 's/.*extreme_([^_]*)(_defconfig|defconfig).*/\1/'); do
    echo "Building for device: $device"
    ./build.sh -m "$device" $BUILD_FLAGS
    
    # Check if build was successful
    if [ $? -ne 0 ]; then
        echo "Error: Build failed for $device"
        exit 1
    fi
done

echo "All builds completed successfully"
