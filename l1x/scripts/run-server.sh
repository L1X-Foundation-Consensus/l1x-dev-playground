#!/bin/bash

# Navigate to the application directory
cd /app/

# Create the data directory structure for L1X
mkdir -p l1x_data/l1x

# Initialize the server, specifying the working directory
./server init -w "l1x_data/l1x"

# Pause for 5 minutes (likely for initialization tasks to complete)
sleep 30

# Announce server startup
echo "Starting server"

# Start the server with RUST_LOG set to "info" for logging
RUST_LOG=info ./server start -w "l1x_data/l1x"
