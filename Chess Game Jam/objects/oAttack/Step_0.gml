if  mouse_check_button_pressed(mb_left)
and position_meeting(mouse_x, mouse_y, id)
and global.held_piece != noone
{	var _target = instance_nearest(x, y, oPiece);
	if _target.piece == "king"
		game_restart();
	instance_destroy(_target);
	global.held_piece.x = x;
	global.held_piece.y = y;
	global.held_piece.moved = true;
	oControl.turn = 1 - global.held_piece.team;
	global.held_piece = noone;
	instance_destroy(oIndicator);
	instance_destroy(oAttack);
};