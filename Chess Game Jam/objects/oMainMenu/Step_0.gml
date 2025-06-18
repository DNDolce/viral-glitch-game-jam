/// @description 
var _up		= keyboard_check_pressed(vk_up);
var _down	= keyboard_check_pressed(vk_down);
var _accept = keyboard_check_pressed(ord("A"));

pos += _down - _up;
pos = clamp(pos, 0, 1);

if _up or _down
{	audio_play_sound(snMenuMove, 0, false, 5);
};

if pos == 0
{	x = 70;
	y = 107;
};
if pos == 1
{	x = 70;
	y = 139;
};

if  _accept 
and pos == 0
{	audio_play_sound(snAccept, 0, false, 5);
	room_goto_next();
};
if  _accept
and pos == 1
{	audio_play_sound(snAccept, 0, false, 5);
	game_end();
};