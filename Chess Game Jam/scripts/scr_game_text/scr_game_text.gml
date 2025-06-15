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

		
		//--------------------POST LEVEL 1-------------------------------//
		case "pawn rPostLevel1 0":
			scr_text("so like youre one of my subjects");
			scr_text("thats sickk like lowkey");
			scr_text("Wow he spoke to me... Sir, I'm so proud to be part of this country!", "piece");
				scr_text_float(0, 18);
			scr_text("haha ya dope man keep on payin those tithes");
			break;
			
		case "bishop rPostLevel1 0":
			scr_text("yooo bro");
			scr_text("seen anything good lately on reddit?");
			scr_text("What", "piece");
			scr_text("Who uses reddit nowadays?", "piece");
			scr_text("Nerd", "piece");
			break;
			
		case "knight rPostLevel1 0":
			scr_text("...", "horse");
			scr_text("yeah so true man");
			scr_text("hahah keep on balling out man tighttt");
			scr_text("...", "horse");
			break;
		
		case "rook rPostLevel1 0":
			scr_text("We will make you proud, boss.", "piece");
			scr_text("lol whatever ig");
			scr_text("cool beans");
			scr_text("What.", "piece");
			break;
		
		//--------------------POST LEVEL 2-------------------------------//
		case "queen rPostLevel2 0":
			scr_text("Yeah that's all we have so far.", "piece");
			scr_text("Would you like to exit now?", "piece");
				scr_option("Yes", "exit - yes");
				scr_option("No", "exit - no");
			break;
		
		case "queen rPostLevel2 1":
			scr_text("Would you like to exit now?", "piece");
				scr_option("Yes", "exit - yes");
				scr_option("No", "exit - no");
			break;
			
		case "exit - yes":
			scr_text("");
			instance_destroy(text_box);
			game_end();
			break;
			
		case "exit - no":
			scr_text("");
			instance_destroy(text_box);
			break;
		
		//----------------DEFAULT----------------------//
		default:
			scr_text("No text_id was given.");
		
	}
}