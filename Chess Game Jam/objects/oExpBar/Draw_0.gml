/// @description Draw exp bar
draw_set_color(c_ltgray);
draw_rectangle(center_pos - 27, 192 - 8, center_pos + 27, 192 - 2, false);
draw_set_color(c_orange);
draw_rectangle(center_pos - 25, 192 - 7, center_pos - 25 + prev_exp / 2 + exp_shown / 2, 192 - 3, false);
if exp_shown < exp_gain
{	exp_shown += 1;
	caller.experience += 1;
	if caller.experience >= 100
	{	caller.experience -= 100;
		caller.level += 1;
		level_gain = 1;
		var _dmg_gain = irandom_range(0, 10);
		caller.dmg += _dmg_gain;
		dmg_gain = _dmg_gain;
		var _def_gain = irandom_range(0, 10);
		caller.def += _def_gain;
		def_gain = _def_gain;
		level_up = true;
	};
} else if level_up == false
  and !alarm[0]
{	oControl.turn = 1 - global.held_piece.team;
	global.held_piece.moved = true;	
	instance_destroy(destroy);
	global.held_piece = noone;
	mouse_clear(mb_left);
	instance_destroy(self);
} else if level_up == true
{	if !alarm[0]
		alarm[0] = 180;
	draw_set_color(c_white);
	draw_rectangle(center_pos - 46, center_pos - 28, center_pos + 46, center_pos + 10, false);
	draw_set_color(c_ltgray);
	draw_rectangle(center_pos - 45, center_pos - 27, center_pos + 45, center_pos + 9, false);
	draw_set_color(c_black);
	draw_set_font(fn_start_menu);
	draw_set_halign(fa_left);
	draw_text(center_pos - 42, center_pos - 25, "LEVEL : " + string(prev_level) + " + [" + string(level_gain) + "]");
	draw_text(center_pos - 42, center_pos - 15, "DMG   : " + string(prev_dmg)   + " + [" + string(dmg_gain)   + "]");
	draw_text(center_pos - 42, center_pos - 5,  "DEF   : " + string(prev_def)   + " + [" + string(def_gain)   + "]");
};