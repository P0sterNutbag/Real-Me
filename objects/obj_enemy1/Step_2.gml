// set rot
var d = point_direction(xprevious,yprevious,x,y);
rot = d;

// change sprite direction
if state != "hurt" and state != "wait" {
	if d > 90 and d < 270  image_xscale = -1;
	else  image_xscale = 1;
}