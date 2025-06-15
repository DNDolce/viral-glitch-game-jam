/// @description 
if instance_exists(text_box)
	exit;
	
if mouse_check_button_pressed(mb_left)
{	if position_meeting(mouse_x, mouse_y, speak_block)
	{	var _target = instance_nearest(mouse_x, mouse_y, speak_block);
		if x > _target.x + 16
			moveX = _target.x + 18;
		else if x + 16 < _target.x
			moveX = _target.x - 18;
		else
			moveX = _target.x;
			
		if y > _target.y + 16
			moveY = _target.y + 18;
		else if y + 16 < _target.y
			moveY = _target.y - 18;
		else
			moveY = _target.y;
		
		global.highlighted = _target;
		show_debug_message(global.highlighted.text_id)
	} else
	{	moveX = mouse_x - 8;
		moveY = mouse_y - 8;
	};
	alarm[0] = 1;
	mouse_clear(mb_left);
};