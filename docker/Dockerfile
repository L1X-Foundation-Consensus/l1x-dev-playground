# Use an official Rust runtime as a parent image
FROM ubuntu:22.04

# Set the working directory in the container
WORKDIR /app

# Install any necessary dependencies
RUN apt update && \
    apt install libpq-dev --yes && \
    apt install libssl-dev --yes


# Execute the script when the container starts
CMD ["sleep","infinity"]
