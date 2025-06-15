/// @description ABSOLUTELY 100% DO NOT FUCK WITH A SINGULAR THING IN THIS OBJECT
//THIS THING IS A FUCKING NIGHTMARE TO DEBUG DON'T EVEN LOOK AT IT

var key_accept = keyboard_check_pressed(ord("A"));
var Camera = view_get_camera(0);
var yy =  8 * 22 * 4.8;
var xx = camera_get_view_width(Camera) / WIN_SIZE * 0.5;

// ---------------------- setup ------------------------- //
if !setup{

	setup = true;
	draw_set_font(fn_start_menu);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// loop through pages
	for (var p = 0; p < page_number; p++){
		
		// find how many comments are on each page and store that number in the text_length array
		text_length[p] = string_length(text[p]);
		
		// get the x position for the textbox
			// character on the left
			text_x_offset[p]			=  1.5 * 36 * WIN_SIZE + 6; //format: #ofTiles * tileWidth * windowRatio
			portrait_x_offset[p]		=   -2 * 36 * WIN_SIZE;
			
			// character on the right
			if speaker_side[p] == -1{
				
				text_x_offset[p]		= -1.5 * 36 * WIN_SIZE - 6;
				portrait_x_offset[p]	=   20 * 36 *  WIN_SIZE + 120;
			}
			
			// no character speaking (center the textbox)
			if speaker_sprite[p] == noone{
				
				text_x_offset[p] = 0;
			}
			
		// setting individual characters and finding where the lines of text should break
		for (var c = 0; c < text_length[p]; c++){
			
			var _char_pos = c + 1;
			
			// store individual characters in the "character" array
			// NOTE TO FUTURE SELF: STRINGS START AT 1, NOT 0. HENCE THE +1 HERE
			character[c, p] = string_char_at(text[p], _char_pos);
			
			// get current width of the line
			var _text_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_text_w = string_width(_text_up_to_char) - string_width(character[c, p]);
			
			// get the last free space
			if character[c, p] == " "{last_free_space = _char_pos + 1;}
			
			// get the line breaks
			if _current_text_w - line_break_offset[p] > line_width{
				
				line_break_pos[line_break_num[p], p] = last_free_space;
				line_break_num[p]++;
				var _text_up_to_last_space = string_copy(text[p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				line_break_offset[p] = string_width(_text_up_to_last_space) - string_width(_last_free_space_string);
			}
		}
		
		// getting each characters coordinates
		for (var c = 0; c < text_length[p]; c++){
		
			var _char_pos = c + 1;
			var _text_x = xx + text_x_offset[p] + border;
			var _text_y = yy + border;		
			// get current width of the line
			var _text_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_text_w = string_width(_text_up_to_char) - string_width(character[c, p]);
			var _text_line = 0;
			
			// compensate for string breaks
			for (var lb = 0; lb < line_break_num[p]; lb++){
			
				// if the current looping character is after a line break
				if _char_pos >= line_break_pos[lb, p]{
				
					var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
					_current_text_w = string_width(_str_copy);
					
					// record the "line" this character should be on
					_text_line = lb + 1; // +1 since lb starts at 0
				}
			}
			
			// add to the x and y coords based on the new info
			character_x[c, p] = _text_x + _current_text_w;
			character_y[c, p] = _text_y + _text_line * line_separation;
		}
	}
}
	
// ----------------- typing the text  ------------------- //
if text_pause_timer <= 0{
	
	if draw_character < text_length[page]{
		audio_play_sound(text_sound_1, 10, false, 2, 0, 1.5);
		draw_character += text_speed;
		draw_character = clamp(draw_character, 0, text_length[page])
		var _check_char = string_char_at(text[page], draw_character);
		if _check_char == "." or _check_char == "!" or _check_char == "?"{
		
			text_pause_timer = text_pause_time;
		}
	}
} else{

	text_pause_timer--;
}

// ---------------- flip through pages ------------------//
if key_accept{

	// if the typing is done
	if draw_character == text_length[page]{
		
		// next page
		if page < page_number - 1{
		
			page++;
			draw_character = 0;
		}
		// destry textbox
		else{
			
			// link text for options
			if option_number > 0{
				
				scr_create_textbox(option_link_id[option_pos]);
			}
			
			// progress to next chapter if there are any
			if global.talker.text_chapter < global.talker.number_of_chapters{
				
				global.talker.text_chapter += 1;
			}
			
			global.highlighted = noone;
			instance_destroy();
		}
	}
	// if typing is not done
	else{
		draw_character = text_length[page];
	}
}
	
	
// ------------------draw the textbox--------------------//
var _textbox_x = xx + text_x_offset[page];
var _textbox_y = yy;
textbox_image += textbox_image_speed;
var textbox_sprite_w = sprite_get_width(textbox_sprite[page]);
var textbox_sprite_h = sprite_get_height(textbox_sprite[page]);
draw_set_halign(fa_left);
draw_set_font(fn_start_menu);
// draw the speaker
if speaker_sprite[page] != noone{

	sprite_index = speaker_sprite[page];
	if draw_character == text_length[page]{sprite_index = speaker_sprite_neutral[page];}
	var _speaker_x = xx + portrait_x_offset[page];
	if speaker_side[page] == -1{
		
		_speaker_x += sprite_width / textbox_sprite_w * 2;
	}
	// move object under box to not see double
	x = _speaker_x;
	y = yy;
	// draw the speaker
	draw_sprite_ext(textbox_sprite[page], textbox_image, xx + portrait_x_offset[page], yy, sprite_width * speaker_side[page] / textbox_sprite_w * 2, sprite_height / textbox_sprite_h * 2, 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speaker_x, yy, speaker_side[page] * 2, 2, 0, c_white, 1);
}
// back of the textbox
draw_sprite_ext(textbox_sprite[page], textbox_image, _textbox_x, _textbox_y, textbox_width / textbox_sprite_w, textbox_height / textbox_sprite_h, 0, c_white, 1);

// ----------------------options--------------------------//
if draw_character == text_length[page] && page == page_number - 1{
	
	// option selection
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number - 1);
	
	// draw the option
	var _option_space = 35;
	var _option_border = 20;
	for (var op = 0; op < option_number; op++){
	
		// draw option box
		var _o_w = string_width(option[op]) + _option_border * 2;
		draw_sprite_ext(textbox_sprite[page], textbox_image, _textbox_x + 48, _textbox_y - _option_space * option_number + _option_space * op, _o_w / textbox_sprite_w, (_option_space - 4) / textbox_sprite_h, 0, c_white, 1);
		
		// draw the option text
		var _c = c_white
		if option_pos == op{_c = c_yellow;}
		draw_text_color(_textbox_x + 48 + _option_border,  _textbox_y - _option_space * option_number + _option_space * op + 2, option[op], _c, _c, _c, _c, 1);
	}
}

// draw the text
for (var c = 0; c < draw_character; c++){
	
	//------------------special stuff---------------------//
	// wavy text
	var _float_y = 0;
	if float_text[c, page]{
	
		float_dir[c, page] -= 10;
		_float_y = dsin(float_dir[c, page]) * 2;// * x; where x is bigger the more you want it to float;
	}
	
	// slant text
	if slant_text[c, page]{ draw_set_font(fn_start_menu_slant);
	} else draw_set_font(fn_start_menu);
	
	// shaky text
	var _shake_x = 0;
	var _shake_y = 0;
	if shake_text[c, page]{
	
		shake_timer[c, page]--;
		if shake_timer[c, page] <= 0{
		
			shake_timer[c, page] = irandom_range(4, 8);
			shake_dir[c, page] = irandom(360);
		}
		
		if shake_timer[c, page] <= 2{
			
			_shake_x = lengthdir_x(1, shake_dir[c, page]);
			_shake_y = lengthdir_y(1, shake_dir[c, page]);	
		}
	}
	
	// the text
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_color(character_x[c, page] + _shake_x, character_y[c, page] + _float_y + _shake_y, character[c, page], col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], 1);
}