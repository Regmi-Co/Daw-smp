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

echo "[Server] Starting Minecraft $VERSION ($MIN_RAM - $MAX_RAM)..."

# Optimized Aikar's JVM flags
exec java -Xms${MIN_RAM} -Xmx${MAX_RAM} \
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
