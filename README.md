# Kino Round 999 Challenge

Plutonium T5 Zombies mod for Black Ops 1 Kino der Toten.

This seeds Kino into a high-round challenge state without god mode, noclip, external software, or a mod menu. It is meant for testing and playing the round normally from that state.

## Install

1. Open:

```text
%localappdata%\Plutonium\storage\t5\mods
```

2. Copy this repository folder as `999`, so the final script path is:

```text
%localappdata%\Plutonium\storage\t5\mods\999\scripts\sp\zom\kino_round_999_challenge.gsc
```

3. Start Plutonium T5 Zombies, load the `999` mod, and launch Kino der Toten.

4. If you are already in-game after changing the script, run:

```text
map_restart
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
