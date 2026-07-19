@echo off
setlocal
cd /d "%~dp0"

rem Keep parentheses out of IF statements: cmd.exe parses the literal
rem "Legend of Legaia (USA).cue" as control syntax inside a parenthesized block.
set "DISC_EXE=disc\SCUS_942.54"
set "GAME_CUE=game\Legend of Legaia (USA).cue"
set "GAME_BIN=game\Legend of Legaia (USA).bin"
set "BIOS_FILE=bios\SCPH1001.BIN"

if not exist "%DISC_EXE%" (
  echo Missing disc\SCUS_942.54. See README.md for setup.
  pause
  exit /b 1
)
if not exist "%GAME_CUE%" (
  echo Missing the game cue file in the game folder. See README.md for setup.
  pause
  exit /b 1
)
if not exist "%GAME_BIN%" (
  echo Missing the game BIN file in the game folder. See README.md for setup.
  pause
  exit /b 1
)
if not exist "%BIOS_FILE%" (
  echo Missing bios\SCPH1001.BIN. See README.md for setup.
  pause
  exit /b 1
)

rem Explicit asset paths prevent an old launcher selection from overriding this
rem release folder's game.toml paths on a later run.
"%~dp0LegaiaRecomp.exe" --game "%~dp0game.toml" --bios "%~dp0%BIOS_FILE%" --disc "%~dp0%GAME_BIN%"
if errorlevel 1 (
  echo.
  echo LegaiaRecomp exited with an error. See psx_crash.txt or psx_last_run_report.json if present.
  pause
)
