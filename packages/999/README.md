# 999

Base BO1 round 999 challenge.

## What It Does

- Starts supported BO1 Zombies maps on round 999.
- Gives each player 1,000,000 points.
- Shows a live zombie counter.
- Keeps the challenge playable without god mode or noclip.

## Supported Maps

```text
zombie_theater        Kino der Toten
zombie_pentagon       Five
zombie_cosmodrome     Ascension
zombie_coast          Call of the Dead
zombie_temple         Shangri-La
zombie_moon           Moon
zombie_cod5_prototype Nacht der Untoten
zombie_cod5_asylum    Verruckt
zombie_cod5_sumpf     Shi No Numa
zombie_cod5_factory   Der Riese
```

## Loose Scripts Install

Copy this folder:

```text
packages\999\scripts
```

into:

```text
%localappdata%\Plutonium\storage\t5
```

Final file:

```text
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\bo1_round_999_base_challenge.gsc
```

Launch a supported BO1 Zombies map normally.

## Mod Menu Install

Copy this whole folder:

```text
packages\999
```

into:

```text
%localappdata%\Plutonium\storage\t5\mods
```

Final folder:

```text
%localappdata%\Plutonium\storage\t5\mods\999
```

Load `999` from the Plutonium T5 Zombies mod menu, then launch a supported map.

## Important

Use either loose scripts or the mod menu folder, not both at the same time.

Do not run this base script at the same time as `bo1_round_999_m14_thundergun_challenge.gsc`.

Delete older `kino_round_999_challenge.gsc` or `kino_round_999_base_challenge.gsc` files if they exist from a previous install.

## Useful Dvars

```text
/set kr999_enable 1
/set kr999_target_round 999
/set kr999_start_points 1000000
/set kr999_show_counter 1
/set kr999_health_cap 2000000000
```

`kr999_health_cap` keeps round 999 health math inside the game script integer range.
