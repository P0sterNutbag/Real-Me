// CAMERA //
var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);

var _viewX = camera_get_view_x(view_camera[0]);
var _viewY = camera_get_view_y(view_camera[0]);
var _viewW = camera_get_view_width(view_camera[0]);
var _viewH = camera_get_view_height(view_camera[0]);

if cam_target != noone {
	var _gotoX = cam_target.x-(width/2)+hud_offset//cam_target.x + (_hor * 200) - (_viewW * 0.5);
	var _gotoY = cam_target.y-(height/2);// cam_target.y + (_ver * 150) - (_viewH * 0.5);
	if cam_target = obj_player  _gotoY -= cam_target.sprite_height/2
	// shooting zoom
	if mouse_check_button(mb_right) and cam_target = obj_player and !instance_exists(obj_cutscene) {
		zoom_lvl = zoom_max;
		//if zoom_lvl >= zoom_max  zoom_lvl = zoom_max;
		var dir = point_direction(obj_player.x,obj_player.y-obj_player.sprite_height/2,mouse_x,mouse_y);
		xoffset = lerp(xoffset,lengthdir_x(zoom_lvl, dir),0.1);
		yoffset = lerp(yoffset,lengthdir_y(zoom_lvl, dir),0.1);
	} else {
		xoffset = lerp(xoffset,0,0.1);
		yoffset = lerp(yoffset,0,0.1);
	}
} else {
	_gotoX = xtarg-(width/2)+hud_offset;
	_gotoY = ytarg-(height/2);
	xoffset = 0;
	yoffset = 0;
}

var _newX = lerp(_viewX, _gotoX+xoffset, 0.1);
var _newY = lerp(_viewY, _gotoY+yoffset, 0.1);

camera_set_view_pos(view_camera[0], _newX, _newY);
