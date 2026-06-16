# Kino Round 999 Challenge

Plutonium T5 Zombies scripts for Black Ops 1 Kino der Toten.

This repo is organized around install-ready packages. Pick one package, copy it, and play.

## What To Download

Click `Code` -> `Download ZIP`, then extract the ZIP.

Inside the extracted folder, open:

```text
packages
```

You will see:

```text
packages
|-- 999
|   |-- README.md
|   |-- scripts
|       |-- sp
|           |-- zom
|               |-- kino_round_999_base_challenge.gsc
|
|-- 999_m14_thundergun
    |-- README.md
    |-- scripts
        |-- sp
            |-- zom
                |-- kino_round_999_m14_thundergun_challenge.gsc
```

## Pick One Package

`999`

Base round 999 challenge. Starts Kino on round 999, gives 1,000,000 points, and shows a live zombie counter.

`999_m14_thundergun`

Everything from `999`, plus each player gets one Thunder Gun from the spawn-room M14.

## File Names

The package folder names are the mod names:

```text
999
999_m14_thundergun
```

Each package uses a versioned script filename:

```text
kino_round_999_base_challenge.gsc
kino_round_999_m14_thundergun_challenge.gsc
```

That makes it easier to see which version is installed. Only install one package at a time unless you are using the mod menu folders.

## Easiest Install: Loose Scripts

Use this if you want the script to load automatically when you launch Kino.

1. Choose one package: `999` or `999_m14_thundergun`.

2. Copy that package's `scripts` folder into:

```text
%localappdata%\Plutonium\storage\t5
```

3. The final path must be:

```text
Base:
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_base_challenge.gsc

M14 Thunder Gun:
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_m14_thundergun_challenge.gsc
```

4. Launch Plutonium T5 Zombies and start Kino der Toten normally.

You do not need to load anything from the mod menu with this install method.

## Mod Menu Install

Use this if you want to select the mod from the Plutonium T5 Zombies mod menu.

1. Open:

```text
%localappdata%\Plutonium\storage\t5\mods
```

2. Copy one whole package folder into `mods`.

For the base version, copy:

```text
packages\999
```

so the final folder is:

```text
%localappdata%\Plutonium\storage\t5\mods\999
```

For the M14 Thunder Gun version, copy:

```text
packages\999_m14_thundergun
```

so the final folder is:

```text
%localappdata%\Plutonium\storage\t5\mods\999_m14_thundergun
```

3. Start Plutonium T5 Zombies.

4. Load `999` or `999_m14_thundergun` from the mod menu, then launch Kino der Toten.

## Important: Do Not Double Load

Use one install method at a time.

Delete this old filename if you still have it from an earlier install:

```text
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_challenge.gsc
```

Do not keep this loose script active:

```text
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_base_challenge.gsc
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_m14_thundergun_challenge.gsc
```

while also loading `999` or `999_m14_thundergun` from the mod menu.

Also do not install both packages into the loose scripts folder at the same time. The filenames are different now, but both scripts change the same round setup, so keep only the one you want active.

Do not copy the whole `kino-round-999-challenge-main` download folder into `mods`. Open `packages` first, then copy only `999` or `999_m14_thundergun`.

## Restart After Updating

If you update the script while already in-game, try:

```text
fast_restart
```

If the change does not appear, use:

```text
map_restart
```

or reload the mod from the Plutonium mod menu if you installed it as a mod.

## Dvars

Base settings:

```text
/set kr999_enable 1
/set kr999_target_round 999
/set kr999_verbose 1
/set kr999_late_repair 1
/set kr999_start_points 1000000
/set kr999_show_counter 1
```

Extra M14 Thunder Gun settings:

```text
/set kr999_m14_thundergun 1
/set kr999_m14_thundergun_weapon thundergun_zm
/set kr999_m14_thundergun_once 1
```

Use the upgraded Thunder Gun instead:

```text
/set kr999_m14_thundergun_weapon thundergun_upgraded_zm
```

## Notes

The live zombie counter uses numeric HUD values instead of rebuilding text every update. This avoids config-string overflow during very high-round counts.

No Treyarch, Activision, or Plutonium assets are included.

## License

No license has been selected yet.
