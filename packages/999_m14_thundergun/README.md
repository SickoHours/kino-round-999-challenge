# 999_m14_thundergun

BO1 round 999 challenge with a Kino M14 Thunder Gun twist.

## What It Does

- Starts supported BO1 Zombies maps on round 999.
- Gives each player 1,000,000 points.
- Shows a live zombie counter.
- On Kino, the first time each player buys/acquires `m14_zm`, it immediately swaps into `thundergun_zm`.
- Later M14 buys stay as the regular M14 by default.

## Supported Maps

The round 999 challenge supports:

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

The M14-to-Thunder-Gun swap is Kino-only.

## Loose Scripts Install

Copy this folder:

```text
packages\999_m14_thundergun\scripts
```

into:

```text
%localappdata%\Plutonium\storage\t5
```

Final file:

```text
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\bo1_round_999_m14_thundergun_challenge.gsc
```

Launch a supported BO1 Zombies map normally. You do not need to load a mod from the mod menu.

## Mod Menu Install

Copy this whole folder:

```text
packages\999_m14_thundergun
```

into:

```text
%localappdata%\Plutonium\storage\t5\mods
```

Final folder:

```text
%localappdata%\Plutonium\storage\t5\mods\999_m14_thundergun
```

Load `999_m14_thundergun` from the Plutonium T5 Zombies mod menu, then launch a supported map.

## Important

Use either loose scripts or the mod menu folder, not both at the same time.

If another version already exists here, replace it:

```text
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_base_challenge.gsc
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_m14_thundergun_challenge.gsc
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\bo1_round_999_base_challenge.gsc
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\bo1_round_999_m14_thundergun_challenge.gsc
```

Delete the older `kino_round_999_challenge.gsc` file if it exists from a previous install.

## Dvars

```text
/set kr999_m14_thundergun 1
/set kr999_m14_thundergun_weapon thundergun_zm
/set kr999_m14_thundergun_once 1
```

Disable the M14 swap:

```text
/set kr999_m14_thundergun 0
```

Allow repeated Thunder Gun buys:

```text
/set kr999_m14_thundergun_once 0
```

Use the upgraded Thunder Gun:

```text
/set kr999_m14_thundergun_weapon thundergun_upgraded_zm
```
