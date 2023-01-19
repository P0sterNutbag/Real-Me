if place_meeting(x,y,obj_player) and !instance_exists(obj_transition) {
	with instance_create_layer(0,0,"control",obj_transition) {
		next_room = other.next_room;
	}
	with obj_transition  place = other.place;
}


depth = -999;
/*var inst = instance_place(x,y,obj_player)
if inst {
	depth = inst.depth-20;
} else  depth = 0;
