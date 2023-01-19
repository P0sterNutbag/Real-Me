event_inherited();

hp = 10;
spd = 0.175;
dmg = 1;
point_amount = 1;
wander_dis = 12;

idle_sprite = spr_enemy_idle;
chase_sprite = spr_enemy_chase
attack_sprite = spr_enemy_attack;
stun_sprite = spr_enemy_idle;
dead_sprite = spr_enemy_dead;

hurtbox_obj = obj_enemy_hurtbox;

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
dir = 0;