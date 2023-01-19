event_inherited();

depth = -y;


// close when opened in cutscene
if sprite_index = spr_elevator {
	if image_index >= image_number-1 {
		close_timer--;
		if close_timer <= 0  image_speed = -1;
	}
	if image_speed = -1 and image_index <= 0 {
		image_speed = 0;
		image_index = 0;
		sprite_index = spr_elevator_fake;
	}
}
