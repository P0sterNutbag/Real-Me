depth = -y;

var is_colliding = collision_rectangle(x+6,y-9,x-6,y,obj_player,false,false);
/*if is_colliding {
	state = "open"
} else {
	image_index = 0;
}*/

if state = "open" {
	image_index = 1;
	if !is_colliding {
		state = "closed";
		if y <= obj_player.y  player_inside = false;
		else  player_inside = true;
	}
}
if state = "closed" {
	image_index = 0;
	if player_inside  mask_index = inside_mask
	else  mask_index = sprite_index;
	if is_colliding {
		state = "open";
		//if player_inside  player_inside = false;
		//else player_inside = true;
	}
}

if locked {
	key_interact = keyboard_check_pressed(ord("E"));
	if distance_to_object(obj_player) <= 4 {
		if key_interact and !instance_exists(obj_cutscene) {
			if key = noone  create_cutscene(t_scene_info);
			else {
				var k = variable_instance_get(obj_progress.id,key);
				if k {
					locked = false;
					instance_destroy(instance_place(x,y,obj_lock));
				} else  create_cutscene(t_scene_info);
			}
		}
	}
}


/*if image_index = 1 {
	instance_destroy(view_blocker);
	instance_destroy(view_blocker2);
	instance_destroy(view_blocker3);
	instance_destroy(view_blocker4);
} else {
	if y > obj_player.y {
			if !instance_exists(view_blocker2) {
				view_blocker2 = instance_create_layer(x,y,"terrain",obj_door_viewblocker);
				with view_blocker2  sprite_index = spr_door_viewblocker2;
			}
			if !instance_exists(view_blocker3) {
				view_blocker3 = instance_create_layer(x,y,"terrain",obj_door_viewblocker);
				with view_blocker3  sprite_index = spr_door_viewblocker3;
			}
			if !instance_exists(view_blocker4) {
				view_blocker4 = instance_create_layer(x,y,"terrain",obj_door_viewblocker);
				with view_blocker4  sprite_index = spr_door_viewblocker4;
			}	
	} else {
			if !instance_exists(view_blocker) {
				view_blocker = instance_create_layer(x,y-sprite_height,"terrain",obj_door_viewblocker);
			}
			/*if !instance_exists(view_blocker2) {
				view_blocker2 = instance_create_layer(x,y,"terrain",obj_door_viewblocker);
				with view_blocker2  sprite_index = spr_door_viewblocker2;
			}
			if !instance_exists(view_blocker3) {
				view_blocker3 = instance_create_layer(x,y,"terrain",obj_door_viewblocker);
				with view_blocker3  sprite_index = spr_door_viewblocker3;
			}
	}
}
/*if instance_exists(view_blocker2) and image_index = 0 {
	instance_destroy(view_blocker2);
	instance_destroy(view_blocker3);
}
