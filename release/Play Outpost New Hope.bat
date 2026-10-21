@echo off
rem Starts Outpost: New Hope. Saved games are kept in the "saves" folder.
if not exist "%~dp0saves" mkdir "%~dp0saves"
cd /d "%~dp0saves"
start "" "%~dp0OutpostNewHope.exe" "%~dp0Outpost"
