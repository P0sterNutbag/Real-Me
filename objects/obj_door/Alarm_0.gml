if locked and my_lock = noone {
	my_lock = instance_create_layer(x,y,"terrain",lock_obj);
	t_scene_info = [
		[cutscene_dialogue,["the door is locked.","noone"]],
	]
}
