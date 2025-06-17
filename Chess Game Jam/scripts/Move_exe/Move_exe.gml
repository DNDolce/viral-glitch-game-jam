// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Move_exe(xx = x - 2, yy = y - 2){
	global.held_piece.x = xx;
	global.held_piece.y = yy;
	global.held_piece.moved = true;
	global.held_piece = noone;
	if oControl.turn == 0
	{	oControl.turn = 1;
	} else
	{	oControl.turn = 0;
	};
	oControl.turns_passed++;
	mouse_clear(mb_left);
	instance_destroy(oIndicator);
	instance_destroy(oAttack);
}