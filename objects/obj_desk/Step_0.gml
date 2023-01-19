key_interact = keyboard_check_pressed(ord("E"))

if distance_to_object(obj_player) <= interact_dis and can_interact{
	if key_interact and !instance_exists(obj_cutscene) {
		create_cutscene(t_scene_info);
		image_index = 1;
		audio_play_sound(snd_drawer_open,1,false);
	}
}

if image_index = 1 and !instance_exists(obj_cutscene) {
	image_index = 0;
	can_interact = false;
	audio_play_sound(snd_drawer_open,1,false);
}
