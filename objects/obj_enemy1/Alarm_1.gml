xtarg = x+random_range(wander_dis,-wander_dis);
ytarg = y+random_range(wander_dis,-wander_dis);
while collision_line(x,y,xtarg,ytarg,par_solid,false,false) {
	xtarg = x+random_range(wander_dis,-wander_dis);
	ytarg = y+random_range(wander_dis,-wander_dis);
}