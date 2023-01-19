key_interact = keyboard_check_pressed(ord("E"))

if distance_to_object(obj_player) <= 2 {
	if key_interact and !instance_exists(obj_cutscene) and can_interact {
		can_interact = false;
		create_cutscene(t_scene_info);
		image_index = 1;
	}
}

if !instance_exists(obj_cutscene) {
	image_index = 0;	
}
