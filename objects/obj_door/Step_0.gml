//depth = -y;

var is_colliding = place_meeting(x,y,par_depth_object); //collision_rectangle(x+6,y-9,x-6,y,obj_player,false,false);
if is_colliding {
	image_index = 1;
	if play_sound {
		if instance_exists(obj_player) and distance_to_object(obj_player) < 75 
			audio_play_sound(snd_door_open,1,false);
		play_sound = false;
	}
} else {
	image_index = 0;
	if !play_sound {
		if instance_exists(obj_player) and distance_to_object(obj_player) < 75 
			audio_play_sound(snd_door_close,1,false);
		play_sound = true;
	}
}


if locked {
	key_interact = keyboard_check_pressed(ord("E"));
	if distance_to_object(obj_player) <= 4 {
		if key_interact and !instance_exists(obj_cutscene) {
			if !has_key {
				create_cutscene(t_scene_info);
			} else {
				//var k = variable_instance_get(obj_progress.id,key);
				//if k {
					locked = false;
					audio_play_sound(snd_door_unlock,1,false);
					instance_destroy(my_lock);
				//} else  create_cutscene(t_scene_info);
			}
		}
	}
}
