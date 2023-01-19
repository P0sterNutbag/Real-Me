hsp = lengthdir_x(spd,dir);
vsp = lengthdir_y(spd,dir);

if spd <= 0 {
	spd = 0
} else  spd -= fric;

scr_collision(hsp,vsp,par_solid);


// grab by player
if place_meeting(x,y,obj_player) {
	with inst_55D3B500 {
		has_key = true;
		//alarm[0] = 1;
	}
	audio_play_sound(snd_pickup,0.5,false);
	instance_destroy();
}