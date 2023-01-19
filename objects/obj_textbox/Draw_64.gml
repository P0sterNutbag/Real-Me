draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_normal);

var xx = width/2-(sprite_get_width(spr_hud)/2);
var yy = height-height/4; 
draw_sprite(spr_textbox,image_index,xx,yy);

var w = sprite_get_width(spr_textbox);
var h = sprite_get_height(spr_textbox);
if portrait = "noone"  var xoffset = 19;
else  var xoffset = 32;
draw_text_ext(xx-(w/2)+xoffset,height-height/4-(h/2),textOutput+" "+input,8,1000);

/* draw the little button thing to do go next
if done and draw_next {
	draw_sprite(spr_end_text,0,xx+w/2-8,yy+10);
}*/

//if done  draw_text(width/2,height/2+16,final_text);
//draw_sprite(string(text),0,34,113);

/*if drawIcon {
	draw_sprite(sprTextboxIcon,0,225,128);
}*/
/*draw_text_typewriter(textbox, 45, 100, width, floor(t));

if t >= text_length {
	icon_flash += 1;
	if icon_flash >= flash_speed {
		icon_flash = 0;
		a = -a;
	} 
	draw_sprite_ext(sprHand,0,300,167,1,1,0,c_white,a);
}

/*draw_text_ext(45,143,message_draw,10,260);

draw_sprite(picture,0,9,142);
