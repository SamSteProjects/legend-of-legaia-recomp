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
rem Legaia's libcd callback polls the CD response registers directly.  Keep
rem the response hidden until its normal IRQ presentation delay has elapsed;
rem otherwise battle XA audio can run ahead of the animation.  Do not raise
rem XA sector cadence here: PSX_XA_ACTION_SPEED=2 is diagnostic-only and can
rem drop later Hyper Art audio.
set "PSX_CD_RESPONSE_VISIBILITY_DELAY=1"
set "PSX_XA_ACTION_SPEED=1"
"%~dp0LegaiaRecomp.exe" --game "%~dp0game.toml" --bios "%~dp0%BIOS_FILE%" --disc "%~dp0%GAME_BIN%"
if errorlevel 1 (
  echo.
  echo LegaiaRecomp exited with an error. See psx_crash.txt or psx_last_run_report.json if present.
  pause
)
