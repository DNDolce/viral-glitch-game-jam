/// @description Move to new/old spot
var _end = false;
if defender.hp > 0
{
	if attack_num == 0
	{	attack_num = 1;
		anim_start = true;
		anim_frame = 0;
		exit;
	}
	if attacker.x < attacker.prev_x
		attacker.x += 1;
	if attacker.x > attacker.prev_x
		attacker.x -= 1;
	if attacker.y < attacker.prev_y
		attacker.y += 1;
	if attacker.y > attacker.prev_y
		attacker.y -= 1;
	
	if defender.x < defender.prev_x
		defender.x += 1;
	if defender.x > defender.prev_x
		defender.x -= 1;
	if defender.y < defender.prev_y
		defender.y += 1;
	if defender.y > defender.prev_y
		defender.y -= 1;
	if attacker.x != attacker.prev_x
	or attacker.y != attacker.prev_y
	or defender.x != defender.prev_x
	or defender.y != defender.prev_y
	{	alarm[1] = 1;
	} else
	{	_end = true;
	};
} else
{	if attacker.x < defender.prev_x
		attacker.x += 1;
	if attacker.x > defender.prev_x
		attacker.x -= 1;
	if attacker.y > defender.prev_y
		attacker.y -= 1;
	if attacker.y < defender.prev_y
		attacker.y += 1;
	if attacker.x != defender.prev_x
	or attacker.y != defender.prev_y
	{	alarm[1] = 1;
	} else
	{	_end = true;
	};
};
	
if _end
{	battle_start = false;
	if defender.hp <= 0
	{	attacker.x = x;
		attacker.y = y;
		instance_create_layer(center_pos, center_pos, "Instances", oExpBar, {caller : attacker, destroy : defender});
	} else if attacker.hp <= 0
	{	instance_create_layer(center_pos, center_pos, "Instances", oExpBar, {caller : defender, destroy : attacker});
	} else
	{	oControl.turn = 1 - attacker.team;
		global.held_piece.moved = true;	
		global.held_piece = noone;
		mouse_clear(mb_left);
	};
	global.stop_all = false;
	global.attack_spot = noone;
	instance_destroy(oIndicator);
	instance_destroy(oAttack);
};