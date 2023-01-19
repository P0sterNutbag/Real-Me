///@description cutscene_end_action
///@arg return player
function create_cutscene(argument0) {
	var inst = instance_create_layer(0,0,"control",obj_cutscene);

	with(inst) {
		scene_info = argument0;
		event_perform(ev_other,ev_user0);
	}
	
	with obj_player {
		state = "cutscene"
	}
	//instance_deactivate_object(par_enemy);
	with par_enemy {
		last_state = state;
		state = "cutscene"
	}
}
function cutscene_end_action() {
	with obj_cutscene {
		scene++;
		if(scene > array_length_1d(scene_info)-1) {
			if instance_exists(obj_player) {
				with obj_player {
					state = "walk";
					image_speed = 1;
				}
			}
			with par_enemy {
				state = last_state;
				image_speed = 1;
			}
			if instance_exists(obj_mimic2)  obj_mimic2.image_speed = 0;
			with obj_new_camera  cam_target = obj_player;
			instance_destroy();
			exit;
		}
		event_perform(ev_other, ev_user0);
	}
}
function cutscene_change_camera_target(argument0) {
	///@arg  target
	with obj_new_camera  cam_target = argument0;
	cutscene_end_action();
}
function cutscene_change_camera_position(xx,yy) {
	with obj_new_camera {
		cam_target = noone;
		xtarg = xx;
		ytarg = yy;
	}
	cutscene_end_action();
}
function cutscene_stop_camera() {
	with objCamera {
		cam_target = noone;
		xtarg = x;
		ytarg = y;
	}
	cutscene_end_action();
}
function cutscene_change_room(rm, stop_audio) {
	///@arg room
	///@arg stop audio?
	scrTransition(rm,stop_audio);
	cutscene_end_action();
}
function cutscene_change_xscale() {
	var arg;
	var i = 0; 
	repeat(argument_count) {
		arg[i] = argument[i];
		i++;
	}

	if argument_count > 1 {
		with(argument0) {
			image_xscale = argument1;
		}
	} else {
		with(argument0) {
			image_xscale = -image_xscale;
		}
	}
	cutscene_end_action();
}
function cutscene_instance_create(argument0, argument1, argument2, argument3) {
	///@ x
	///@ y 
	///@ layer_id
	///@ obj
	//var inst = instance_create_layer(argument0,argument1,argument2,argument3);
	with instance_create_layer(argument0,argument1,argument2,argument3) {
		state = "cutscene";
	}
	cutscene_end_action();
	//return isnt;
}
function cutscene_instance_destroy(argument0) {
	///@ obj_id
	with(argument0) {
		instance_destroy();
	}
	cutscene_end_action();
}
function cutscene_move_character(obj, xto, yto, relative, spd, walkSpr, idleSpr) {
	///@ object
	///@ x
	///@ y
	///@ relative?
	///@ speed
	///@ rot
	///@ walk sprite
	///@ idle sprite
	if x_dest == -1 {
		if (!relative) {
			x_dest = xto;
			y_dest = yto;
		} else {
			x_dest =obj.x + xto;
			y_dest =obj.y + yto;
		}
	}

	var xx = x_dest;
	var yy = y_dest;

	with obj {
		image_speed = 1;
		sprite_index = walkSpr;
		if point_distance(x,y,xx,yy) >= spd {
			var dir = point_direction(x,y,xx,yy);
			var ldirx = lengthdir_x(spd,dir);
			var ldiry = lengthdir_y(spd,dir);
		
			if (ldirx != 0) { image_xscale = sign(ldirx); }
		
			x += ldirx;
			y += ldiry;
		} else {
			image_speed = 1;
			sprite_index = idleSpr;
			x = xx;
			y = yy;
			with other {
				x_dest = -1;
				y_dest = -1;
				cutscene_end_action();
			}
		}
	}
}
function cutscene_play_sound(argument0, argument1, argument2) {
	///@arg soundid
	///@arg priority
	///@arg loops
	audio_play_sound(argument0,argument1,argument2);

	cutscene_end_action();
}
function cutscene_stop_sound(argument0) {
	///@arg soundid
	audio_stop_sound(argument0);
	cutscene_end_action();
}
function cutscene_screenshake(argument0) {
	///@description cutscene_screenshake
	///@arg amount
	obj_camera.screenshake = argument0;
	cutscene_end_action();
}
function cutscene_wait(argument0) {
	///@description cutscene_wait
	///@arg seconds
	timer++;
	if (timer >= argument0*room_speed) {
		timer = 0;
		cutscene_end_action();
	}
}
function script_execute_alt(argument0, argument1) {
	///@description script_execute_alt
	///@arg ind
	///@arg [arg1,arg2,...]
	var s = argument0;
	var a = argument1;
	var len = array_length_1d(argument1);

	switch(len){
    case 0 : script_execute(s); break;
    case 1 : script_execute(s, a[0]); break;
    case 2:  script_execute(s, a[0], a[1]); break;
    case 3:  script_execute(s, a[0], a[1], a[2]); break;
    case 4:  script_execute(s, a[0], a[1], a[2], a[3]); break;
    case 5:  script_execute(s, a[0], a[1], a[2], a[3], a[4]); break;
    case 6:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5]); break;
    case 7:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6]); break;
    case 8:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]); break;
    case 9:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]); break;
    case 10: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]); break;
    case 11: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]); break;
    case 12: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]); break;
    case 13: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]); break;
    case 14: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]); break;
    case 15: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]); break;
	}


}
function cutscene_dialogue(text_array) {
	///@arg text
	///@arg camera target
	if !instance_exists(obj_textbox) {
		with instance_create_layer(0,0,"control",obj_textbox) {
			text = text_array;
			text_amount = array_length(text);
			portrait = text_array[1];
			scr_textbox_set_portait();
			//if text_array[1] != noone  obj_new_camera.cam_target = text_array[1];
		}
	}
}
function cutscene_dialogue_code(text_array,an,i) {
	///@arg text
	///@arg camera target
	///@arg answer
	///@arg id
	if !instance_exists(obj_textbox) {
		with instance_create_layer(0,0,"control",obj_textbox) {
			text = text_array;
			text_amount = array_length(text);
			answer = an;
			door = i;
			portrait = text_array[1];
			//if text_array[1] != noone  obj_new_camera.cam_target = text_array[1];
		}
	}
}
function cutscene_change_value(obj,v,i) {
	///@arg object
	///@arg variable
	///@arg value
	if obj == obj_player and v == "ammo"  obj_player.ammo+=i;//var ii = obj_player.ammo+i;
	else if obj == obj_player and v == "hpkit_count"  obj_player.hpkit_count+=i;//var ii = obj_player.hpkit_count+i;
	else {
		ii = i;
		variable_instance_set(obj,v,ii);
	}
	cutscene_end_action();
}
function cutscene_change_sprite(obj,spr,ind) {
	///@arg object
	///@arg sprite
	///@arg index
	with obj {
		sprite_index = spr;
		image_index = ind;	
	}
	cutscene_end_action();
}
function cutscene_change_direction(obj,d) {
	//obj.rot = obj.dir;
	with obj {
		rot += angle_difference(d,rot) * 0.10;
		//dir = rot;
		if abs(angle_difference(d,rot)) < 0.1 {
			//rot = d;
			//dir = d;
			with other  cutscene_end_action();
		}
	}
}
function cutscene_activate_trigger(inst) {
	with inst  active = true
	cutscene_end_action();
}
function cutscene_play_animation(obj,sprite,next_sprite) {
	with obj {
		sprite_index = sprite;
		image_speed = 1;
		if image_index >= image_number-1 {
			if next_sprite = noone {
				image_index = image_number-1;
				image_speed = 0;
			} else {
				sprite_index = next_sprite;
			}
			cutscene_end_action();
		}
	}
}
function cutscene_activate_layer(l) {
	instance_activate_layer(l);
	cutscene_end_action();
}
function cutscene_change_obj_layer(obj,new_layer) {
	with obj {
		if layer != layer_get_id(new_layer) {
			layer = layer_get_id(new_layer);
		}
	}
	cutscene_end_action();
}
function cutscene_lock_door(inst) {
	with inst {
		locked = true;
		alarm[0] = 1;
	}
	cutscene_end_action();
}
function cutscene_unlock_door(inst) {
	with inst  has_key = true;
	cutscene_end_action();
}