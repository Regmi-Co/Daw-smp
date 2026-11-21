#!/bin/bash
set -e

# RAM allocation (adjustable)
MIN_RAM="2G"
MAX_RAM="4G"

# Check if server.jar exists and is valid (> 20MB)
if [ ! -f "server.jar" ] || [ $(wc -c < "server.jar") -lt 20000000 ]; then
    echo "[Notice] server.jar missing or invalid. Running setup..."
    bash scripts/setup.sh
fi

echo "[Server] Starting Minecraft 1.20.4 ($MIN_RAM - $MAX_RAM)..."

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
