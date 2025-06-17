/// @description AI Move
if global.held_piece == noone
{	randomize();
	rand_piece = irandom(instance_number(oPiece) - 1);
	global.held_piece = instance_find(oPiece, rand_piece);
	if global.held_piece.team != 1
	{	global.held_piece = noone;
	} else
	{	alarm[3] = 20;
	};
	ai_moveX = 0;
	ai_moveY = 0;
} else if ai_moveX == 0
{	if  !instance_exists(oIndicator)
	and !instance_exists(oAttack)
	{	global.held_piece = noone;
		alarm[3] = 1;
	} else
	{	var _option = [];
		for (var m = 0; m < instance_number(oIndicator); m++)
		{	if !instance_exists(oAttack)
			{	array_set(_option, array_length(_option), instance_find(oIndicator, m));
			};
		};
		for (var a = 0; a < instance_number(oAttack); a++)
		{	array_set(_option, array_length(_option), instance_find(oAttack, a));
		};
		var _rand_option = irandom(array_length(_option) - 1);
		if _option[_rand_option].type == "move"
		{	ai_moveX = _option[_rand_option].x - 2;
			ai_moveY = _option[_rand_option].y - 2;
			alarm[3] = 20;
		} else
		{	_option[_rand_option].ai_attack = true;
		};
		global.held_piece.prev_x = global.held_piece.x;
		global.held_piece.prev_y = global.held_piece.y;
	};
} else
{	Move_exe(ai_moveX, ai_moveY);
};