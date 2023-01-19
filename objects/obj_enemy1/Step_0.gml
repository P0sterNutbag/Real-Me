event_inherited();

if instance_exists(obj_player) {
	var dif = angle_difference(rot,point_direction(x,y,obj_player.x,obj_player.y-1));
	var dis = point_distance(x,y,obj_player.x,obj_player.y);
	if (!collision_line(x,y,obj_player.x,obj_player.y-1,par_block_view_solid,false,false) or !collision_line(x,y,obj_player.x,obj_player.y-obj_player.sprite_height,par_block_view_solid,false,false)) 
	and (!collision_line(x,y,obj_player.x,obj_player.y-1,par_block_view,false,false) or !collision_line(x,y,obj_player.x,obj_player.y-obj_player.sprite_height,par_block_view,false,false)) 
	and dif < 50 and dif > -50 and dis < 100 {
		see_player = true;
		//image_blend = c_white;
	} else {
		see_player = false;
		//image_blend = c_red;
	}
} else  see_player = false;

// WAIT STATE //
if state = "wait" {
	// wander
	if instance_exists(obj_player) and distance_to_object(obj_player) < 140 {
		if alarm[1] = -1  alarm[1] = random(240);
		if point_distance(x,y,xtarg,ytarg) > 1 {
			dir = point_direction(x,y,xtarg,ytarg);
			hsp = lengthdir_x(spd,dir);
			vsp = lengthdir_y(spd,dir);
			scr_collision(hsp,vsp,par_solid);
		}
	}
	
	// check for player
	if see_player {
		state = "chase"
	}
	
	// animate
	if dir > 90 and dir < 270  image_xscale = -1;
	else  image_xscale = 1;
	if x != xprevious or y != yprevious {
		sprite_index = chase_sprite;
	}  else {
		sprite_index = idle_sprite;
	}
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
			if see_time > 0 {
				xtarg = obj_player.x;
				ytarg = obj_player.y;
				see_time -= 1;
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
	   
	if !position_meeting(obj_player.x,obj_player.y,self) {
		if see_targ {
			if path_index != -1  path_end();
			dir = point_direction(x,y,xtarg,ytarg);
			hsp = lengthdir_x(spd,dir);
			vsp = lengthdir_y(spd,dir);
		} else { // set path to target that is blocked
			hsp = 0;
			vsp = 0;
			scr_get_path_to_point(xtarg,ytarg,spd);
		}
	}
	
	if position_meeting(obj_player.x,obj_player.y,self) {
		path_end();
		hsp = 0;
		vsp = 0;
		point_direction(x,y,obj_player.x,obj_player.y);
	}
	
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
	
	// trasition to search
	if distance_to_point(xtarg,ytarg) < 1 and !see_player {
		if return_timer <= 0 {
			state = "return";
			search_x = x;
			search_y = y;
			//search_dir = rot;
			search_count = random_range(2,3);
		} else {
			return_timer--;
			path_end();
			hsp = 0;
			vsp = 0;
		}
	} else  return_timer = 120;
	
	// actually move
	scr_collision(hsp,vsp,par_solid);
	
	// animate
	sprite_index = chase_sprite
	//rot += angle_difference(dir,rot) * 0.02;
}	


// ATTACK STATE //
if state = "attack" {
	if obj_player.state != "hurt" {
		state = "stun";
		stun_timer = 60;
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


// RETURN STATE //
if state = "return" {
	//image_blend = c_green
	scr_get_path_to_point(xorg,yorg,spd);
	if distance_to_point(xorg,yorg) < 2 {
		state = "wait"
	}
	if see_player  state = "chase";
}


// SOUND
if instance_exists(obj_player) and distance_to_object(obj_player) < 90 and state != "cutscene" {
	if sprite_index = chase_sprite and (image_index > 2 and image_index < 3) and !audio_is_playing(snd_footstep_enemy) {
		audio_play_sound(snd_footstep_enemy,0.75,false);
	} else if sprite_index = attack_sprite and (image_index > 2 and image_index < 3) and !audio_is_playing(snd_enemy_bite) {
		audio_play_sound(snd_enemy_bite,0.75,false);
	}
}
