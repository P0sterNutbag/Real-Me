key_interact = keyboard_check_pressed(ord("E"))

if distance_to_object(obj_player) <= interact_dis and can_interact {
	if key_interact and !instance_exists(obj_cutscene) {
		create_cutscene(t_scene_info);
		if one_time  can_interact = false;
	}
}
