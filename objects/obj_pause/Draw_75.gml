// draw background
draw_set_alpha(1);
var w = display_get_gui_width();
var h = display_get_gui_height();
draw_sprite(spr_background,0,0,0);

// draw options
var len = array_length(setting)
draw_set_color(c_gray);
draw_set_alpha(1);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for(var i=0; i<len; i++) {
	draw_set_color(setting_color[i]);
	draw_text(xoffset,yoffset+i*ygap,setting[i]);
}

// noise
if global.noise_filter {
	draw_set_alpha(0.1);
	var dark_gray = make_color_hsv(248,0,13);
	for (var i=0; i<h; i+=2) {
		draw_set_color(choose(dark_gray,c_black));
		draw_rectangle(0,i,w,i+2,false);
	}
}


//draw_text(10,h-10,instance_number(obj_pause));
