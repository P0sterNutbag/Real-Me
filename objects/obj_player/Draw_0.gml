/* draw aim cone
if state = "aim" {
	//draw_triangle(x,y,x+lengthdir_x(100,rot-aim_error/2),y+lengthdir_y(100,rot-aim_error/2),x+lengthdir_x(100,rot+aim_error/2),y+lengthdir_y(100,rot+aim_error/2),false)
	//draw_circle(mouse_x,mouse_y,aim_error/(-point_distance(mouse_x,mouse_y,x,y)*0.1),true);
	draw_set_color(c_black);
	draw_set_alpha(0.15);
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(x+lengthdir_x(8,rot),y+lengthdir_y(8,rot));
	draw_vertex(x+lengthdir_x(8,rot)+lengthdir_x(0.75,rot-90),y+lengthdir_y(8,rot)+lengthdir_y(0.75,rot-90));
	draw_vertex(x+lengthdir_x(100,rot+aim_error/2),y+lengthdir_y(100,rot+aim_error/2));
	draw_vertex(x+lengthdir_x(100,rot-aim_error/2),y+lengthdir_y(100,rot-aim_error/2));
	draw_primitive_end();
}*/

// draw self
//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,rot,c_white,image_alpha);
draw_self();
/*if state = "aim" {
	draw_sprite_ext(spr_player_shoot_arms,arm_index,x-arm_offset,y-6,1,image_xscale,rot,image_blend,image_alpha);
}*/
//draw_text(x+4,y,string(rot));
//draw_text(x+4,y+10,string(dir));
