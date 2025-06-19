turn = 0;
turns_passed = 0;
rand_piece = 0;
stop = false;
image_xscale = 2;
image_yscale = 2;
ai_moveX = 0;
ai_moveY = 0;
pawn_switch_a = instance_nearest(80, 128, oPiece);
pawn_switch_b = instance_nearest(80, 48, oPiece);
switch_pos_a = [pawn_switch_b.x, pawn_switch_b.y];
switch_pos_b = [pawn_switch_a.x, pawn_switch_a.y];

string_shown = "";
char_shown = 0;
char_hidden = 0;

if room == rLevel1
{	first_attack = false;
	level = "Level 1: Chess?";
} else
{	first_attack = true;
	level = "Level 2: Pity";
};