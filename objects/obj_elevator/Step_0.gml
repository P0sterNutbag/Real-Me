depth = -y;

key_interact = keyboard_check_pressed(ord("E"));

if !instance_exists(obj_cutscene) {
	if on { // player can use the elevator
		if state = "" {
			can_interact = true;
			if distance_to_object(obj_player) <= interact_dis {
				if key_interact {
					state = "open"
					image_speed = 1;
				}
			}
			sprite_index = spr_elevator;
		}
		if state = "open" {
			can_interact = false;
			sprite_index = spr_elevator;
			if image_index >= image_number-1 {
				image_speed = 0;
				image_index = image_number-1;
				if collision_rectangle(bbox_left,y-5,bbox_right,bbox_top,obj_player,false,false) {
					state = "close";
					close_timer = 30;
				}
			}
			if image_index >= 2  mask_index = spr_elevator_blocker2;
		}

		if state = "close" {
			depth = -y
			mask_index = spr_elevator_blocker;
			sprite_index = spr_elevator;
		
			close_timer--;
			if close_timer <= 0  image_speed = -1;

			if image_index < 1 {
				image_index = 0;
				image_speed = 0;
				if !instance_exists(obj_transition) {
					with instance_create_layer(0,0,"control",obj_transition) {
						next_room = other.next_room;
						place = other.place;
					}
				}
			}
		}
	} else { // elevator won't open
		if distance_to_object(obj_player) <= interact_dis {
			can_interact = true;
			if key_interact and !instance_exists(obj_cutscene) {
				can_interact = false;
				create_cutscene(t_scene_info);
			}
		}
		sprite_index = spr_elevator_fake;
	}
} else {
	if close_timer != -1 {
		if image_index = image_number-1 {
			close_timer--;
		}
		if close_timer <= 0 {
			image_speed = -1;
			if image_index < 1 {
				image_index = 0;
				image_speed = 0;
			} else {
				image_speed = -1;
			}
		}
	}
}
