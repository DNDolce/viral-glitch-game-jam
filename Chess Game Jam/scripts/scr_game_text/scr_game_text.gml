//This is the only thing you need to fuck with to create dialogue
//Don't fuck with other stuff in this folder group
function scr_game_text(_text_id){
	
	switch _text_id{
		/*FORMAT:
		case "{name_string} {room name} {chapter #}":
		scr_text("{Insert message string here}", "{name of character}");
		scr_text("{Insert response string}");
			scr_text_slant({char # to start at}, {char # to end at});
			scr_option({Displayed selection}, {_text_id of follow-up})
		
		
		*Chapter # refers to how many times you have spoken to them,
		not which message in an interaction you're on
		Each scr_text() represents a new textbox in the current interaction
		
		*Text effects apply to PREVIOUS scr_text instance, not next
		
		*Name of character does not mean the name string
		The name can be found in scr_game_text from lines 96 in the case statement
		This can be left blank and does have defaults
		One character can have several names based on which sprite you are displaying
		E.G. "Susan", "Susan Smiling", "Susan Angry" use different data and must be specified
		
		*Text effects include: 
		scr_text_slant(start #, end #);
		scr_text_shake(start #, end #);
		scr_text_float(start #, end #);
		scr_text_color(start #, end #, top left color, top right color, bottom left color, bottom right color);
		
		*scr_option() will automatically display all of the options given (one option per one scr_option)
		and will display the connected _text_id dialogue immediately after a selection is chosen
		Do not have any scr_text() after an option tree in a case
		*/
		
		//-------------------------DEBUGG--------------------------------//

		
		// --------------------GENERIC TRIGGERS--------------------------//
		case "Tech display":
			scr_text("Don Diddly Onders");
			scr_text("Hit em with that goob lick", "blue npc happy")
			break;
			
		//----------------DEFAULT----------------------//
		default:
			scr_text("No text_id was given.");
		
	}
}