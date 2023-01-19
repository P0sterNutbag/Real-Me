var w = display_get_gui_width();
var h = display_get_gui_height();

if phase >= 0 {
	// draw background
	draw_set_alpha(image_alpha);
	draw_sprite(spr_background,0,0,0);

	// draw text
	if text_phase = 1  draw_set_font(fnt_big);
	else  draw_set_font(fnt_title);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	//draw_set_color(choose(c_gray,c_black));
	draw_set_color(c_white);
	draw_set_alpha(text_alpha);
	draw_text(w/2,h/2,text[text_phase]);
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

// skip
if canskip {
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	draw_set_font(fnt_normal);
	draw_text(w-7,h-10,"Left click to skip");
}