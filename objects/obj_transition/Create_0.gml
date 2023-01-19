image_alpha = 0.001;

width = display_get_gui_width();
height = display_get_gui_height();

alpha_change = 1;

/* sound
if !audio_is_playing(snd_chase_music) {
	audio_play_sound(snd_static,1,false);
	audio_sound_gain(snd_static,1,1000);
}
