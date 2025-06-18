/// @description 
if  piece == "king"
and team == 1
{	global.held_piece = noone;
	global.stop_all = false;
	room_goto_next();
} else if piece == "king"
{	game_restart();
};