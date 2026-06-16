# Kino Round 999 Challenge

Plutonium T5 Zombies scripts for Black Ops 1 Kino der Toten.

This starts Kino in a high-round challenge state without god mode, noclip, or external software. You play the round normally from that state.

## Pick A Version

There are two versions in this repo:

```text
Base round 999 challenge:
scripts\sp\zom\kino_round_999_challenge.gsc

M14 Thunder Gun variation:
variants\m14-thundergun\scripts\sp\zom\kino_round_999_challenge.gsc
```

The base version gives round 999, 1,000,000 points, and a live zombie counter.

The M14 Thunder Gun variation does all of that, plus buying/acquiring the spawn-room M14 on Kino immediately swaps it into the Thunder Gun.

## Best Install: Loose Scripts Folder

Use this if you want the script to load without selecting a mod from the Plutonium mod menu.

1. Download this repo from GitHub:

   - Click `Code`.
   - Click `Download ZIP`.
   - Extract the ZIP.

2. Open your Plutonium T5 storage folder:

```text
%localappdata%\Plutonium\storage\t5
```

3. Choose one version.

For the base version, copy this repo folder:

```text
scripts
```

into:

```text
%localappdata%\Plutonium\storage\t5
```

For the M14 Thunder Gun variation, copy this folder:

```text
variants\m14-thundergun\scripts
```

into:

```text
%localappdata%\Plutonium\storage\t5
```

4. The final loose-script file must be here:

```text
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_challenge.gsc
```

5. Start Plutonium T5 Zombies and launch Kino der Toten normally.

You do not need to load a mod from the mod menu when using the loose scripts folder.

## Mod Menu Install

Use this if you prefer loading the script as a named Plutonium mod.

1. Open your Plutonium T5 mods folder:

```text
%localappdata%\Plutonium\storage\t5\mods
```

2. Create one folder for the version you want:

```text
Base version:
%localappdata%\Plutonium\storage\t5\mods\999

M14 Thunder Gun variation:
%localappdata%\Plutonium\storage\t5\mods\999_m14_thundergun
```

3. Copy the chosen package into that folder.

For the base version, copy the root `README.md` and `scripts` folder so the layout becomes:

```text
%localappdata%\Plutonium\storage\t5\mods\999
|-- README.md
|-- scripts
    |-- sp
        |-- zom
            |-- kino_round_999_challenge.gsc
```

For the M14 Thunder Gun variation, copy the contents of:

```text
variants\m14-thundergun
```

so the layout becomes:

```text
%localappdata%\Plutonium\storage\t5\mods\999_m14_thundergun
|-- README.md
|-- scripts
    |-- sp
        |-- zom
            |-- kino_round_999_challenge.gsc
```

4. Start Plutonium T5 Zombies.

5. Load `999` or `999_m14_thundergun` from the T5 Zombies mod menu, then launch Kino der Toten.

## Avoid Overlap

Use one loading method at a time.

Do not keep this file active in the loose scripts folder:

```text
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_challenge.gsc
```

while also loading `999` or `999_m14_thundergun` from the mod menu.

Also do not install both versions into the same loose script path at the same time. The loose path can only hold one `kino_round_999_challenge.gsc`, so replace it when switching versions.

## Restart After Updating

If you update the script while already in-game, try:

```text
fast_restart
```

If the change does not appear, use:

```text
map_restart
```

or reload the mod from the Plutonium mod menu if you are using the mod menu install.

## What The Base Version Changes

- Kino only: map name must be `zombie_theater`.
- Sets the initial round from `/set kr999_target_round`, default `999`.
- Starts each player with `1,000,000` points by default.
- Adds a live HUD counter showing actual zombies left this round.
- Seeds later-round pacing, health, movement speed, and high-round spawn delay.
- Repairs late-load cases by forcing the correct target-round zombie queue.

For solo round 999, the expected queue is `89,844` zombies, matching BO1's normal round count formula.

## M14 Thunder Gun Variation

The variation in `variants\m14-thundergun` adds these dvars:

```text
/set kr999_m14_thundergun 1
/set kr999_m14_thundergun_weapon thundergun_zm
```

To disable the M14 swap:

```text
/set kr999_m14_thundergun 0
```

To make the wallbuy give the upgraded Thunder Gun instead:

```text
/set kr999_m14_thundergun_weapon thundergun_upgraded_zm
```

The swap happens after the game gives `m14_zm`, so the normal M14 wallbuy interaction and cost still happen first.

## Console Dvars

Set these before starting or restarting Kino if you want to adjust behavior:

```text
/set kr999_enable 1
/set kr999_target_round 999
/set kr999_verbose 1
/set kr999_late_repair 1
/set kr999_start_points 1000000
/set kr999_show_counter 1
```

Keep `kr999_late_repair` on unless you are debugging. It fixes the common case where the script loads just after the round-one spawn loop initialized.

## Notes

No Treyarch, Activision, or Plutonium assets are included.

## License

No license has been selected yet.
