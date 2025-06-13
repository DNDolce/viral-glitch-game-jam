/// @description DO NOT FUCK WITH 
//A SINGULAR THING IN THIS OBJECT
//THIS THING IS A FUCKING NIGHTMARE TO DEBUG DON'T EVEN LOOK AT IT

// textbox parameteres
depth = -5;
textbox_width = 12 * 16 * 4;
textbox_height = 32 * 4;
border = 20;
line_separation = 25;
line_width = textbox_width - border * 2;
textbox_image = 0;
textbox_image_speed = 6 / 60;

// the text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
character[0, 0] = "";
character_y[0, 0] = 0;
character_x[0, 0] = 0;
draw_character = 0;
text_speed = 1;
// options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;

// effects
scr_set_defaults_for_text()
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;