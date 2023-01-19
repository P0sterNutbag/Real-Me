event_inherited();

hp = 10;
dmg = 1;
run_spd = 0.325;
walk_spd = 0.2;
point_amount = 3;

hurtbox_obj = obj_enemy2_hurtbox;


// start patrolling
//path_start(Path1,walk_spd,path_action_restart,false);

if path_exists(path1)  mypath = path1;
if path_exists(path2)  mypath = path2;

hsp = 0; vsp = 0;
state = "patrol"
rot = 0
dir = 0;
canhurt = true;
last_state = state;
see_time = 40;
if room = floor_1  has_key = true;
else  has_key = false;

// sprites 
idle_sprite = spr_mimic1_idle;
attack_sprite = spr_mimic1_attack;
chase_sprite = spr_mimic1_run;
stun_sprite = spr_mimic1_idle; 

// audio
//audio_play_sound(snd_chase_music,1,true);
//audio_sound_gain(snd_chase_music,0,0);
audio_play_sound(snd_bgrnd,1,1000);
audio_sound_gain(snd_bgrnd,0,0);
audio_sound_gain(snd_bgrnd,0.4,1000);
