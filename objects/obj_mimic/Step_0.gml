event_inherited();

if instance_exists(obj_player) { //and !keyboard_check(vk_space) {
	var dif = angle_difference(dir,point_direction(x,y-8,obj_player.x,obj_player.y-1))
	if (!collision_line(x,y-8,obj_player.x,obj_player.y-1,par_solid,false,false) or !collision_line(x,y-8,obj_player.x,obj_player.y-obj_player.sprite_height,par_solid,false,false)) 
	and dif < 75 and dif > -75 {
		see_player = true;
		//image_blend = c_white;
	} else {
		see_player = false;
		//image_blend = c_red;
	}
} else  see_player = false;

// IDLE STATE //
if state = "patrol" {
	// detect player
	if instance_exists(obj_player) {
		if see_player {
			// start chase
			path_end();
			state = "chase"
		} else {
			// start path
			if path_index = -1 {
				var pos = scr_get_path_position(mypath,x,y,4);
				path_start(mypath,walk_spd,path_action_reverse,true);
				// set path position
				path_position = pos;
			}
		}
	}
	
	// animte
	sprite_index = spr_mimic1_run;
}


// CHASE STATE
if state = "chase" {
	// get target position
	if instance_exists(obj_player) {
		if see_player {
			xtarg = obj_player.x;
			ytarg = obj_player.y-1;
			see_time = 40;
		} else {
			see_time -= 1;
			if see_time > 0 {
				xtarg = obj_player.x;
				ytarg = obj_player.y;
			}
		}
	}
	// move towards target
	if collision_line(bbox_right,bbox_bottom,xtarg,ytarg,par_solid,false,false) 
	or collision_line(bbox_right,bbox_top,xtarg,ytarg,par_solid,false,false) 
	or collision_line(bbox_left,bbox_bottom,xtarg,ytarg,par_solid,false,false) 
	or collision_line(bbox_left,bbox_top,xtarg,ytarg,par_solid,false,false) {
		see_targ = false;
	} else {
		see_targ = true;
	}
	  
	if distance_to_point(xtarg,ytarg) > run_spd+1 {
		dir = point_direction(x,y,xtarg,ytarg);
		if see_targ {
			if path_index != -1  path_end();
			hsp = lengthdir_x(run_spd,dir);
			vsp = lengthdir_y(run_spd,dir);
		} else { // set path to target that is blocked
			hsp = 0;
			vsp = 0;
			if path_index = -1  scr_get_path_to_point(xtarg,ytarg,run_spd);
		}
	} else if !see_player {
		state = "search";
		dir = random(360)
		search_wait = 30;
		search_time = 60;
		search_count = random_range(2,3);
	}
	
	// actually move
	scr_collision(hsp,vsp,par_solid);
	
	// hurt player 
	if place_meeting(x,y,obj_player) {
		if canhurt {
			path_end();
			scr_hurt(obj_player,dmg,dir);
			state = "attack";
			canhurt = false;
		} 
	} else {
		canhurt = true;
	}
	
	// animate
	sprite_index = chase_sprite
	if path_index = -1 {
		if dir > 90 and dir < 270  image_xscale = -1;
		else  image_xscale = 1;
	}
}	


// ATTACK STATE //
if state = "attack" {
	if obj_player.state != "hurt" {
		state = "stun";
		stun_timer = 90;
	}
	sprite_index = attack_sprite;
	if instance_exists(obj_player) {
		if obj_player.x > x  image_xscale = 1;
		else  image_xscale = -1;
	} else  state = "wait";
}

// STUN STATE
if state = "stun" {
	stun_timer--;
	if stun_timer <= 0  state = "chase";
	sprite_index = stun_sprite;
}

// HURT PART 2
if state = "hurt" {
	// drop key
	if has_key {
		has_key = false;
		var d = point_direction(x,y,x+hsp,y+vsp);
		with instance_create_layer(x,y,"bullets",obj_key) {
			dir = d;
		}
	}
}

// SEARCH //
if state = "search" {
	//if search_count > 0 {
		if search_time > 0 and !collision_line(x,y,x+lengthdir_x(6,dir),y+lengthdir_y(6,dir),par_solid,false,true) {
			hsp = lengthdir_x(walk_spd,dir);
			vsp = lengthdir_y(walk_spd,dir);
			search_time--;
			search_wait = 30;
		} else {
			hsp = 0; vsp = 0;
			search_wait--;
			if search_wait <= 0 {
				dir = random(360);
				search_time = random_range(60,200);
				//search_count--;
			}
		}
		scr_collision(hsp,vsp,par_solid);
	/*} else { // return
		state = "return";
		point_goto = scr_nearest_path_point(mypath,x,y);
		scr_get_path_to_point(point_goto[0],point_goto[1],walk_spd);
	}*/
	
	// detect player and chase
	if see_player {
		state = "chase";
	}
	
	// animate
	if hsp != 0 and vsp != 0 {
		sprite_index = chase_sprite;
		if xprevious > x  image_xscale = -1
		else  image_xscale = 1;
	} else {
		sprite_index = idle_sprite;
	}
}


// RETURN //
if state = "return" {
	// go back to patrol
	if distance_to_point(point_goto[0],point_goto[1]) <= 4 {
		if round(x) == point_goto[0] and round(y) == point_goto[1] {//if distance_to_point(point_goto[0],point_goto[1]) <= 0.01 {
			path_end();
			//image_blend = c_green;
			state = "patrol";
		} else {
			dir = point_direction(x,y,point_goto[0],point_goto[1]);
			hsp = lengthdir_x(walk_spd,dir);
			vsp = lengthdir_y(walk_spd,dir);
			scr_collision(hsp,vsp,par_solid);
		}
	}
	
	// detect player and chase
	if see_player {
		state = "chase";
	}
	
	// animte
	sprite_index = spr_mimic1_run;
}

// OTHER //
// play music by proximity to player
var player_dis = distance_to_object(obj_player);
if state = "chase" {
	if !audio_is_playing(snd_chase_music) {
		audio_play_sound(snd_chase_music,0.8,true);
		audio_sound_gain(snd_chase_music,0,0);
		audio_sound_gain(snd_chase_music,1,1000);
	}
} else {
	audio_sound_gain(snd_chase_music,1,1000);
}

// footstep sound
if instance_exists(obj_player) and player_dis < 90 {
	if sprite_index = spr_mimic1_run and (image_index = 0 or image_index = 6) and !audio_is_playing(snd_footstep_mimic) {
		audio_play_sound(snd_footstep_mimic,0.75,false);
	} else if (sprite_index = spr_mimic1_walk or sprite_index = spr_mimic2_walk) and ((image_index < 1) or (image_index > 3 and image_index < 4)) and !audio_is_playing(snd_footstep_mimic){
		audio_play_sound(snd_footstep_mimic,0.75,false);
	} else if sprite_index = spr_mimic1_attack and (image_index > 2 and image_index < 3) and !audio_is_playing(snd_stab) {
		//audio_play_sound(snd_stab,0.75,false);
	}
}
