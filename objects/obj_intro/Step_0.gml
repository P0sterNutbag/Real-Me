switch(phase) {
	// fade in background
	case 0:
		text_phase = 0;
		if image_alpha < 1 {
			image_alpha += alpha_change;
			transition_time = 60;
		} else {
			alpha_change = 0.01;
			transition_time--;
			if transition_time <= 0 {
				instance_destroy(obj_phone);
				phase++;
			}
		}
		// sound
		if !audio_is_playing(snd_lobby_music) {
			audio_play_sound(snd_lobby_music,1,true);
			audio_sound_gain(snd_lobby_music,0.75,3000);
		}
	break;
	// fade in text
	case 1:
		text_phase = 1;
		if text_alpha < 1 {
			text_alpha += alpha_change;
			transition_time = 120;
		} else {
			transition_time--;
			if transition_time <= 0  phase++;
		}
		if !audio_is_playing(snd_bgrnd) {
			audio_play_sound(snd_bgrnd,1,true);
			audio_sound_gain(snd_bgrnd,0,0);
			audio_sound_gain(snd_bgrnd,1,6000);
		}
	break;
	// fade out text
	case 2:
		if text_alpha > 0 {
			text_alpha -= alpha_change;
			transition_time = 60;
		} else {
			transition_time--;
			if transition_time <= 0  phase++;
		}
	break;
	// fade in text
	case 3:
		text_phase = 2;
		if text_alpha < 1 {
			text_alpha += alpha_change;
			transition_time = 120;
		} else {
			transition_time--;
			if transition_time <= 0  phase++;
		}
	break;
	// fade out text
	case 4:
		if text_alpha > 0 {
			text_alpha -= alpha_change;
			transition_time = 60;
		} else {
			//transition_time--;
			//if transition_time <= 0 {
				//instance_destroy();
				if !instance_exists(obj_transition)
					with instance_create_layer(0,0,"control",obj_transition) {
						//image_alpha = 1;
						next_room = enterance;
					}
			//}
			audio_sound_gain(snd_bgrnd,0,1000);
		}
	break;
}

// skip intro
if keyboard_check_pressed(vk_anykey) or mouse_check_button_pressed(mb_left) {
	if !canskip {
		canskip = true
		alarm[0] = 60;
	} else if mouse_check_button_pressed(mb_left) {
		phase = -1;
		//if audio_is_playing(snd_intro) 
		//	audio_stop_sound(snd_intro);
		if !instance_exists(obj_transition)
			with instance_create_layer(0,0,"control",obj_transition) {
				//image_alpha = 1;
				next_room = enterance;
			}
		if !audio_is_playing(snd_lobby_music) {
			audio_play_sound(snd_lobby_music,1,false);
			audio_sound_gain(snd_lobby_music,0,0);
			audio_sound_gain(snd_lobby_music,0.15,1000);
		}
	}
}
