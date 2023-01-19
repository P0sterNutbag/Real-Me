if keyboard_check_pressed(vk_escape) {
	instance_destroy();
}

// touch options
var len = array_length(setting)
for(var i=0; i<len; i++) {
	var sw = string_width(setting[i]);
	var sh = string_height(setting[i]);
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	var hover = mx > xoffset-1 and mx < xoffset+sw and my > yoffset+4+i*ygap and my < yoffset+i*ygap+sh-2;
	if hover {
		setting_color[i] = make_color_rgb(245,79,79)//choose(make_color_rgb(245,79,79),c_black);
		// click
		if mouse_check_button_pressed(mb_left) {
			if i = 0 {
				instance_destroy();	
			} else if i = 1 {
				if window_get_fullscreen() {
					window_set_fullscreen(false);
					window_set_size(1280,720);
					setting[1] = "Fullscreen";
				} else {
					window_set_fullscreen(true);
					setting[1] = "Windowed";
				}
			} else if i = 2 {
				if global.noise_filter = true {
					global.noise_filter = false;
					setting[2] = "VHS Filter On";
				} else {
					global.noise_filter = true;
					setting[2] = "VHS Filter Off";
				}
			} else if i = 3 {
				game_restart();
			} else if i = 4 {
				game_end();
			}
		}
	} else  setting_color[i] = c_white;
}
