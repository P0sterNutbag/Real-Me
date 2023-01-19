if locked and my_lock = noone {
	my_lock = instance_create_layer(x,y,"control",obj_lock);
	with my_lock {
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
		image_angle = other.image_angle;
	}
}
