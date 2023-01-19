event_inherited();

image_speed = 0;

state = "";
next_room = noone;

on = false;
close_timer = -1;
can_interact = true;

instance_create_layer(x,y,"terrain",obj_elevator_floor);

if room != enterance {
	t_scene_info = [
		[cutscene_dialogue,["The elevator won't open.","noone"]]
	]
} else {
	t_scene_info = [
		[cutscene_dialogue,["I should stay on this floor for now.","player"]]
	]
}
