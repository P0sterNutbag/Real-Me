width = 20;
height = 2;

x = obj_player.x-width/2;
y = obj_player.y+5;

xx = 0;
dir = 1;

point_amount = 0;
points[0] = 0;
alarm[1] = 1;
//display_set_gui_size(112,63);

// damage player
alarm[0] = 120;
canhurt = true;
