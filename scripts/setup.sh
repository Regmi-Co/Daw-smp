#!/bin/bash
set -e

echo "[Setup] Preparing Minecraft Paper 1.20.4 server..."

# Download Paper 1.20.4 build if paper.jar does not exist
if [ ! -f "paper.jar" ]; then
    echo "[Setup] Fetching latest Paper 1.20.4 build info..."
    BUILD_INFO=$(curl -s https://api.papermc.io/v2/projects/paper/versions/1.20.4)
    LATEST_BUILD=$(echo "$BUILD_INFO" | grep -o '"builds":\[[^]]*\]' | grep -o '[0-9]*' | tail -n 1)
    
    if [ -z "$LATEST_BUILD" ]; then
        LATEST_BUILD="499" # Fallback stable 1.20.4 build
    fi
    
    echo "[Setup] Downloading Paper 1.20.4 (Build: $LATEST_BUILD)..."
    curl -o paper.jar "https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/${LATEST_BUILD}/downloads/paper-1.20.4-${LATEST_BUILD}.jar"
fi

# Ensure eula.txt is accepted
echo "eula=true" > eula.txt

# Create plugins directory if it doesn't exist
mkdir -p plugins

chmod +x scripts/*.sh

echo "[Setup] Complete! Run './scripts/start.sh' to boot the server."
