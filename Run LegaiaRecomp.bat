@echo off
setlocal
cd /d "%~dp0"

if not exist "disc\SCUS_942.54" (
  echo Missing disc\SCUS_942.54. See README.md for setup.
  pause
  exit /b 1
)
if not exist "game\Legend of Legaia (USA).cue" (
  echo Missing game\Legend of Legaia (USA).cue. See README.md for setup.
  pause
  exit /b 1
)
if not exist "bios\SCPH1001.BIN" (
  echo Missing bios\SCPH1001.BIN. See README.md for setup.
  pause
  exit /b 1
)

"%~dp0LegaiaRecomp.exe" --game "%~dp0game.toml"
if errorlevel 1 (
  echo.
  echo LegaiaRecomp exited with an error. See psx_crash.txt or psx_last_run_report.json if present.
  pause
)
