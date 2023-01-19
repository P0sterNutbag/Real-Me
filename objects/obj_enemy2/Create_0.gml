event_inherited();

hp = 10;
spd = 0.275;
dmg = 1;
point_amount = 2;

chase_sprite = spr_enemy2_chase;
idle_sprite = spr_enemy2_idle;
attack_sprite = spr_enemy2_attack;
stun_sprite = spr_enemy2_idle;
dead_sprite = spr_enemy2_dead;

hurtbox_obj = obj_enemy2_hurtbox;

// dont change
xorg = x;
yorg = y;
vsp = 0;
hsp = 0;
state = "wait"
rot = image_angle;
canhurt = false;
see_time = 40;
xtarg = x;
ytarg = y;

