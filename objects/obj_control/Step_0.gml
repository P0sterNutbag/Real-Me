/*if keyboard_check_pressed(ord("Q")) {
	with instance_create_layer(0,0,"control",obj_transition) {
		next_room = floor_1;
		place = 1;
	}
	obj_player.has_gun = true;
}*/

// pause game
if keyboard_check_pressed(vk_escape) and !instance_exists(obj_pause) {
	instance_create_layer(0,0,"control",obj_pause);
}

/* pause game
if global.paused == true {
	if !surface_exists(paused_surf) {
	    if paused_surf == -1 {
	        instance_deactivate_all(true);
	    }
	    paused_surf = surface_create(room_width, room_height);
	    surface_set_target(paused_surf);
	    draw_surface(application_surface, 0, 0);
	    surface_reset_target();
	}
}
