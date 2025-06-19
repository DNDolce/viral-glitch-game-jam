/// @description 
if  piece == "king"
and team == 1
{	global.held_piece = noone;
	global.stop_all = false;
	if room == rLevel2
	and instance_exists(text_box)
	{	global.betrayal = true;
	};
	room_goto_next();
} else if piece == "king"
{	game_restart();
};