/* set darkness lvl
if instance_exists(obj_player) {
	with obj_player {
		if place_meeting(x,y,obj_light_area)  exit;
		if place_meeting(x,y,obj_darkness) {
			var alpha = 0.95;
			var circ_alpha = 0.25
		} else {
			alpha = 0.8
			circ_alpha = 0.5
		}
	}
}*/
if light_lvl = 0  {
	var alpha = 0.95;
	var circ_alpha = 0.25
} else if light_lvl = 1 {
	alpha = 0.8
	circ_alpha = 0.5
} else if light_lvl = 2 {
	exit;
}

if !surface_exists(surf) {
    var _cw = camera_get_view_width(view_camera[0]);
    var _ch = camera_get_view_height(view_camera[0]);
    surf = surface_create(_cw*10, _ch*10);
    surface_set_target(surf);
    draw_set_colour(c_black);
    draw_set_alpha(0);
    draw_rectangle(0, 0, _cw, _cw, false);
    surface_reset_target();
} else {
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	var _cx = camera_get_view_x(view_camera[0]);
	var _cy = camera_get_view_y(view_camera[0]);
	surface_set_target(surf);
	draw_set_color(c_black);
	draw_set_alpha(alpha);
	draw_rectangle(0, 0, _cw, _ch, 0);
	gpu_set_blendmode(bm_subtract);
	with (obj_light)
	    {
			draw_set_alpha(circ_alpha);
			draw_circle(x-_cx-1,y-_cy-1-(obj_player.sprite_height/2),radius,false);
	    }
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	surface_reset_target();
	draw_surface(surf, _cx, _cy);
}

/* draw darkness
if !surface_exists(surf) {
    var _cw = camera_get_view_width(view_camera[0]);
    var _ch = camera_get_view_height(view_camera[0]);
    surf = surface_create(_cw*10, _ch*10);
    surface_set_target(surf);
    draw_set_colour(c_black);
    draw_set_alpha(0);
    draw_rectangle(0, 0, _cw, _cw, false);
    surface_reset_target();
} else {
	if (surface_exists(surf)) {
		var _cw = camera_get_view_width(view_camera[0]);
		var _ch = camera_get_view_height(view_camera[0]);
		var _cx = camera_get_view_x(view_camera[0]);
		var _cy = camera_get_view_y(view_camera[0]);
		surface_set_target(surf);
		draw_set_color(c_black);
		draw_set_alpha(alpha);
		draw_rectangle(0, 0, _cw, _ch, 0);
		gpu_set_blendmode(bm_subtract);
		with (par_light) {
			draw_set_alpha(circ_alpha);
			draw_circle(x-_cx-1,y-_cy-1-(obj_player.sprite_height/2),radius,false);
		}
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
		surface_reset_target();
		draw_surface(surf, _cx, _cy);
	}
}
