text[0] = ""
text[1] = "GhostMeat Presents";
text[2] = "The Real Me";

phase = -1;
text_phase = 0;
image_alpha = 0;
text_alpha = 0;
alpha_change = 0.00375;
transition_time = 60;
canskip = false;

width = 112*2;
height = 63*2;
display_set_gui_size(width,height);

// play intro track
 //audio_group_set_gain(ag_music,1,3000);
audio_play_sound(snd_clock,1,true);
//audio_sound_gain(snd_intro,0,0);
