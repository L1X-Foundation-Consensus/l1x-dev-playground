# L1X developers playground

Utility to provide CLI commands to the node.

## Prerequisites

Before running the commands provided in this documentation, ensure that you have Docker and Docker Compose installed on your system.

### Installing Docker

To install Docker on your system, follow the instructions for your operating system:

- **Linux**: Follow the official Docker documentation for [installing Docker Engine](https://docs.docker.com/engine/install/).
- **Windows**: Follow the official Docker documentation for [installing Docker Desktop](https://docs.docker.com/desktop/install/).
- **macOS**: Follow the official Docker documentation for [installing Docker Desktop](https://docs.docker.com/desktop/install/).

### Installing Docker Compose

Docker Compose is usually included with Docker Desktop for Windows and macOS. However, for Linux systems or if you need to install it separately, follow the instructions below:

1. Download the Docker Compose binary from the [GitHub releases page](https://github.com/docker/compose/releases).
2. Move the downloaded binary to the `/usr/local/bin/` directory:
    ```bash
    sudo mv /path/to/downloaded/docker-compose /usr/local/bin/docker-compose
    ```
3. Make the binary executable:
    ```bash
    sudo chmod +x /usr/local/bin/docker-compose
    ```
4. Verify the installation by checking the version of Docker Compose:
    ```bash
    docker-compose --version
    ```

Once Docker and Docker Compose are installed and configured, you can proceed with the setup and usage instructions provided in this documentation.

# Dev Accounts:

Dev 1: 
    Address: 340092b1005c886165427D7344677e9E509D806f
    Private Key: 2a2a9d5b9495fa004faf18f1b54c0cc449a03b3f62987024ec3b7019a0ea55ac

Dev 2: 
    Address: 21bdb86aD95A48319fF26a8f09153aF024c69EAb
    Private Key: eaa3884b4da3d51db8636dd2ec470295c72f5d1a9f13fe73d4b557e2b0329e62

Dev 3: 
    Address: C82D767B1847997Db08b4817B1801839619dF2a8
    Private Key: 903f81b5725e2495c1f888256d2609b0a7a7fbbb9df841ce0e06b6b11a013af6

Dev 4: 
    Address: 01fcBfa3298bA84C6C34b5C63B192cC69a43a8Dc
    Private Key: 8d93caf8fa4e62a314af58e6476f262f853cc54b5d463b5f7300ce9e55e75d19


Validator 1:

    Address: Cab83DAEEDfb65BbaEdb1C286Ac9B7c90884378E
    Private key: 645a507658a3d6827b7f149cedcd7f63fb44a05fb612ad22c4819fa416fbad85

Validator 2: 

    Address: dabAf4742dDEf6A7e012BEa5e755fdee40dBB676
    Private key: f9e33d39715bbad43d0ae76247eab08f1a70d578cbca1c46effdbfcd9eb832d6


## Starting L1X Local Node

To start the L1X local node:

1. Ensure Docker and Docker Compose are installed on your system.
2. Download the `startL1X.sh` script.
3. Make the script executable: `chmod +x startL1X.sh`.
4. Run the script: `./startL1X.sh`.

This script will spin up the required Docker containers and configure them for the L1X local node. Once the node is running, you can proceed with your interactions.

## Stopping L1X Local Node

To stop the L1X local node:

1. Navigate to the directory containing the `stopL1X.sh` script.
2. Make the script executable: `chmod +x stopL1X.sh`.
3. Run the script: `./stopL1X.sh`.

This script will stop the L1X local node by halting and removing the associated Docker containers.

## Cleaning Up L1X Local Node

To clean up the L1X local node:

1. Navigate to the directory containing the `cleanupL1X.sh` script.
2. Ensure Docker is installed on your system.
3. Make the script executable: `chmod +x cleanupL1X.sh`.
4. Run the script: `./cleanupL1X.sh`.

This script will remove all Docker containers, networks, and volumes associated with the L1X local node setup.

## Viewing L1X Logs

To view logs from the L1X local node:

1. Navigate to the directory containing the `viewL1XLogs.sh` script.
2. Ensure Docker is installed on your system.
3. Make the script executable: `chmod +x viewL1XLogs.sh`.
4. Run the script: `./viewL1XLogs.sh`.

This script will display logs from the Docker containers associated with the L1X local node setup.

