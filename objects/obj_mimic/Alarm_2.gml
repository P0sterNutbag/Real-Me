search_x = x+random_range(-16,16);
search_y = y+random_range(-16,16);
while position_meeting(search_x,search_y,par_solid) and collision_line(x,y,search_x,search_y,par_solid,false,false) {
	search_x = x+random_range(-16,16);
	search_y = y+random_range(-16,16);
}
dir = point_direction(x,y,search_x,search_y);
search_count--;
