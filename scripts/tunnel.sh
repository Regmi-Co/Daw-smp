#!/bin/bash
set -e

if [ ! -f "playit" ]; then
    echo "[Playit] Downloading Playit agent..."
    curl -SsL -o playit https://github.com/playit-cloud/playit-agent/releases/download/v0.15.26/playit-linux-amd64
    chmod +x playit
fi

echo "[Playit] Starting tunnel..."
exec ./playit
