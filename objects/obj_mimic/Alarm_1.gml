if instance_exists(obj_player) {
	if see_player and state = "chase" {
		var xtarg = obj_player.x;
		var ytarg = obj_player.y;
		scr_get_path_to_point(xtarg,ytarg,run_spd);
	}
}

alarm[1] = room_speed;