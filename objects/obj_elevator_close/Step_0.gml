depth = -y
mask_index = spr_elevator_blocker;

if image_index >= image_number-1 {
	image_index = image_number-1;
	if !instance_exists(obj_transition) {
		with instance_create_layer(0,0,"control",obj_transition) {
			next_room = other.next_room;
		}
		with obj_transition  place = 0;
	}
}
