@echo off
set VERSION=26.3
set MIN_RAM=2G
set MAX_RAM=4G

if not exist server-version.txt (
    del /f /q server.jar 2>nul
)

if not exist server.jar (
    echo [Download] Downloading Minecraft %VERSION% Server JAR...
    powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri 'https://api.purpurmc.org/v2/purpur/%VERSION%/latest/download' -OutFile 'server.jar'"
    echo %VERSION% > server-version.txt
)

echo [Server] Starting Minecraft Server %VERSION%...
java -Xms%MIN_RAM% -Xmx%MAX_RAM% -jar server.jar nogui
pause
