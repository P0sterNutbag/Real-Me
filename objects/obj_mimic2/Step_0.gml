// follow player
if state = "walk" {
	if instance_exists(obj_player) and follow {
		// detect player
		if collision_line(bbox_right,bbox_bottom,obj_player.x,obj_player.y-2,par_solid,false,false) 
		or collision_line(bbox_right,bbox_top,obj_player.x,obj_player.y-2,par_solid,false,false) 
		or collision_line(bbox_left,bbox_bottom,obj_player.x,obj_player.y-2,par_solid,false,false) 
		or collision_line(bbox_left,bbox_top,obj_player.x,obj_player.y-2,par_solid,false,false) {
			see_targ = false;
		} else {
			see_targ = true;
		}
		// move toward player if in sight
		/*dir = point_direction(x,y,obj_player.x,obj_player.y);
		dis = distance_to_object(obj_player);
		if see_targ {
			path_end();
			if dis > 10 {
				hsp = lengthdir_x(spd,dir)
				vsp = lengthdir_y(spd,dir)
			} else {
				hsp = 0
				vsp = 0
			}
		} else {
			hsp = 0;
			vsp = 0;*/
			scr_get_path_to_point(obj_player.x,obj_player.y,spd);
		//}
		//scr_collision(hsp,vsp,par_solid);
	
		// change speed based on distance
		var d = distance_to_object(obj_player)
		if d > 40  spd = 0.4;
		else  spd = 0.35;
		
		// star path and stop close to player 
		if d < 12 {
			if path_index != -1  path_end();
		} else {
			scr_get_path_to_point(obj_player.x,obj_player.y,spd);
		}	
	}
}

if state = "cutscene" {
	path_end();
	image_speed = 0;
}


// footstep sound
if instance_exists(obj_player) and distance_to_object(obj_player) < 75 {
	if sprite_index = spr_mimic2_run and (image_index = 0 or image_index = 6) and !audio_is_playing(snd_footstep_mimic) {
		audio_play_sound(snd_footstep_mimic,0.75,false);
	} else if (sprite_index = spr_mimic1_walk or sprite_index = spr_mimic2_walk) and ((image_index < 1) or (image_index > 3 and image_index < 4)) and !audio_is_playing(snd_footstep_mimic) {
		audio_play_sound(snd_footstep_mimic,0.75,false);
	}
}
