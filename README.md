# Legend of Legaia Recompiled

Community Windows playtest build for **Legend of Legaia (USA)**, built with [psxrecomp](https://github.com/SamSteProjects/psxrecomp).

> [!WARNING]
> This is an early playtest build, not an official release. Keep your original saves backed up and report reproducible problems with a location, action, and crash report where possible.

## What has been tested

- Field, town, and world-map traversal
- Cutscenes and FMVs
- Saving and loading through the in-game memory-card screen
- Standard attacks, combo chains, items, Spirit, Hyper Arts, and summons
- Muscle Dome, Sol Fever Disco, Baka Fighter, Wild Card slot machine, and fishing
- The optional runtime debug overlay and the retail in-game developer menu

## What you need

This project cannot provide any Sony or game data. You must supply your own legally dumped North American copy of the game and a legally dumped US PS1 BIOS.

- `SCUS_942.54` from the USA game disc
- The matching USA disc image as a `.cue` + `.bin` pair
- `SCPH1001.BIN` (US PS1 BIOS)

## Setup

1. Download and extract the latest `LegaiaRecomp-windows-x64.zip` from [Releases](../../releases).
2. Place the extracted `SCUS_942.54` at `disc\\SCUS_942.54`.
3. Put the matching `.cue` and `.bin` in `game\\`. The cue file must be named `Legend of Legaia (USA).cue` or update `game.toml` to match it.
4. Put your BIOS at `bios\\SCPH1001.BIN`.
5. Run `Run LegaiaRecomp.bat`.

The game creates virtual memory cards in `saves\\`. Back up that folder before trying experimental builds.

## Debug tools

`F10` opens the external runtime overlay. In its `WARP` panel:

- `Enter` opens Legaia's compact retail developer menu (field/town only).
- `F` launches Fishing through the same retail transition used by a fishing pond, and returns to the prior field or town on exit.

The retail developer menu can also be opened with **Select + Y** on an Xbox controller while in a normal field/town state.

## Reporting a problem

Open an issue with the release version, your Windows version, location/action immediately before the problem, whether it is repeatable, and any `psx_crash.txt`, `psx_last_run_report.json`, or `Ctrl+F12` snapshot produced beside the executable.

Do not upload game images, BIOS files, or copyrighted extracted game assets.

## Credits

- [mstan/psxrecomp](https://github.com/mstan/psxrecomp) and its contributors
- [SamSteProjects/psxrecomp](https://github.com/SamSteProjects/psxrecomp), the Legaia runtime fork
- [AndrewAltimit/legend-of-legaia-re](https://github.com/AndrewAltimit/legend-of-legaia-re) for reverse-engineering documentation that guided the overlay work

Legend of Legaia and all associated game assets are property of their respective rights holders. This project is not affiliated with Sony or the original developers/publishers.
