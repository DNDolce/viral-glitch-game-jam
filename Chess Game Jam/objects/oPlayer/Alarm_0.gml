/// @description 
var _end = false;
if x < moveX
{	x += clamp(1.5, 1, moveX - x);
} else if x > moveX
{	x -= clamp(1.5, 1, x - moveX);
};

if y < moveY
{	y += clamp(1.5, 1, moveY - y);
} else if y > moveY
{	y -= clamp(1.5, 1, y - moveY);
};

if	x == moveX 
and y == moveY
	_end = true;
	
if !_end
	alarm[0] = 1;