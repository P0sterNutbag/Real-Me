var enemy = instance_place(x,y,par_enemy);
if enemy {
	scr_hurt(enemy,obj_player.dmg_melee,rot);
}

instance_destroy();
