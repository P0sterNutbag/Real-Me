if hp <= 0 {
	//state = "dead";
	with instance_create_layer(x,y,"enemies",obj_dead_enemy) {
		hsp = lengthdir_x(2,other.hurt_dir);
		vsp = lengthdir_y(2,other.hurt_dir);
		sprite_index = other.dead_sprite;
	}
	instance_destroy();
}

// HURT STATE //
if state = "hurt" {
	// stop moving
	path_end();
	
	// slow knockback
	hsp = lerp(hsp,0,0.5);
	vsp = lerp(vsp,0,0.5);
	scr_collision(hsp,vsp,par_solid);
	
	// return state
	hurt_timer--;
	if hurt_timer <= 0  state = "chase";
	// animate
	//image_index = 0;
}

// CUTSCENE // 
if state = "cutscene" {
	image_speed = 0;
	path_end();
}


// stop at enemy walls
if place_meeting(x,y,obj_enemy_wall) {
	if xorg < x  image_xscale = 1;
	else  image_xscale = -1;
	state = "return";
}