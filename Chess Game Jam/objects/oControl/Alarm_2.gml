/// @description 
var _end = false;
if !instance_exists(text_box)
{	with pawn_switch_a
	{	move_towards_point(oControl.switch_pos_a[0], y, 1);
		move_towards_point(x, oControl.switch_pos_a[1], 1);
		x = round(x);
		y = round(y);
		_end = false;
		if  x == oControl.switch_pos_a[0]
		and y == oControl.switch_pos_a[1]
		{	speed = 0;
			_end = true;
		};
	};
	
	with pawn_switch_b
	{	move_towards_point(oControl.switch_pos_b[0], y, 1);
		move_towards_point(x, oControl.switch_pos_b[1], 1);
		x = round(x);
		y = round(y);
		_end = false;
		if  x == oControl.switch_pos_b[0]
		and y == oControl.switch_pos_b[1]
		{	speed = 0;
			_end = true;
		};
	};
	
	if _end
	{	pawn_switch_a.prev_x = switch_pos_a[0];
		pawn_switch_a.prev_y = switch_pos_a[1];
		pawn_switch_b.prev_x = switch_pos_b[0];
		pawn_switch_b.prev_y = switch_pos_b[1];
		turns_passed += 1;
	} else
	{	alarm[2] = 1;
	};
} else
	alarm[2] = 1;