if obj_progress.play_lobby_cutscene_1 {
	obj_progress.play_lobby_cutscene_1 = false;
	t_scene_info = [
		[cutscene_wait,0.5],
		[cutscene_play_animation,inst_54CCBD6E,spr_elevator],
		[cutscene_move_character,obj_player,0,14,true,0.40,spr_player_run,spr_player_idle],
		[cutscene_move_character,obj_player,212,204,false,0.4,spr_player_run,spr_player_idle],
		[cutscene_move_character,obj_player,0,-8,true,0.40,spr_player_run,spr_player_idle],
		[cutscene_wait,0.5],
		[cutscene_change_camera_position,252,200],
		[cutscene_wait,1],
		[cutscene_instance_create,252,190,"enemies",obj_mimic],
		[cutscene_play_animation,inst_452E13EA,spr_elevator],
		[cutscene_move_character,obj_mimic,0,14,true,0.20,spr_mimic1_walk,spr_mimic1_idle],
		[cutscene_move_character,obj_mimic,212,204,false,0.20,spr_mimic1_walk,spr_mimic1_idle],
		[cutscene_wait,1],
		[cutscene_change_xscale,obj_mimic],
		[cutscene_wait,0.5],
		[cutscene_change_xscale,obj_mimic],
		[cutscene_wait,0.5],
		[cutscene_move_character,obj_mimic,100,0,true,0.40,spr_mimic1_run,spr_mimic1_idle],
		[cutscene_wait,1],
		[cutscene_change_camera_target,obj_player],
		[cutscene_wait,1],
		[cutscene_dialogue,["I think I lost him...","player",
		"I gotta get out of here.","player"]],
		[cutscene_instance_destroy,obj_elevator_animate],
	]
} else  instance_destroy();
