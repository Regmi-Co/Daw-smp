#!/bin/bash
set -e

VERSION="26.3"
echo "[Setup] Preparing Minecraft $VERSION server..."

# If existing jar is not for current version or invalid, remove it
if [ -f "server-version.txt" ]; then
    CURRENT_VER=$(cat server-version.txt)
    if [ "$CURRENT_VER" != "$VERSION" ]; then
        echo "[Setup] Upgrading server from $CURRENT_VER to $VERSION..."
        rm -f server.jar paper.jar
    fi
else
    # Remove older/invalid jars
    rm -f server.jar paper.jar
fi

if [ -f "server.jar" ] && [ $(wc -c < "server.jar") -lt 20000000 ]; then
    echo "[Setup] Incomplete server.jar found, removing..."
    rm -f server.jar
fi

# Download Purpur 26.3
if [ ! -f "server.jar" ]; then
    echo "[Setup] Downloading Minecraft $VERSION server JAR..."
    curl -fSL -o server.jar "https://api.purpurmc.org/v2/purpur/${VERSION}/latest/download"
    echo "$VERSION" > server-version.txt
fi

# Ensure eula.txt is accepted
echo "eula=true" > eula.txt

# Ensure plugins directory exists
mkdir -p plugins

chmod +x scripts/*.sh

echo "[Setup] Complete! Server $VERSION is ready. Run './scripts/start.sh' to boot."
