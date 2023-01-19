// input
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));
key_atk = mouse_check_button_pressed(mb_left);
key_aim = mouse_check_button(mb_right);
key_reload = keyboard_check_pressed(ord("R"));
key_hp = keyboard_check_pressed(ord("F"));

// WALK STATE //
if state = "walk" {
	spd = walk_spd;
	
	if stamina <= 0 {
		can_sprint = false;
		if alarm[2] < 0  alarm[2] = 120;
	}
	
	// movement
	hsp = key_right - key_left;
	hsp *= spd;
	vsp = key_down - key_up;
	vsp *= spd;
	scr_collision(hsp, vsp, par_solid);

	// change state
	if key_aim and has_gun {
		state = "aim"
		aim_error = aim_error_max
	}
	
	// reload
	if key_reload and has_gun and ammo > 0 and ammo_in_clip < clip_max {
		//image_index = 0;
		//sprite_index = spr_player_rereload;
		state = "reload";
	}
	
	// animate
	if hsp = 0 and vsp = 0 {
		sprite_index = sprite_idle;
		image_index = 0;
	} else {
		sprite_index = sprite_walk;
	}
	if xprevious < x  image_xscale = 1;
	else if xprevious > x  image_xscale = -1;
}



// AIM STATE //
if state = "aim" {
	// initiate
	if last_state != state {
		if !instance_exists(obj_player_arm)  instance_create_layer(x-2,y-6,"bullets",obj_player_arm)
	}
	
	// movement
	hsp = key_right - key_left;
	hsp *= aim_spd;
	vsp = key_down - key_up;
	vsp *= aim_spd;
	scr_collision(hsp, vsp, par_solid);
	if obj_player_arm.canshoot  dir = point_direction(x-(2*image_xscale), y-9, mouse_x, mouse_y);
	
	// shoot
	if key_atk and obj_player_arm.canshoot {
		if ammo_in_clip > 0 {
			with obj_player_arm {
				canshoot = false;
				image_index = 1;
			}
			with instance_create_layer(obj_player_arm.x+lengthdir_x(6,dir), obj_player_arm.y+lengthdir_y(6,dir)-3, "bullets", obj_bullet) {
				rot = other.dir+random_range(-other.aim_error/2,other.aim_error/2);
				dmg = other.dmg_gun;
			}
			ammo_in_clip--;
			if aim_error+aim_error_max/4 < aim_error_max  aim_error+=aim_error_max/4
			else aim_error = aim_error_max;
			// sound
			audio_play_sound(snd_gunshot,0.9,false);
		} else if ammo > 0 {
			state = "reload";
		}
	}
	
	// aim error
	if aim_error > 2 and hsp+vsp = 0 {
		aim_error -= 0.075;
	}
	
	// reload
	if key_reload and has_gun and ammo > 0 and ammo_in_clip != clip_max {
		state = "reload";
		image_index = 0;
		//sprite_index = spr_player_rereload;
	}
	
	// change state
	if !key_aim and obj_player_arm.canshoot = true {
		image_speed = 1;
		state = "walk";
	}
	
	// animate
	if xprevious != x or yprevious != y  sprite_index = sprite_aim_walk;
	else  sprite_index = sprite_shoot;
	if rot > 90 and rot < 270 {
		image_xscale = -1;
	} else {
		image_xscale = 1;
	}
	rot = dir;
}


// HURT STATE //
if state = "hurt" {
	// leave state
	if !instance_exists(obj_qte) {
		state = "walk";
		invincible = true;
		alarm[0] = invincible_time;
		alarm[1] = 1;
		/*var enemy = instance_place(x,y,par_enemy);
		if enemy {
			scr_hurt(enemy,dmg_melee,point_distance(x,y,enemy.x,enemy.y));
		}*/
	}
	
	// animate
	image_speed = 1;
	sprite_index = sprite_hurt;
	var e = instance_nearest(x,y,par_enemy);
	if e.x < x  image_xscale = -1;
	else  image_xscale = 1;
}


// RELOAD STATE //
if state = "reload" {
	// initiate
	if last_state != state {
		if !instance_exists(obj_player_arm)  instance_create_layer(x-2,y-6,"bullets",obj_player_arm)
		obj_player_arm.sprite_index = spr_player_reload_arms
	}
	
	// movement
	hsp = key_right - key_left;
	hsp *= aim_spd;
	vsp = key_down - key_up;
	vsp *= aim_spd;
	scr_collision(hsp, vsp, par_solid);
	//dir = point_direction(x, y, mouse_x, mouse_y);
	
		// animate
	if hsp = 0 and vsp = 0 {
		sprite_index = sprite_aim_walk;
		image_index = 0;
	} else {
		sprite_index = sprite_aim_walk;
	}
	if xprevious < x  image_xscale = 1;
	else if xprevious > x  image_xscale = -1;
}

// CUTSCENE STATE //
if state = "cutscene" {
	hsp = 0; vsp = 0;
	if state != last_state {
		sprite_index = sprite_idle;
		image_speed = 0;	
	}
}

// actually die
if hp <= 0  state = "dead";
//if keyboard_check(vk_space)  state = "dead";
// DEAD STATE //
if state = "dead" {
	hp = 0;
	instance_destroy(obj_qte);
	if alarm[3] = -1  alarm[3] = 180;
	
	// animate
	sprite_index = sprite_dead;
	if image_index >= image_number-1 {
		image_index = image_number-1;
		image_speed = 0;
	}
}



// OTHER STUFF //
// pickup ammo/health
var ammo_pick = instance_place(x,y,obj_ammo_pickup);
if ammo_pick {
	ammo += ammo_pick.ammo_count;
	instance_destroy(ammo_pick);
}
var hp_pick = instance_place(x,y,obj_hp_pickup);
if hp_pick {
	hpkit_count++;
	instance_destroy(hp_pick);
}

// use hp kit
if key_hp and hp != max_hp and hpkit_count > 0 {
	if hp+5 < max_hp  hp += 5;
	else hp = max_hp;
	hpkit_count--;
}

// set light amount
if place_meeting(x,y,obj_light_area)  obj_lighting.light_lvl = 2;
else if place_meeting(x,y,obj_darkness)  obj_lighting.light_lvl = 0;
else  obj_lighting.light_lvl = 1;

// sound
if sprite_index = sprite_walk and (image_index = 0 or image_index = 6) and !audio_is_playing(snd_footsetp_player) {
	audio_play_sound(snd_footsetp_player,1,false);
} else if sprite_index = spr_player_walk and !audio_is_playing(snd_footsetp_player) and ((image_index < 1) or (image_index > 3 and image_index < 4)) {
	audio_play_sound(snd_footsetp_player,1,false);
} else if sprite_index = spr_player_aim_walk and ((image_index < 1) or (image_index > 3 and image_index < 4)) and !audio_is_playing(snd_footsetp_player) {
	audio_play_sound(snd_footsetp_player,1,false);
}
// go through doors
//var door = place_meeting(x+sign(hsp),y+sign(vsp),obj_door);  
//if door  room_goto(Room2);

