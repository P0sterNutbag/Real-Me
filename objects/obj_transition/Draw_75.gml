//draw_sprite_ext(spr_transition,0,x,y,width,height,0,c_black,image_alpha);
var w = display_get_gui_width();
var h = display_get_gui_height();
//var dark_gray = make_color_hsv(248,0,13);
draw_set_color(c_black);
draw_set_alpha(image_alpha);
//draw_sprite(spr_background,0,0,0);
draw_rectangle(0,0,w,h,false);
/*draw_set_alpha(image_alpha);
var dark_gray = make_color_hsv(248,0,13);
for (var i=0; i<h; i+=1) {
	draw_set_color(choose(dark_gray,c_black));
	draw_rectangle(0,i,w,i+2,false);
}
