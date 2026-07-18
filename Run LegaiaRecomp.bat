@echo off
setlocal

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

LegaiaRecomp.exe --game game.toml
