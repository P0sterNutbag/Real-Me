if instance_exists(dad) {
	image_xscale = dad.image_xscale
	x = dad.x;
	y = dad.y;
	if dad.state = "dead"  instance_destroy();
} else  instance_destroy();
