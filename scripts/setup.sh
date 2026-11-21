#!/bin/bash
set -e

echo "[Setup] Preparing Minecraft 1.20.4 server..."

# Remove corrupt or incomplete jar if under 20MB
if [ -f "server.jar" ] && [ $(wc -c < "server.jar") -lt 20000000 ]; then
    echo "[Setup] Found corrupt server.jar, removing..."
    rm -f server.jar
fi
if [ -f "paper.jar" ]; then
    rm -f paper.jar
fi

# Download high-performance Purpur 1.20.4 (Paper fork)
if [ ! -f "server.jar" ]; then
    echo "[Setup] Downloading Minecraft 1.20.4 server JAR (~46 MB)..."
    curl -fSL -o server.jar "https://api.purpurmc.org/v2/purpur/1.20.4/latest/download"
fi

# Ensure eula.txt is accepted
echo "eula=true" > eula.txt

# Create plugins directory if it doesn't exist
mkdir -p plugins

chmod +x scripts/*.sh

echo "[Setup] Complete! Server jar is ready. Run './scripts/start.sh' to boot."
