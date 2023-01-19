// qte
draw_set_color(c_white);
draw_rectangle(x,y,x+width,y+height,false);

// draw points
draw_set_color(c_black);
for (var i=0; i<array_length(points); i++) {
	draw_rectangle(x+points[i],y,x+points[i]+0.2,y+height,false);
}

// draw slider
draw_set_color(c_red);
draw_rectangle(x+xx,y,x+xx+1,y+height,false);
