function scr_collision(xmove, ymove, sol) {
	// define boundaries
	var sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
	var sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
	var sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
	var sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
	
	// horizontal collisions
	x = lerp(x, x + xmove, 1);
	if place_meeting(x+sign(xmove),y,sol) {
	    var wall = instance_place(x+sign(xmove),y,sol);
	    if xmove > 0 { //right
	        x = (wall.bbox_left-1)-sprite_bbox_right;
	    } else if xmove < 0 { //left
	        x = (wall.bbox_right+1)-sprite_bbox_left;
	    }
	    xmove = 0;
	}

	// vertical collisions
	y += ymove;
	if place_meeting(x, y+sign(ymove), sol) {
		var wall = instance_place(x, y+sign(ymove), sol);
	    if (ymove > 0) { //down
	        y = (wall.bbox_top-1) - sprite_bbox_bottom;
	    } else if (ymove < 0) { //up
	        y = (wall.bbox_bottom+1) - sprite_bbox_top;
	    }
		ymove = 0;
	}
}
function scr_hurt(obj,d,dir) {
	with obj {
		if obj == obj_player {
			if state != "hurt" {
				if !invincible {
					state = "hurt"
					hp -= d;
					//ID.alarm[0] = 60;
					with instance_create_depth(x,y,-1000,obj_qte) {
						dmg = d;
						sprite_index = choose(spr_qte_a,spr_qte_d,spr_qte_s,spr_qte_w);
						switch(sprite_index) {
							case spr_qte_a:  key = ord("A"); break;
							case spr_qte_d:  key = ord("D"); break;
							case spr_qte_s:  key = ord("S"); break;
							case spr_qte_w:  key = ord("W"); break;
						}
					}
				}
			} else {
				var spr = obj_qte.sprite_index
				instance_destroy(obj_qte);
				with instance_create_depth(x,y,-1000,obj_qte) {
					dmg = d;
					sprite_index = spr;
					while sprite_index = spr  sprite_index = choose(spr_qte_a,spr_qte_d,spr_qte_s,spr_qte_w);
					switch(sprite_index) {
						case spr_qte_a:  key = ord("A"); break;
						case spr_qte_d:  key = ord("D"); break;
						case spr_qte_s:  key = ord("S"); break;
						case spr_qte_w:  key = ord("W"); break;
					}
				}
				// sound
			}
		} else { // hurt enemy
			hp -= d;
			state = "hurt"
			hurt_timer = 10;
			hsp = lengthdir_x(1,dir);
			vsp = lengthdir_y(1,dir);
			// sound
			audio_play_sound(snd_enemy_hurt,1,false);
		}
	}
}
function scr_textbox_set_portait() {
	portrait = text[text_index+1];
	switch portrait {
		case noone: image_index = 0; break;
		case "player":  image_index = 1; break;
		case "mimic":  image_index = 2; break;
		case "jordan":  image_index = 3; break;
		case "doorman": image_index = 4; break;
	}
}
function scr_get_path_to_point(x_point,y_point,spd) {
	var xx = (x_point div CELL_WIDTH)*CELL_WIDTH+CELL_WIDTH/2;
	var yy = (y_point div CELL_WIDTH)*CELL_WIDTH+CELL_WIDTH/2;
	
	if mp_grid_path(obj_control.grid_path,path,x,y,xx,yy,true) {
		path_start(path,spd,path_action_stop,false);
	}
}
function scr_nearest_path_point(path, xx, yy) {
	/*\
	| | Return the point on the given path, closest to the given coordinates (x, y).
	| | The result is an array of length 2 of which the first element corresponds with the x coordinate
	| | and the second element corresponds with the y coordinate.
	| |
	|-| This script assumes that the given path is not smooth, but exists of a finite amount of line segments only.
	\*/

	// rx = result x, what is the x coordinate of the current result
	// ry = result y, what is the y coordinate of the current result
	// d = distance, from (x, y) to the current result
	// n = number, of points in the given path
	var rx = path_get_point_x(path, 0);
	var ry = path_get_point_y(path, 0);
	var d = point_distance(rx, ry, xx, yy);
	var n = path_get_number(path);

	// x1 is the x coordinate of the previous path point
	// y1 is the y coordinate of the previous path point
	// x2 is the x coordinate of the current path point
	// y2 is the y coordinate of the current path point
	// td = temporary distance, is a variable that has multiple meanings
	// p is the result of a dot product
	// tx is the x coordinate of the point on the open line segment from (x1, y1) to (x2, x2)
	//     if such a closest point exists and it is x2 otherwise
	// ty is the y coordinate of the point on the open line segment from (x1, y1) to (x2, x2)]
	//     if such a closest point exists and it is y2 otherwise
	var x1, x1, x2 = rx, y2 = ry, td, p, tx, ty;
	// Cycle through all the path points in order and find the closest point
	for(var i = 1; i < n; i++) {
	    x1 = x2;
	    y1 = y2;
	    x2 = path_get_point_x(path, i);
	    y2 = path_get_point_y(path, i);
	    // td holds the distance between (x1, y1) and (x2, y2) here
	    td = point_distance(x1, y1, x2, y2);
	    // Calculating the dot product of the vector from (x1, y1) to (x2, y2) and from (x1, y1) to (x, y)
	    // and divide it by the size of the former vector
	    // (x1, y1) + p * ((x, y) - (x1, y1)) is the projection of (x, y) onto the line through (x1, y1) and (x2, y2)
	    // If this point lies on the half open line segment, then it is the closest point on the half open line segment to (x, y)
	    p = ((x2 - x1) * (xx - x1) + (y2 - y1) * (yy - y1)) / td;
	    // If the point lies on the open line segment
	    if p > 0 && p < td {
	        // Calculate the exact coordinates of this point
	        tx = x1 + (x2 - x1) * p;
	        ty = y1 + (y2 - y1) * p;
	    } else {
	        // Else, let tx and ty be x2 and y2
	        tx = x2;
	        ty = y2;
	    }
	    // td holds the distance between (x, y) and (tx, ty) here
	    td = point_distance(tx, ty, xx, yy);
	    // If the distance from (x, y) to (tx, ty) is better than the current result (rx, ry),
	    // then update the results
	    if td < d {
	        d = td;
	        rx = tx;
	        ry = ty;
	    }
	}

	// Return the results as array
	var t;
	t[1] = ry;
	t[0] = rx;

	return t;
}
function scr_get_path_position(p_path, px, py, prec) {
	var i, xx, yy, solution;

	pri = ds_priority_create();

	for(i=0; i<=1; i+=prec/path_get_length(p_path))
	{
		xx = path_get_x(p_path, i);
		yy = path_get_y(p_path, i);
		ds_priority_add(pri, i, point_distance(xx, yy, px, py));
	}

	solution = ds_priority_find_min(pri);
	ds_priority_destroy(pri);
	return solution;
}
function scr_change_room(rm) {
	with instance_create_layer(0,0,"control",obj_transition) {
		next_room = rm;
	}
}