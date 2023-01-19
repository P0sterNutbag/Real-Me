event_inherited();

if audio_is_playing(snd_chase_music)
	audio_sound_gain(snd_chase_music,0,1000);
if audio_is_playing(snd_bgrnd)
	audio_sound_gain(snd_bgrnd,0,1000);