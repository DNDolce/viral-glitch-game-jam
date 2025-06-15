if  global.attack_spot != id
and global.attack_spot != noone
	instance_destroy(self);
	
if  mouse_check_button_pressed(mb_left)
and position_meeting(mouse_x, mouse_y, id)
and global.held_piece != noone
and !global.stop_all
{	defender = instance_nearest(x, y, oPiece);
	attacker = global.held_piece;
	defender.prev_x = defender.x;
	defender.prev_y = defender.y;
	battle_move = true;
	battle_start = true;
	global.stop_all = true;
	global.attack_spot = id;
};

if battle_move
{	move_xa  = attacker.prev_x - 36;
	alarm[0] = 3;
	battle_move = false;
};

if  instance_exists(oExpBar)
{	visible = false;
}