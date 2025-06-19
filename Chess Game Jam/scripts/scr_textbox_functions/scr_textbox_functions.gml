//DO NOT FUCK WITH
function scr_set_defaults_for_text(){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	// variables for every letter/character
	for (var c = 0; c < 500; c++){
	
		col_1[c, page_number] = c_white;
		col_2[c, page_number] = c_white;
		col_3[c, page_number] = c_white;
		col_4[c, page_number] = c_white;
		
		float_text[c, page_number] = false;
		float_dir[c, page_number] = c * 20;
		slant_text[c, page_number] = false;
		shake_text[c, page_number] = false;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4);
	}
	
	textbox_sprite[page_number] = spr_npc_textbox;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
}

// ----------------------------text VFX --------------------------//
/// @param 1st_character
/// @param last_character
/// @param col_1
/// @param col_2
/// @param col_3
/// @param col_4
function scr_text_color(_start, _end, _col_1, _col_2, _col_3, _col_4){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	for (var c = _start; c <= _end; c++){
	
		col_1[c, page_number - 1] = _col_1;
		col_2[c, page_number - 1] = _col_2;
		col_3[c, page_number - 1] = _col_3;
		col_4[c, page_number - 1] = _col_4;
	}
}

/// @param 1st_character
/// @param last_character
function scr_text_float(_start, _end){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	for (var c = _start; c <= _end; c++){
	
		float_text[c, page_number - 1] = true;
	}
}

/// @param 1st_character
/// @param last_character
function scr_text_slant(_start, _end){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	for (var c = _start; c <= _end; c++){
	
		slant_text[c, page_number - 1] = true;
	}
}

/// @param 1st_character
/// @param last_character
function scr_text_shake(_start, _end){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	for (var c = _start; c <= _end; c++){
	
		shake_text[c, page_number - 1] = true;
	}	
}

/// @param text
/// @param [character]
function scr_text(_text){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	scr_set_defaults_for_text()
	
	text[page_number] = _text;
	
	if argument_count > 1{
	
		// get character info
		switch argument[1]{
		
			case "blue npc":
				speaker_sprite[page_number] = spr_npc_blue_speak;
				speaker_sprite_neutral[page_number] = spr_npc_blue_neutral;
				textbox_sprite[page_number] = spr_npc_blue_textbox;
				speaker_side[page_number] = 1;
				break;
			case "blue npc happy":
				speaker_sprite[page_number] = spr_npc_blue_happy;
				speaker_sprite_neutral[page_number] = spr_npc_blue_happy_neutral;
				textbox_sprite[page_number] = spr_npc_blue_textbox;
				speaker_side[page_number] = 1;
				break;
			case "blue npc angry":
				speaker_sprite[page_number] = spr_npc_blue_angry;
				speaker_sprite_neutral[page_number] = spr_npc_blue_angry_neutral;
				textbox_sprite[page_number] = spr_npc_blue_textbox;
				speaker_side[page_number] = 1;
				break;
			case "death":
				speaker_sprite[page_number] = sDeathSpeak;
				speaker_sprite_neutral[page_number] = sDeathNeutral;
				textbox_sprite[page_number] = spr_npc_blue_textbox;
				speaker_side[page_number] = 1;
				break;
			case "piece":
				textbox_sprite[page_number] = spr_npc_blue_textbox;
				break;
			case "horse":
				speaker_sprite[page_number] = spr_horse;
				speaker_sprite_neutral[page_number] = spr_horse;
				textbox_sprite[page_number] = spr_horse_textbox;
				speaker_side[page_number] = -1;
		}
	}
	
	page_number++;
}

/// @param option
/// @param line_id
function scr_option(_option, _link_id){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}

/// @param text_id
function scr_create_textbox(_text_id){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	with (instance_create_depth(0, 0, -5, text_box)){
	
		scr_game_text(_text_id);
	}
}
