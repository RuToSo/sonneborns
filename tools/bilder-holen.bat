@echo off
rem Doppelklick genuegt: startet bilder-holen.ps1 ohne Windows-Skriptsperre.
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0bilder-holen.ps1"
if errorlevel 1 pause
