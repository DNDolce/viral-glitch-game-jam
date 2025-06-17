image_index = turn;

if  room == rLevel2
and turns_passed == 1
and turn ==1
and !alarm[3]
{	global.held_piece = instance_nearest(80, 48, oPiece);
	ai_moveX = 112;
	ai_moveY = 80;
	alarm[3] = 60;
};

if  room == rLevel2
and turns_passed == 2
and !instance_exists(oExpBar)
and !instance_exists(text_box)
{	var _scene_text = instance_create_depth(1000, 1000, 0, speak_block);
	with _scene_text
	{	global.talker = id;
		number_of_chapters = 0;
		scr_create_textbox("pawn trade");
	};
	turn = 1;
	turns_passed += 1;
	global.stop_all = true;
	alarm[2] = 1;
};

if  room == rLevel2
and turns_passed == 4
and !instance_exists(oExpBar)
and !instance_exists(text_box)
{	var _scene_text = instance_create_depth(1000, 1000, 0, speak_block);
	with _scene_text
	{	global.talker = id;
		number_of_chapters = 0;
		scr_create_textbox("pawn trap");
	};
	global.stop_all = false;
	turns_passed += 1;
};

if  room == rLevel2
and turns_passed == 5
and !instance_exists(oExpBar)
and !instance_exists(text_box)
{	if global.held_piece == noone
	{	global.held_piece = instance_nearest(80, 128, oPiece);
	} else if global.held_piece == instance_nearest(80, 128, oPiece)
	{	if instance_exists(oAttack)
		{	var _attack = instance_nearest(80, 128, oAttack);
			_attack.ai_attack = true;
		};
	};
};

if  room == rLevel2
and turns_passed == 6
and !instance_exists(oExpBar)
and !instance_exists(text_box)
{	var _scene_text = instance_create_depth(1000, 1000, 0, speak_block);
	with _scene_text
	{	global.talker = id;
		global.held_piece = instance_nearest(80, 48, oPiece);
		number_of_chapters = 0;
		scr_create_textbox("pawn wait");
	};
	global.stop_all = false;
	turns_passed += 1;
};

if room == rLevel2
and turns_passed <= 7
{	exit;
};
if  turn == 1
and global.held_piece == noone
and !instance_exists(text_box)
and !instance_exists(oExpBar)
and !global.stop_all
and !alarm[3]
{	alarm[3] = 1;
};

