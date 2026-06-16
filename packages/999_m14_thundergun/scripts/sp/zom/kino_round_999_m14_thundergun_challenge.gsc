#include maps\_utility;
#include common_scripts\utility;

// Kino Round 999 Challenge for Plutonium T5 Zombies.
// M14 Thunder Gun variation.
// Mod-folder install:
// %localappdata%\Plutonium\storage\t5\mods\999_m14_thundergun\scripts\sp\zom\kino_round_999_m14_thundergun_challenge.gsc
// Loose-script install:
// %localappdata%\Plutonium\storage\t5\scripts\sp\zom\kino_round_999_m14_thundergun_challenge.gsc

init()
{
	kr999_start_once();
}

main()
{
	kr999_start_once();
}

kr999_start_once()
{
	if(IsDefined(level.kr999_started))
	{
		return;
	}

	level.kr999_started = true;
	level thread kr999_boot();
	level thread kr999_player_watcher();
}

kr999_boot()
{
	kr999_init_dvars();

	if(!GetDvarInt("kr999_enable"))
	{
		return;
	}

	while(GetDvar("mapname") == "")
	{
		wait 0.05;
	}

	if(GetDvar("mapname") != "zombie_theater")
	{
		return;
	}

	while(!IsDefined(level.round_number) || !IsDefined(level.zombie_vars))
	{
		wait 0.05;
	}

	target_round = kr999_get_target_round();
	kr999_prepare_round(target_round);

	// Keep the seed stable through the early map-start window. This avoids
	// the EnCoRe-style bug where the round number changes but speed stays low.
	for(i = 0; i < 80; i++)
	{
		if(!IsDefined(level.kr999_round_locked))
		{
			kr999_prepare_round(target_round);
		}
		else
		{
			kr999_apply_pacing(target_round);
		}

		wait 0.1;
	}
}

kr999_init_dvars()
{
	if(GetDvar("kr999_enable") == "")
	{
		SetDvar("kr999_enable", "1");
	}

	if(GetDvar("kr999_target_round") == "")
	{
		SetDvar("kr999_target_round", "999");
	}

	if(GetDvar("kr999_verbose") == "")
	{
		SetDvar("kr999_verbose", "1");
	}

	if(GetDvar("kr999_late_repair") == "")
	{
		SetDvar("kr999_late_repair", "1");
	}

	if(GetDvar("kr999_start_points") == "")
	{
		SetDvar("kr999_start_points", "1000000");
	}

	if(GetDvar("kr999_show_counter") == "")
	{
		SetDvar("kr999_show_counter", "1");
	}

	if(GetDvar("kr999_m14_thundergun") == "")
	{
		SetDvar("kr999_m14_thundergun", "1");
	}

	if(GetDvar("kr999_m14_thundergun_weapon") == "")
	{
		SetDvar("kr999_m14_thundergun_weapon", "thundergun_zm");
	}
}

kr999_get_target_round()
{
	target_round = GetDvarInt("kr999_target_round");

	if(target_round < 1)
	{
		target_round = 1;
	}

	return target_round;
}

kr999_prepare_round(target_round)
{
	level.round_number = target_round;
	level.first_round = false;
	level.kr999_round_total = kr999_expected_zombies(target_round);

	kr999_apply_pacing(target_round);
	level.zombie_health = kr999_calculate_health(target_round);

	if(!IsDefined(level.kr999_late_repair_threaded))
	{
		level.kr999_late_repair_threaded = true;
		level thread kr999_late_repair(target_round);
	}
}

kr999_apply_pacing(target_round)
{
	if(!IsDefined(level.zombie_vars))
	{
		return;
	}

	move_speed_multiplier = 8;
	if(IsDefined(level.zombie_vars["zombie_move_speed_multiplier"]))
	{
		move_speed_multiplier = level.zombie_vars["zombie_move_speed_multiplier"];
	}

	level.zombie_vars["zombie_spawn_delay"] = kr999_calculate_spawn_delay(target_round);

	if(target_round <= 1)
	{
		level.zombie_move_speed = 1;
	}
	else
	{
		level.zombie_move_speed = (target_round - 1) * move_speed_multiplier;
	}
}

kr999_calculate_spawn_delay(target_round)
{
	spawn_delay = 2.0;

	for(i = 1; i < target_round; i++)
	{
		if(spawn_delay > 0.08)
		{
			spawn_delay = spawn_delay * 0.95;
		}
		else
		{
			spawn_delay = 0.08;
		}
	}

	if(spawn_delay < 0.08)
	{
		spawn_delay = 0.08;
	}

	return spawn_delay;
}

kr999_calculate_health(target_round)
{
	health = 150;

	for(i = 2; i <= target_round; i++)
	{
		if(i >= 10)
		{
			health += int(health * 0.1);
		}
		else
		{
			health = int(health + 100);
		}
	}

	return health;
}

kr999_expected_zombies(target_round)
{
	max_ai = 24;
	ai_per_player = 6;

	if(IsDefined(level.zombie_vars["zombie_max_ai"]))
	{
		max_ai = level.zombie_vars["zombie_max_ai"];
	}

	if(IsDefined(level.zombie_vars["zombie_ai_per_player"]))
	{
		ai_per_player = level.zombie_vars["zombie_ai_per_player"];
	}

	multiplier = target_round / 5.0;
	if(multiplier < 1)
	{
		multiplier = 1;
	}

	if(target_round >= 10)
	{
		multiplier *= target_round * 0.15;
	}

	players = get_players();
	player_num = players.size;

	if(player_num < 1)
	{
		player_num = 1;
	}

	if(player_num == 1)
	{
		max_ai += int((0.5 * ai_per_player) * multiplier);
	}
	else
	{
		max_ai += int(((player_num - 1) * ai_per_player) * multiplier);
	}

	return max_ai;
}

kr999_late_repair(target_round)
{
	if(!GetDvarInt("kr999_late_repair"))
	{
		return;
	}

	// Wait until the first round has actually started building a spawn queue.
	for(i = 0; i < 120; i++)
	{
		if(IsDefined(level.zombie_total) && level.zombie_total > 0)
		{
			break;
		}

		if(kr999_count_normal_zombies() > 0)
		{
			break;
		}

		wait 0.1;
	}

	if(level.round_number != target_round)
	{
		level.round_number = target_round;
	}

	if(!IsDefined(level.zombie_total))
	{
		level.zombie_total = 0;
	}

	expected = kr999_expected_zombies(target_round);
	active = kr999_count_normal_zombies();
	current_total = level.zombie_total + active;
	level.kr999_round_total = expected;

	// If the loose script loaded after round 1 initialized, the queue will be
	// tiny. Replace it with the real target-round queue and clear early walkers.
	if(current_total < int(expected * 0.5))
	{
		level.zombie_total = expected - active;
		if(level.zombie_total < 0)
		{
			level.zombie_total = 0;
		}

		kr999_kill_active_normal_zombies();
	}

	level.kr999_round_locked = true;
	kr999_apply_pacing(target_round);
	level.zombie_health = kr999_calculate_health(target_round);
}

kr999_get_zombies_remaining()
{
	queued = 0;

	if(IsDefined(level.zombie_total))
	{
		queued = level.zombie_total;
	}

	return queued + kr999_count_counted_enemies();
}

kr999_count_counted_enemies()
{
	count = 0;
	enemies = GetAiSpeciesArray("axis", "all");

	if(!IsDefined(enemies))
	{
		return count;
	}

	for(i = 0; i < enemies.size; i++)
	{
		if(IsDefined(enemies[i].ignore_enemy_count) && enemies[i].ignore_enemy_count)
		{
			continue;
		}

		if(IsDefined(enemies[i].animname))
		{
			count++;
		}
	}

	return count;
}

kr999_count_normal_zombies()
{
	count = 0;
	zombies = GetAiSpeciesArray("axis", "all");

	if(!IsDefined(zombies))
	{
		return count;
	}

	for(i = 0; i < zombies.size; i++)
	{
		if(kr999_is_normal_zombie(zombies[i]))
		{
			count++;
		}
	}

	return count;
}

kr999_kill_active_normal_zombies()
{
	zombies = GetAiSpeciesArray("axis", "all");

	if(!IsDefined(zombies))
	{
		return;
	}

	for(i = 0; i < zombies.size; i++)
	{
		if(!kr999_is_normal_zombie(zombies[i]))
		{
			continue;
		}

		zombies[i] DoDamage(zombies[i].health + 666, zombies[i].origin);
	}
}

kr999_is_normal_zombie(zombie)
{
	if(!IsDefined(zombie))
	{
		return false;
	}

	if(!IsDefined(zombie.animname))
	{
		return false;
	}

	switch(zombie.animname)
	{
		case "zombie_dog":
		case "thief_zombie":
		case "monkey_zombie":
		case "astro_zombie":
		case "ape_zombie":
		case "director_zombie":
			return false;
	}

	return true;
}

kr999_player_watcher()
{
	while(true)
	{
		level waittill("connected", player);
		player thread kr999_player_spawned();
	}
}

kr999_player_spawned()
{
	self endon("disconnect");

	while(true)
	{
		self waittill("spawned_player");
		wait 1;

		if(!GetDvarInt("kr999_enable"))
		{
			continue;
		}

		if(GetDvar("mapname") != "zombie_theater")
		{
			continue;
		}

		self kr999_apply_start_points();
		self thread kr999_zombie_counter_hud();
		self thread kr999_m14_thundergun_watcher();

		if(GetDvarInt("kr999_verbose"))
		{
			target_round = kr999_get_target_round();
			self iPrintLnBold("^2Kino Round " + target_round + " Challenge loaded");
			self iPrintLn("Expected zombies: " + kr999_expected_zombies(target_round));
			self iPrintLn("Live zombies left: " + kr999_get_zombies_remaining());
			self iPrintLn("Spawn delay: " + level.zombie_vars["zombie_spawn_delay"] + " | Speed seed: " + level.zombie_move_speed);
		}
	}
}

kr999_apply_start_points()
{
	if(IsDefined(self.kr999_start_points_applied) && self.kr999_start_points_applied)
	{
		return;
	}

	start_points = GetDvarInt("kr999_start_points");
	if(start_points <= 0)
	{
		self.kr999_start_points_applied = true;
		return;
	}

	for(i = 0; i < 80; i++)
	{
		if(IsDefined(self.score))
		{
			break;
		}

		wait 0.05;
	}

	if(!IsDefined(self.score))
	{
		self.score = 0;
	}

	if(!IsDefined(self.old_score))
	{
		self.old_score = self.score;
	}

	if(self.score < start_points)
	{
		self.old_score = self.score;
		self.score = start_points;

		if(!IsDefined(self.score_total) || self.score_total < start_points)
		{
			self.score_total = start_points;
		}

		self maps\_zombiemode_score::set_player_score_hud();
		self notify("uie_hud_change");
	}

	self.kr999_start_points_applied = true;
}

kr999_m14_thundergun_watcher()
{
	self notify("kr999_m14_thundergun_stop");
	self endon("disconnect");
	self endon("kr999_m14_thundergun_stop");

	while(true)
	{
		if(GetDvarInt("kr999_m14_thundergun") && GetDvar("mapname") == "zombie_theater" && self HasWeapon("m14_zm"))
		{
			reward_weapon = kr999_get_m14_reward_weapon();
			self TakeWeapon("m14_zm");
			self maps\_zombiemode_weapons::weapon_give(reward_weapon, undefined, true);
			self iPrintLnBold("^2M14 wallbuy gave Thunder Gun");
			wait 1;
		}

		wait 0.1;
	}
}

kr999_get_m14_reward_weapon()
{
	reward_weapon = GetDvar("kr999_m14_thundergun_weapon");

	if(reward_weapon == "")
	{
		reward_weapon = "thundergun_zm";
	}

	return reward_weapon;
}

kr999_zombie_counter_hud()
{
	self notify("kr999_counter_hud_stop");
	self endon("disconnect");
	self endon("kr999_counter_hud_stop");

	if(IsDefined(self.kr999_counter_hud))
	{
		self.kr999_counter_hud Destroy();
		self.kr999_counter_hud = undefined;
	}

	if(!GetDvarInt("kr999_show_counter"))
	{
		return;
	}

	self.kr999_counter_hud = NewClientHudElem(self);
	self.kr999_counter_hud.horzAlign = "user_left";
	self.kr999_counter_hud.vertAlign = "user_top";
	self.kr999_counter_hud.alignX = "left";
	self.kr999_counter_hud.alignY = "top";
	self.kr999_counter_hud.x = 8;
	self.kr999_counter_hud.y = 92;
	self.kr999_counter_hud.fontScale = 1.35;
	self.kr999_counter_hud.foreground = true;
	self.kr999_counter_hud.hidewheninmenu = false;
	self.kr999_counter_hud.sort = 100;
	self.kr999_counter_hud.alpha = 1;
	self.kr999_counter_hud.color = (0.9, 0.9, 0.9);

	last_remaining = -1;
	last_total = -1;

	while(true)
	{
		remaining = kr999_get_zombies_remaining();
		total = kr999_get_counter_total();

		if(remaining < 0)
		{
			remaining = 0;
		}

		if(remaining != last_remaining || total != last_total)
		{
			if(total > 0)
			{
				self.kr999_counter_hud SetText("Zombies left: " + remaining + " / " + total);
			}
			else
			{
				self.kr999_counter_hud SetText("Zombies left: " + remaining);
			}

			last_remaining = remaining;
			last_total = total;
		}

		wait 0.25;
	}
}

kr999_get_counter_total()
{
	if(IsDefined(level.kr999_round_total))
	{
		return level.kr999_round_total;
	}

	return kr999_expected_zombies(kr999_get_target_round());
}
