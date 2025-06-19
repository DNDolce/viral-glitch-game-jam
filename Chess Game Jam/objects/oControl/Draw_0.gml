/// @description 
draw_self();

draw_set_font(fn_small);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(center_pos, 16, string_shown);

if global.held_piece != noone
and !global.stop_all
and !instance_exists(text_box)
and turn == 0
{	draw_text(center_pos + 16, 170, "[Right click] to de-select");
};