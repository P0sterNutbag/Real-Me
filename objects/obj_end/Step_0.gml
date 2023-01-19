// fade in
if phase = 0 {
	if image_alpha < 1  image_alpha += alpha_change;
	else if alarm[0] = -1 {
		alarm[0] = 60;
		room_goto(ending);
		instance_destroy(obj_player);
	}
} else if phase = 1 {
	if text_alpha < 1 
		text_alpha += alpha_change;
	else if alarm[0] = -1 
		alarm[0] = 60;
} else if phase = 2 {
	if option_alpha < 1 
		option_alpha += alpha_change;
}


// options
var w = display_get_gui_width();
var h = display_get_gui_height();
var len = array_length(option)
for(var i=0; i<len; i++) {
	var sw = string_width(option[i]);
	var sh = string_height(option[i]);
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	var hover = mx > w/2-sw/2 and mx < w/2+sw/2 and my > h/2+20+(15*i) and my < h/2+20+(15*i)+sh
	if hover {
		color[i] = make_color_rgb(245,79,79);
		// click
		if mouse_check_button_pressed(mb_left) {
			if i = 0 {
				game_end();
			}
		}
	} else  color[i] = c_white;
}