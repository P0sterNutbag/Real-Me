// move
hsp = lengthdir_x(spd, rot);
vsp = lengthdir_y(spd, rot);
scr_collision(hsp, vsp, obj_control);

var in_wall = collision_line(xprevious,yprevious,x,y,obj_wall,false,false);
if place_meeting(x,y,obj_wall) or in_wall  instance_destroy();
var hurtbox = collision_line(xprevious,yprevious,x,y,par_enemy_hurtbox,false,false);
if hurtbox {
	var enemy = hurtbox.dad;
	if enemy.object_index != obj_mimic {
		scr_hurt(enemy,dmg,rot);
		enemy.hurt_dir = rot;
		if enemy.hp >= 0 {
			repeat(3) {
				with instance_create_layer(enemy.x,y,"particals",obj_blood) {
					spd = random_range(1,5);
					rot = other.rot+random_range(-50,50);
				}
			}
			repeat(2) {
				with instance_create_layer(enemy.x,y,"particals",obj_blood) {
					spd = random_range(3,6);
					rot = other.rot+random_range(-10,10);
				}
			}
		} else {
			repeat(5) {
				with instance_create_layer(enemy.x,y,"particals",obj_blood) {
					spd = random_range(1,5);
					rot = other.rot+random_range(-50,50);
				}
			}
			repeat(4) {
				with instance_create_layer(enemy.x,y,"particals",obj_blood) {
					spd = random_range(5,8);
					rot = other.rot+random_range(-10,10);
				}
			}
		}
	} else {
		scr_hurt(enemy,0,rot);
	}
	instance_destroy();
}
// destroy in doors
var door = collision_line(xprevious,yprevious,x,y,obj_door,false,false);
if door and door.image_index = 0  instance_destroy();

// destroy if too far
if distance_to_object(obj_player) > 300  
	instance_destroy();

/* check for hit
var dis = point_distance(x,y,xprevious,yprevious);
for (var i=0; i<dis; i++) {
	var headshot = instance_place(xprevious+lengthdir_x(i,rot),yprevious+lengthdir_y(i,rot),obj_enemy_hurtbox);
	if headshot {
		scr_hurt(headshot.dad,dmg,rot);
		instance_destroy();
	} else {
		var enemy = instance_place(xprevious+lengthdir_x(i,rot),yprevious+lengthdir_y(i,rot),par_enemy);
		if enemy {
			if enemy.state = "walk"	 scr_hurt(enemy,dmg,rot);
			else  scr_hurt(enemy,dmg*0.5,rot);
			instance_destroy();
		}
	}
}
