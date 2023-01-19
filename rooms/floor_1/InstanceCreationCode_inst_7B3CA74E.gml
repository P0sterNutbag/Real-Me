t_scene_info = [
	[cutscene_dialogue,["You found a pistol.","noone",
	"Right click to aim. Left click to fire. press 'R' to load ammo.", "noone"]],
	[cutscene_change_value,obj_player,"has_gun",true],
	[cutscene_change_value,obj_player,"ammo",12],
	[cutscene_instance_destroy,obj_enemy_wall],
]
