//no held piece = no indicator required
if global.held_piece == noone
{	instance_destroy(self);
	exit; //prevents crash on final frame before destroyed at line 8
};

//check how many squares away we are from held piece
var _deltaX = x - global.held_piece.x;
var _deltaY = y - global.held_piece.y;

//for each square (of the larger distance) away from piece...
for (var d = 0; d < max(sign(_deltaX) * _deltaX / tile_w, sign(_deltaY) * _deltaY  / tile_h); d++)
{	//check one square closer to the held piece
	//if there is no indicator and no held piece there
	//the move is cut off by a piece and is invalid
	if	!place_meeting(x + 2 + tile_h * -sign(_deltaX) * (d + 1), 
			y + 2 + tile_h * -sign(_deltaY) * (d + 1), oIndicator)
	and !place_meeting(x + 2 + tile_h * -sign(_deltaX) * (d + 1), 
			y + 2 + tile_h * -sign(_deltaY) * (d + 1), global.held_piece)
		instance_destroy(self);
};

//occupied spaces are not valid move locations
//(will need to be updated to account for taking pieces)
if place_meeting(x, y, oPiece)
{	var _target = instance_nearest(x, y, oPiece);
	if _target.team != oControl.turn
	and global.held_piece.piece != "pawn"
		instance_create_layer(x, y, "Instances", oAttack, {image_index : 1, depth : -1});
	instance_destroy(self);
};

if  mouse_check_button_pressed(mb_left)
and position_meeting(mouse_x, mouse_y, id)
and global.held_piece != noone
{	global.held_piece.x = x;
	global.held_piece.y = y;
	global.held_piece.moved = true;
	oControl.turn = 1 - global.held_piece.team;
	global.held_piece = noone;
	instance_destroy(oIndicator);
	instance_destroy(oAttack);
};