depth = -y;

// animate
if !instance_exists(obj_cutscene) {
	image_speed = 1;
	// set sprite
	if x != xprevious or y != yprevious {
		sprite_index = spr_mimic2_run;
	} else {
		sprite_index = spr_mimic2_idle;
	}
	// set xscale
	if x > xprevious  image_xscale = 1;
	if x < xprevious  image_xscale = -1;
}
