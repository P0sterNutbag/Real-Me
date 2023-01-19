// change slider location
if xx > width-1  dir = -1;
else if xx < 0  dir = 1;

xx += 0.5*dir;

// hit points
key_hit = max(keyboard_check_pressed(vk_anykey),mouse_check_button_pressed(mb_left),0);
for (var i=0; i<array_length(points); i++) {
	if key_hit {
		if xx+1 >= points[i]-1 and xx < points[i]+1 {
			array_delete(points,i,1);
		} else if canhurt {
			obj_player.hp -= 1;
			canhurt = false;
		}
	} else  canhurt = true;
}

// destroy
if array_length(points) <= 0  instance_destroy();

// maintain position
x = obj_player.x-width/2;
y = obj_player.y+5;
