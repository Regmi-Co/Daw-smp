@echo off
set MIN_RAM=2G
set MAX_RAM=4G

if not exist paper.jar (
    echo [Download] Downloading Paper 1.20.4...
    powershell -Command "Invoke-WebRequest -Uri 'https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/499/downloads/paper-1.20.4-499.jar' -OutFile 'paper.jar'"
)

echo [Server] Starting Minecraft Server...
java -Xms%MIN_RAM% -Xmx%MAX_RAM% -jar paper.jar nogui
pause
