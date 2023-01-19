event_inherited();

/* run fast while near player
if distance_to_object(obj_player) < 5 and !place_meeting(x,y,obj_player) {
	spd = lerp(spd,0.35,0.1);
} else {
	spd = lerp(spd,0.25,0.1);
}
