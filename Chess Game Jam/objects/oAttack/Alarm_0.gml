/// @description Move towards animation
if attacker.x < 36
	attacker.x += 1;
if attacker.x > 36
	attacker.x -= 1;
if attacker.y < 32
	attacker.y += 1;
if attacker.y > 32
	attacker.y -= 1;
	
if defender.x < 140
	defender.x += 1;
if defender.x > 140
	defender.x -= 1;
if defender.y < 32
	defender.y += 1;
if defender.y > 32
	defender.y -= 1;
	
if attacker.x != 36
or attacker.y != 32
or defender.x != 140
or defender.y != 32
{	alarm[0] = 1;
} else
{	anim_start = true;
}