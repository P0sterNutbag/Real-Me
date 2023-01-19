draw_self();

if instance_exists(obj_player) {
	if obj_player.state = "aim" and canshoot {
		var rot = obj_player.rot;
		var aim_error = obj_player.aim_error;
		var yoffset1 = 1.5*-obj_player.image_xscale;
		var yoffset2 = 3.5*-obj_player.image_xscale;
		var len = 10;
		draw_set_color(c_black);
		draw_set_alpha(0.15);
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(x+lengthdir_x(len,rot)+lengthdir_x(yoffset1,rot-90),y+lengthdir_y(len,rot)+lengthdir_y(yoffset1,rot-90));
		draw_vertex(x+lengthdir_x(len,rot)+lengthdir_x(yoffset2,rot-90),y+lengthdir_y(len,rot)+lengthdir_y(yoffset2,rot-90));
		if obj_player.image_xscale = -1  draw_vertex(x+lengthdir_x(200,rot+aim_error/2),y+lengthdir_y(200,rot+aim_error/2));
		draw_vertex(x+lengthdir_x(200,rot-aim_error/2),y+lengthdir_y(200,rot-aim_error/2));
		if obj_player.image_xscale = 1 draw_vertex(x+lengthdir_x(200,rot+aim_error/2),y+lengthdir_y(200,rot+aim_error/2));
		draw_primitive_end();
	}
}

draw_set_alpha(1);