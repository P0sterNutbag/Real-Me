// player stats
max_hp = 10;
hp = max_hp;
walk_spd = 0.40;
run_spd = 0.35;
aim_spd = 0.05//0.025;
spd = walk_spd;
aim_error_max = 15;
aim_error = aim_error_max;
ammo = 0;
ammo_in_clip = ammo;
clip_max = 6;
max_stamina = 120;
stamina = max_stamina;
has_gun = false;

dmg_melee = 1;
dmg_gun = 3;

invincible_time = 80;

// sprites
sprite_idle = spr_player_idle;
sprite_walk = spr_player_run;
sprite_shoot = spr_player_shoot;
sprite_aim_walk = spr_player_aim_walk;
sprite_hurt = spr_player_hurt;
sprite_dead = spr_player_dead;

// create light
with instance_create_layer(x,y,"control",obj_light) {
	radius = 33;
	dad = other.id;
}

// dont change
dir = 0;
punching = false;
canhurt = true;
state = "walk"
rot = 0;
invincible = false;
can_sprint = true;
hpkit_count = 0;
last_state = state;
arm_offset = 2;
arm_index = 0;
has_key = false;
instance_create_layer(x,y,"control",obj_cast_shadow);
//enemies = ds_list_create();