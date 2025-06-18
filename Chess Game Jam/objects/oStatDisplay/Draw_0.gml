/// @description 
if global.held_piece == noone
or global.stop_all
or !oControl.first_attack
or oControl.turn == 1
or instance_exists(text_box)
or instance_exists(oExpBar)
{	exit;
};

draw_self();
draw_set_font(fn_small);
draw_set_halign(fa_right);
draw_set_color(c_orange);
draw_text(x + 44, y - 63, global.held_piece.level);
draw_text(x + 44, y - 51, global.held_piece.experience);
draw_text(x + 44, y - 39, global.held_piece.hp);
draw_text(x + 44, y - 27, global.held_piece.dmg);
draw_text(x + 44, y - 15, global.held_piece.def);