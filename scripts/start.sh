#!/bin/bash
set -e

VERSION="26.3"
MIN_RAM="2G"
MAX_RAM="4G"

# Check if server.jar exists and matches version
if [ ! -f "server.jar" ] || [ ! -f "server-version.txt" ] || [ $(wc -c < "server.jar") -lt 20000000 ]; then
    echo "[Notice] Running setup for version $VERSION..."
    bash scripts/setup.sh
fi

# Check Java version (Minecraft 26.x requires Java 25+)
JAVA_CMD="java"
JAVA_VER=$($JAVA_CMD -version 2>&1 | awk -F '"' '/version/ {print $2}' | cut -d'.' -f1 || echo "0")

if [ -z "$JAVA_VER" ] || [ "$JAVA_VER" -lt 25 ]; then
    echo "[Java] Current Java is version $JAVA_VER (Minecraft 26.x requires Java 25+)."
    if [ ! -x ".jdk25/bin/java" ]; then
        echo "[Java] Auto-downloading portable OpenJDK 25 for Linux x64..."
        mkdir -p .jdk25
        curl -fSL "https://api.adoptium.net/v3/binary/latest/25/ga/linux/x64/jdk/hotspot/normal/eclipse" | tar -xz -C .jdk25 --strip-components=1
        echo "[Java] Java 25 installation complete!"
    fi
    JAVA_CMD="./.jdk25/bin/java"
fi

echo "[Server] Starting Minecraft $VERSION with $("$JAVA_CMD" -version 2>&1 | head -n 1) ($MIN_RAM - $MAX_RAM)..."

# Optimized Aikar's JVM flags
exec "$JAVA_CMD" -Xms${MIN_RAM} -Xmx${MAX_RAM} \
  -XX:+UseG1GC \
  -XX:+ParallelRefProcEnabled \
  -XX:MaxGCPauseMillis=200 \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+DisableExplicitGC \
  -XX:+AlwaysPreTouch \
  -XX:G1NewSizePercent=30 \
  -XX:G1MaxNewSizePercent=40 \
  -XX:G1ReservePercent=20 \
  -XX:G1HeapWastePercent=5 \
  -XX:G1MixedGCCountTarget=4 \
  -XX:InitiatingHeapOccupancyPercent=15 \
  -XX:G1MixedGCLiveThresholdPercent=90 \
  -XX:G1RSetUpdatingPauseTimePercent=5 \
  -XX:SurvivorRatio=32 \
  -XX:+PerfDisableSharedMem \
  -XX:MaxTenuringThreshold=1 \
  -Dusing.aikars.flags=https://mcflags.emc.gs \
  -Daikars.new.flags=true \
  -jar server.jar nogui
