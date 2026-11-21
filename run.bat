@echo off
set MIN_RAM=2G
set MAX_RAM=4G

if not exist server.jar (
    echo [Download] Downloading Minecraft 1.20.4 Server JAR...
    powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri 'https://api.purpurmc.org/v2/purpur/1.20.4/latest/download' -OutFile 'server.jar'"
)

echo [Server] Starting Minecraft Server...
java -Xms%MIN_RAM% -Xmx%MAX_RAM% -jar server.jar nogui
pause
