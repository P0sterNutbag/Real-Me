// move
if hsp+vsp != 0 {
	hsp = lerp(hsp,0,0.3);
	vsp = lerp(vsp,0,0.3);
	scr_collision(hsp,vsp,par_solid);
}

// animate
if image_index >= image_number-1 {
	image_speed = 0;
	image_index = image_number-1;
}

dir = point_direction(xprevious,yprevious,x,y);
if dir > 90 and dir < 270  image_xscale = 1;
else  image_xscale = -1;
