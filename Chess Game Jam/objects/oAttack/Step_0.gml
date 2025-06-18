if (mouse_check_button_pressed(mb_left)
and position_meeting(mouse_x, mouse_y, id)
and global.held_piece != noone
and !global.stop_all)
{	defender = instance_nearest(x, y, oPiece);
	attacker = global.held_piece;
	defender.prev_x = defender.x;
	defender.prev_y = defender.y;
	global.attack_spot = id;
	global.stop_all = true;
};

if  ai_attack
and global.held_piece != noone
and !global.stop_all
{	defender = instance_nearest(x, y, oPiece);
	attacker = global.held_piece;
	defender.prev_x = defender.x;
	defender.prev_y = defender.y;
	global.attack_spot = id;
	global.stop_all = true;
};

