/* shadows
draw_set_alpha(1);
var xx = obj_player.x;
var yy = obj_player.y-8;
with(par_block_view_solid) {
	if !place_meeting(x,y,obj_player) {
		draw_set_color(c_black);
		draw_primitive_begin(pr_trianglestrip);
			draw_vertex(bbox_left, bbox_top); 
			var d = point_direction(xx,yy,bbox_left,bbox_top) 
			draw_vertex(x+lengthdir_x(other.shadowsize,d), y+lengthdir_y(other.shadowsize,d)); 
			
			draw_vertex(bbox_left, bbox_bottom+1); 
			var d = point_direction(xx,yy,bbox_left,bbox_bottom+1) 
			draw_vertex(x+lengthdir_x(other.shadowsize,d), y+lengthdir_y(other.shadowsize,d)); 

			//draw_vertex(bbox_right+1, bbox_top); 
			//var d = point_direction(xx,yy,bbox_right+1,bbox_top+1) 
	   		//draw_vertex(x+lengthdir_x(other.shadowsize, d), y+lengthdir_y(other.shadowsize,d)); 
			
			draw_vertex(bbox_right+1, bbox_bottom+1); 
			var d = point_direction(xx,yy,bbox_right+1,bbox_bottom+1) 
			draw_vertex(x+lengthdir_x(other.shadowsize,d), y+lengthdir_y(other.shadowsize,d));
		draw_primitive_end();
			
		draw_primitive_begin(pr_trianglestrip);
			draw_vertex(bbox_right+1, bbox_bottom+1); 
			var d = point_direction(xx,yy,bbox_right+1,bbox_bottom+1) 
			draw_vertex(x+lengthdir_x(other.shadowsize,d), y+lengthdir_y(other.shadowsize,d));
			
			draw_vertex(bbox_right+1, bbox_top); 
			var d = point_direction(xx,yy,bbox_right+1,bbox_top+1) 
		   	draw_vertex(x+lengthdir_x(other.shadowsize, d), y+lengthdir_y(other.shadowsize,d)); 
			
			draw_vertex(bbox_left, bbox_top); 
			var d = point_direction(xx,yy,bbox_left,bbox_top) 
			draw_vertex(x+lengthdir_x(other.shadowsize,d), y+lengthdir_y(other.shadowsize,d)); 
		draw_primitive_end();
	}
}

with(par_block_view) {
	if object_is_ancestor(object_index,obj_door) and state = "open"  exit;
	if !place_meeting(x,y,obj_player) {
		draw_set_color(c_black);
		draw_primitive_begin(pr_trianglestrip);
			draw_vertex(bbox_left, bbox_top); 
			var d = point_direction(xx,yy,bbox_left,bbox_top) 
			draw_vertex(x+lengthdir_x(other.shadowsize,d), y+lengthdir_y(other.shadowsize,d)); 
			
			draw_vertex(bbox_left, bbox_bottom+1); 
			var d = point_direction(xx,yy,bbox_left,bbox_bottom+1) 
			draw_vertex(x+lengthdir_x(other.shadowsize,d), y+lengthdir_y(other.shadowsize,d)); 

			//draw_vertex(bbox_right+1, bbox_top); 
			//var d = point_direction(xx,yy,bbox_right+1,bbox_top+1) 
	   		//draw_vertex(x+lengthdir_x(other.shadowsize, d), y+lengthdir_y(other.shadowsize,d)); 
			
			draw_vertex(bbox_right+1, bbox_bottom+1); 
			var d = point_direction(xx,yy,bbox_right+1,bbox_bottom+1) 
			draw_vertex(x+lengthdir_x(other.shadowsize,d), y+lengthdir_y(other.shadowsize,d));
		draw_primitive_end();
		draw_primitive_begin(pr_trianglestrip);
			draw_vertex(bbox_right+1, bbox_bottom+1); 
			var d = point_direction(xx,yy,bbox_right+1,bbox_bottom+1) 
			draw_vertex(x+lengthdir_x(other.shadowsize,d), y+lengthdir_y(other.shadowsize,d));
			
			draw_vertex(bbox_right+1, bbox_top); 
			var d = point_direction(xx,yy,bbox_right+1,bbox_top+1) 
		   	draw_vertex(x+lengthdir_x(other.shadowsize, d), y+lengthdir_y(other.shadowsize,d)); 
			
			draw_vertex(bbox_left, bbox_top); 
			var d = point_direction(xx,yy,bbox_left,bbox_top) 
			draw_vertex(x+lengthdir_x(other.shadowsize,d), y+lengthdir_y(other.shadowsize,d)); 
		draw_primitive_end();
	}
	//draw_self();
}
