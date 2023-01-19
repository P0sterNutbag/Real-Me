if instance_exists(obj_player)
	if obj_player.has_gun  cursor_sprite = spr_crosshair;
	else  cursor_sprite = spr_cursor;
else  cursor_sprite = spr_cursor;
