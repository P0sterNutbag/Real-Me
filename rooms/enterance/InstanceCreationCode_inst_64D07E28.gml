t_scene_info = [
	[cutscene_instance_create,292,83+16,"enemies",obj_mimic],
	[cutscene_move_character,obj_mimic,0,17,true,0.1,270,spr_mimic2_walk,spr_mimic2_idle],
	[cutscene_change_direction,obj_player,point_direction(x,y,292,83+16)],
	[cutscene_dialogue,["Oh, Jordan, its you.",obj_player,
	"Is everything okay?",obj_player]],
	[cutscene_move_character,obj_mimic,0,4,true,0.1,270,spr_mimic2_walk,spr_mimic2_idle],
	[cutscene_dialogue,["... Jordan?", obj_player]],
	[cutscene_wait,1],
	[cutscene_change_sprite,obj_mimic,spr_mimic1_idle,0],
	[cutscene_wait,0.5],
]