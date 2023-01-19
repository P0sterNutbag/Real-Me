if spd > 0 {
	with instance_create_layer(x,y,"particals",obj_blood) {
		spd = 0;
		dir = 0;
	}
	//alarm[0] = random(2);
	if spd > 1  alarm[0] = 1;
	else  alarm[0] = 2;
}
