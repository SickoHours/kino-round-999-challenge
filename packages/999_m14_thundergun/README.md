# 999_m14_thundergun

Kino round 999 challenge with an M14 Thunder Gun twist.

## What It Does

- Starts Kino der Toten on round 999.
- Gives each player 1,000,000 points.
- Shows a live zombie counter.
- Buying/acquiring `m14_zm` immediately swaps it into `thundergun_zm`.

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
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_challenge.gsc
```

Launch Kino normally. You do not need to load a mod from the mod menu.

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

Load `999_m14_thundergun` from the Plutonium T5 Zombies mod menu, then launch Kino.

## Important

Use either loose scripts or the mod menu folder, not both at the same time.

If another version already exists here, replace it:

```text
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_challenge.gsc
```

## Dvars

```text
/set kr999_m14_thundergun 1
/set kr999_m14_thundergun_weapon thundergun_zm
```

Disable the M14 swap:

```text
/set kr999_m14_thundergun 0
```

Use the upgraded Thunder Gun:

```text
/set kr999_m14_thundergun_weapon thundergun_upgraded_zm
```
