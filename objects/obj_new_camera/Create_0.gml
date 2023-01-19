cam_target = obj_player;

hud_offset = 10;

// Initialise Viewports
view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 112*1.25//*2;
view_hport[0] = 63*1.25//*2;

view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, noone, -1, -1, -1, -1);

width = camera_get_view_width(view_camera[0]);
height = camera_get_view_height(view_camera[0]);

camera_set_view_pos(view_camera[0],obj_player.x-width-2,obj_player.y-height-2);

// shoot zoom
zoom_lvl = 5;
zoom_max = 30;
xoffset = 0;
yoffset = 0;
