# Kino Round 999 Challenge

Plutonium T5 Zombies mod for Black Ops 1 Kino der Toten.

This seeds Kino into a high-round challenge state without god mode, noclip, external software, or a mod menu. It is meant for testing and playing the round normally from that state.

## Install From GitHub

1. Download the repository:

   - Click the green `Code` button on GitHub.
   - Click `Download ZIP`.
   - Extract the ZIP somewhere temporary, such as your Downloads folder.

2. Open your Plutonium T5 mods folder:

```text
%localappdata%\Plutonium\storage\t5\mods
```

3. Create or replace this folder:

```text
%localappdata%\Plutonium\storage\t5\mods\999
```

4. Copy this repository's files into that `999` folder.

The final layout must look like this:

```text
%localappdata%\Plutonium\storage\t5\mods\999
|-- README.md
|-- scripts
    |-- sp
        |-- zom
            |-- kino_round_999_challenge.gsc
```

The most important path is:

```text
%localappdata%\Plutonium\storage\t5\mods\999\scripts\sp\zom\kino_round_999_challenge.gsc
```

Do not leave the files nested like this:

```text
%localappdata%\Plutonium\storage\t5\mods\999\kino-round-999-challenge-main\scripts\...
```

If you see that extra `kino-round-999-challenge-main` folder, move its contents up into `mods\999`.

5. Start Plutonium T5 Zombies.

6. Load the `999` mod from the T5 Zombies mod menu, then launch Kino der Toten.

7. If you are already in-game after changing the script, run:

```text
map_restart
```

If the mod was already loaded and you only updated the script, `fast_restart` is usually enough. If the change does not appear, use `map_restart` or reload the `999` mod from the menu.

## Update An Existing Install

To update an existing `999` install, replace this file:

```text
%localappdata%\Plutonium\storage\t5\mods\999\scripts\sp\zom\kino_round_999_challenge.gsc
```

Then restart Kino with:

```text
fast_restart
```

## What It Changes

- Kino only: map name must be `zombie_theater`.
- Sets the initial round from `/set kr999_target_round`, default `999`.
- Starts each player with `1,000,000` points by default.
- Adds a live HUD counter showing actual zombies left this round.
- Seeds later-round pacing, health, movement speed, and high-round spawn delay.
- Repairs late-load cases by forcing the correct target-round zombie queue.

For solo round 999, the expected queue is `89,844` zombies, matching BO1's normal round count formula.

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

This is a source `.gsc` script installed as a Plutonium T5 `mods\999` folder.

No Treyarch, Activision, or Plutonium assets are included.

## License

No license has been selected yet.
