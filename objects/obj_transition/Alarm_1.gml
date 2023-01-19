// place player
if room != enterance {
	with obj_player_placer  if place = other.place  var p = id;
	with obj_player  {
		x = p.x; 
		y = p.y;
	}
}
