// PLAY STATE //
if !instance_exists(obj_pause) {
	// draw back
	draw_sprite_ext(spr_hud,0,width,0,1,1,0,image_blend,image_alpha);
	if instance_exists(obj_player) {
		// set alpha and color to cutscene
		draw_set_alpha(1);
		if instance_exists(obj_cutscene)  image_blend = c_gray;
		else  image_blend = c_white;
		
		// draw health
		draw_sprite_ext(spr_hpbar,obj_player.max_hp-obj_player.hp,width-36-1,6+6,1,1,0,image_blend,image_alpha);
	
		// draw ammo
		draw_set_font(fnt_normal);
		draw_set_color(c_white);
		if obj_player.has_gun {
			draw_sprite_ext(spr_hud_gun,0,width-35-1,40+6,1,1,0,image_blend,image_alpha);
			draw_set_valign(fa_top);
			draw_set_halign(fa_center);
			draw_text_color(width-15-1,50+6,string(obj_player.ammo_in_clip)+"/"+string(obj_player.ammo),image_blend,image_blend,image_blend,image_blend,image_alpha); //obj_player.ammo));
		} else {
			draw_sprite_ext(spr_hud_gun,1,width-35-1,40+6,1,1,0,image_blend,image_alpha);
			var c = make_color_rgb(51,45,45);
			//draw_set_halign(fa_top);
			draw_set_valign(fa_top);
			draw_set_halign(fa_center);
			draw_text_color(width-15-1,50+6,string(obj_player.ammo_in_clip)+"/"+string(obj_player.ammo),c,c,c,c,image_alpha);
		}
		
		// draw hp kits
		if obj_player.hpkit_count > 0 {
			draw_sprite_ext(spr_hud_kits,0,width-32-1,70+6,1,1,0,image_blend,image_alpha);
			draw_text_color(width-12-1,66+6,""+string(obj_player.hpkit_count),image_blend,image_blend,image_blend,image_blend,image_alpha);
		} else  draw_sprite_ext(spr_hud_kits,1,width-32-1,70+6,1,1,0,image_blend,image_alpha);
	
		// draw interact
		if instance_exists(obj_interact) and !instance_exists(obj_cutscene) {
			var o = instance_nearest(obj_player.x,obj_player.y,obj_interact)
			with obj_player  var dis = distance_to_object(o);
			if o.can_interact and dis <= 3 {
				draw_set_halign(fa_left);
				draw_set_color(c_white)
				draw_text(8,8,"press 'E' to interact");
			}
		}
		
		/* draw room
		draw_set_halign(fa_right);
		draw_set_color(c_white);
		draw_text_color(width-3,height-10,room_text,image_blend,image_blend,image_blend,image_blend,image_alpha);
		*/
	}
	
	// noise
	if global.noise_filter {
		draw_set_alpha(0.075);
		var dark_gray = make_color_hsv(248,0,13);
		for (var i=0; i<height; i+=2) {
			draw_set_color(choose(dark_gray,c_black));
			draw_rectangle(0,i,width,i+2,false);
		}
		draw_set_alpha(1);
	}
}
//draw_text(20,20,obj_new_camera.zoom_lvl);
/* set alpha for transitions
if instance_exists(obj_transition)  image_alpha = -obj_transition.image_alpha;
else  image_alpha = 1;
draw_set_alpha(image_alpha);

/* CUTSCENE STATE //
if global.gamestate = "cutscene" {
	draw_sprite(spr_hud,0,0,0);
}
