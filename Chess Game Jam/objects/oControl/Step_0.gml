image_index = turn;

if  turns_passed == 0
and !stop
{	var _scene_text = instance_create_depth(1000, 1000, 0, speak_block);
	with _scene_text
	{	global.talker = id;
		number_of_chapters = 0;
		scr_create_textbox("Tech display");
	};
	
	stop = true;
};