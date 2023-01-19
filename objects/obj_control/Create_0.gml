width = room_width div CELL_WIDTH;
height = room_height div CELL_WIDTH;

// create pathfinding grid
grid_path = mp_grid_create(0,0,width,height,CELL_WIDTH,CELL_WIDTH);
for (var yy=0; yy<height; yy++) {
	for (var xx=0; xx<width; xx++) {
		if position_meeting(xx*CELL_WIDTH,yy*CELL_WIDTH,par_solid) {
		//or position_meeting(xx*CELL_WIDTH+CELL_WIDTH,yy*CELL_WIDTH,par_solid) 
		//or position_meeting(xx*CELL_WIDTH-CELL_WIDTH,yy*CELL_WIDTH,par_solid) 
		//or position_meeting(xx*CELL_WIDTH,yy*CELL_WIDTH+CELL_WIDTH+1,par_solid) 
		//or position_meeting(xx*CELL_WIDTH,yy*CELL_WIDTH-CELL_WIDTH,par_solid) {
			mp_grid_add_cell(grid_path,xx,yy);
		}
	}
}

// set gamestate 
global.gamestate = "play";

// settings
global.mute = false;

/* place player
if instance_exists(obj_transition)  place = obj_transition.place;
alarm[0] = 1;*/

if !instance_exists(obj_progress)  instance_create_layer(x,y,"control",obj_progress);

// set layer depth
layer_depth("walls",-988);