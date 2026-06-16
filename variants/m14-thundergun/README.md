# Kino Round 999 M14 Thunder Gun Variation

This variation keeps the round 999 setup, 1,000,000 starting points, and live zombie counter from the base script.

It adds one gameplay change for Kino der Toten: buying/acquiring `m14_zm` immediately swaps it into `thundergun_zm`.

## Loose Scripts Install

Copy this folder:

```text
variants\m14-thundergun\scripts
```

into:

```text
%localappdata%\Plutonium\storage\t5
```

The final file should be:

```text
%localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_challenge.gsc
```

Launch Kino normally. You do not need to load a mod from the mod menu.

## Mod Menu Install

Create this folder:

```text
%localappdata%\Plutonium\storage\t5\mods\999_m14_thundergun
```

Copy the contents of `variants\m14-thundergun` into it.

The final layout should be:

```text
%localappdata%\Plutonium\storage\t5\mods\999_m14_thundergun
|-- README.md
|-- scripts
    |-- sp
        |-- zom
            |-- kino_round_999_challenge.gsc
```

Then load `999_m14_thundergun` from the Plutonium T5 Zombies mod menu before launching Kino.

## Important

Use either loose scripts or the mod menu folder, not both at the same time.

If you already have another version at this loose path, replace it:

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
