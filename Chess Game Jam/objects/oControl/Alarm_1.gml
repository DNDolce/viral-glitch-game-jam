/// @description 
if !instance_exists(text_box)
{	var _piece = instance_nearest(80, 48, oPiece);
	_piece.team = 1;
	_piece.image_index = 0;
	_piece.move_up = [0,0];
	_piece.move_down = [2, 0];
	_piece.move_up_diag = [0, 0];
	_piece.move_down_diag = [0, 1];
	_piece = instance_nearest(80, 144, oPiece);
	_piece.team = 0;
	_piece.image_index = 6;
	_piece.moved = false;
	_piece.move_up = [0,1];
	_piece.move_down = [0, 0];
	_piece.move_up_diag = [2, 0];
	_piece.move_down_diag = [0, 0];
	_piece.y = 128;
	instance_create_layer(80, 144, "Instances", oPiece, 
		{	piece : "queen",
			team : 0,
			image_index : 10,
			move_up			: [20, 20],
			move_down		: [20, 20],
			move_left		: [20, 20],
			move_right		: [20, 20],
			move_up_diag	: [20, 20],
			move_down_diag	: [20, 20]});
	global.held_piece = noone;
	instance_destroy(oAttack);
	instance_destroy(oIndicator);
} else
	alarm[1] = 1;