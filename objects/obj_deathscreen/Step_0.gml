// fade in
if image_alpha < 1 {
	image_alpha += alpha_change;
} else {
	if alarm[0] = -1  alarm[0] = 60
}

if option_alpha_change > 0 {
	if option_alpha < 1  option_alpha += 0.01;
}

// touch options
var w = display_get_gui_width();
var h = display_get_gui_height();
var len = array_length(option)
for(var i=0; i<len; i++) {
	var sw = string_width(option[i]);
	var sh = string_height(option[i]);
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	var hover = mx > w/2-sw/2 and mx < w/2+sw/2 and my > h/2+(15*i) and my < h/2+(15*i)+sh
	if hover {
		color[i] = make_color_rgb(245,79,79);
		// click
		if mouse_check_button_pressed(mb_left) {
			if i = 0 {
				instance_destroy(obj_player);
				if room = floor_1  instance_create_layer(obj_player_placer.x,obj_player_placer.y,"player",obj_player);
				room_restart();
			} else if i = 1 {
				game_end();
			}
		}
	} else  color[i] = c_white;
}