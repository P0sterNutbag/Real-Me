// point towards mouse
if instance_exists(obj_player) {
	depth = obj_player.depth-1;
	x = obj_player.x-(2*obj_player.image_xscale);
	y = obj_player.y-5;
	if obj_player.state = "aim" {
		if canshoot {
			image_angle = obj_player.rot;
			image_yscale = obj_player.image_xscale;
			image_xscale = 1;
		}
		// animate if player shoots
		if canshoot = false  image_speed = 1;
		// shot animate
		if image_index >= image_number-1 {
			canshoot = true;
			image_index = 0;
			image_speed = 0;
		}
	} else if obj_player.state = "reload" {
		image_speed = 1;
		if image_index >= image_number-1 {
			if sprite_index = spr_player_reload_arms {
				sprite_index = spr_player_reload2_arms;
				image_index = 0;
				with obj_player {
					reload_amount = clip_max-ammo_in_clip;
					if reload_amount >= ammo  reload_amount = ammo;
					
					reload_amount-=1;
					ammo_in_clip+=1;
					ammo-=1;
				}
			} else if sprite_index = spr_player_reload2_arms {
				image_index = 0;
				with obj_player {
					if reload_amount <= 0 {
						if key_aim and has_gun  state = "aim"
						else  state = "walk";
					} else {
						reload_amount-=1;
						ammo_in_clip+=1;
						ammo-=1;
					}
				}
			}
		}
		// set xscale
		image_angle = 0;
		image_xscale = obj_player.image_xscale;
		image_yscale = 1;
		// sound
		if sprite_index = spr_player_reload_arms and image_index = 3 {
			if !audio_is_playing(snd_gun_shells)
				audio_play_sound(snd_gun_shells,0.9,false);
		} else if sprite_index = spr_player_reload2_arms and image_index = 1 {
			if !audio_is_playing(snd_gun_reload)
				audio_play_sound(snd_gun_reload,0.9,false);
		}
	}
	else  instance_destroy();
}

// sound
if sprite_index = spr_player_shoot_arms and image_index = 10
	if !audio_is_playing(snd_gun_cock)
		audio_play_sound(snd_gun_cock,0.9,false);