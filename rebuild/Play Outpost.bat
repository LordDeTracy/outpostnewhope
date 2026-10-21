@echo off
rem Starts the Outpost rebuild with the original game files in ..\Outpost.
rem Saved games (.OPS) are kept in the "saves" folder next to this file.
if not exist "%~dp0saves" mkdir "%~dp0saves"
cd /d "%~dp0saves"
start "" "%~dp0build-release\Release\outpost-rebuild.exe" "%~dp0..\Outpost"
