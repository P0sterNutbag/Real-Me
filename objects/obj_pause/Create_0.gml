setting[0] = "Resume"
setting_color[0] = c_white;
if window_get_fullscreen()  setting[1] = "Windowed"
else  setting[1] = "Fullscreen"
setting_color[1] = c_white
setting[2] = "VHS Filter Off"
setting_color[2] = c_white;
setting[3] = "Restart"
setting_color[3] = c_white;
setting[4] = "Quit"
setting_color[4] = c_white;

xoffset = 10;
yoffset = 10;
ygap = 10;
button_width = 50;

// pause all objects
instance_deactivate_all(true);
/*var len = array_length(setting)
for(var i=0; i<len; i++) {
	
}