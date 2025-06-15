/// @description 
//I repeat
//DO NOT FUCK WITH THIS OBJECT

var Interact = keyboard_check_pressed(ord("A"));
var interact_distance = 15;
sprite_index = my_sprite;

// check if player is nearby
if instance_exists(oPlayer){

	if global.highlighted == id {
	
		image_index = 1;
		// initiate dialogue if player interacts
		if distance_to_object(oPlayer) < interact_distance and !instance_exists(text_box){
		
			global.talker = id;
			scr_create_textbox(text_id);
		}
	} else{
	
		image_index = 0;
	}
}

text_id = name_string + " " + room_get_name(room) + " " + string(text_chapter);
draw_self();

if global.talker != id and x == 1000 and y == 1000 instance_destroy(self);