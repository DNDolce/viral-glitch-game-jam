//ignore everything here if another piece is already selected
if	global.held_piece != id
and global.held_piece != noone
	exit;
	
//select piece
if	position_meeting(mouse_x, mouse_y, id)
and	mouse_check_button_pressed(mb_left)
and oControl.turn == team
{	global.held_piece = id;
	prev_x = x;
	prev_y = y;
};

//remove first move bonus for pawns
if  piece == "pawn"
and moved
{	if move_up[0] == 2
		move_up[0] = 1;
	if move_down[0] == 2
		move_down[0] = 1;
};

if mouse_check_button_pressed(mb_right)
	global.held_piece = noone;
	
//if	global.held_piece == id
//{
	//move selected piece
	//if mouse_check_button_pressed(mb_left)
	//{	
		
	//	y = clamp(clamp(round((mouse_y - 8) / tile_h) * tile_h, 
	//		prev_y - 16 * max(move_up[0], move_up_diag[0]), prev_y + 16 * max(move_down[0], move_down_diag[0])), 32, 144);
	//	//outer clamp keeps piece in board boundaries
	//	//inner clamp keeps piece in move boundaries (eg. 1 space for pawns)
	//	x = clamp(clamp(round((mouse_x - 8) / tile_w) * tile_w,
	//		prev_x - 16 * max(move_left[0], move_up_diag[0], move_down_diag[0]), prev_x + 16 * max(move_right[0], move_up_diag[0], move_down_diag[0])), 32, 144);
			
		
	//	//put back piece if move is invalid
	//	if  !position_meeting(x + 2, y + 2, oIndicator)
	//	and !position_meeting(x + 2, y + 2, oAttack)
	//	{	x = prev_x;
	//		y = prev_y;
	//	} else
	//	{	//let go of piece in new location if move is valid
	//		var _target = instance_nearest(x, y, oPiece);
	//		if _target.team != oControl.turn
	//			instance_destroy(_target);
	//		global.held_piece = noone;
	//		moved = true;
	//		oControl.turn = 1 - team;
	//	};
		
	//};
	
	//cancel piece selection
//	if mouse_check_button_pressed(mb_right)
//	{	global.held_piece = noone;
//	}
//};