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
		
		case "queen rPostLevel1 0":
			scr_text("You did nothing in that fight!", "piece");
			scr_text("NOTHING!", "piece");
			scr_text("lol yeah i was just kinda sitting there");
			scr_text("You are an absolute disgrace to this country and this monarchy. You should be ashamed of yourself!", "piece");
			scr_text("can you yell at me more");
			scr_text("No.", "piece");
			scr_text("Anyways you should watch out for the next opponent. I've heard they do weird things with their pieces.", "piece");
			scr_text("... Like in how they move. Not weird in another way.", "piece");
			break;
		case "queen rPostLevel1 1":
			scr_text("You should be fine though. Your opponents don't seem to have any real strategy.", "piece")
			scr_text("Sometimes it feels like they make their moves completely at random.", "piece")
			break;
			
		//------------------------ LEVEL 2-------------------------------//
		case "pawn trade":
			scr_text("What? You look surprised.", "piece");
			scr_text("Did you think because your pawns could only move forward that was the case for all pawns?", "piece");
			scr_text("Tsk tsk, you poor naive creature. I pity you.", "piece");
			scr_text("As a token of good will, let's trade a pawn each. That way you can have a piece of sophistication.", "piece");
			break;
			
		case "pawn trap":
			scr_text("HAHAHA YOU ABSOLUTE RUBE. YOU FOOL.", "piece");
			scr_text("You think ownership means anything in war?", "piece");
			scr_text("War is a battle of very strict, arbitrary laws of nature that cannot be opposed.", "piece");
			scr_text("The turn is mine, the pawn moves on my turn. Therefore it is I who moves the pawn, and now your queen is mine.", "piece");
			scr_text("Oh well, nothing one such as yourself could have done.", "piece");
			scr_text("Let this be a lesson to your future self to consider the consequences of your actions.", "piece");
			break;
			
		case "pawn wait":
			scr_text("It appears I did not consider the consequences of my actions.", "piece");
			scr_text("Alright let's trade for realsies.", "piece");
			oControl.alarm[1] = 5;
			break;
			
		//--------------------POST LEVEL 2-------------------------------//
		case "pawn rPostLevel2 0":
			scr_text("Did you see me out there? Did I do good?", "piece");
				scr_option("You did great!", "pawn - did great");
				scr_option("Which uh... which one were you?", "pawn - which one");
			break;
		case "pawn - did great":
			scr_text("Wowee, thank you!", "piece");
			audio_play_sound(snAccept, 0, false, 5);
			instance_create_layer(global.talker.x, global.talker.y, "Instances", oBond);
			break;
		case "pawn - which one":
			audio_play_sound(snAccept, 0, false, 5);
			scr_text("Wow. Just wow.", "piece");
			break;
		case "pawn rPostLevel2 1":
			scr_text("I'll try harder next time.", "piece");
			break;
		
		case "rook rPostLevel2 0":
			scr_text("I've heard rumours that in some countries castles don't move.", "piece");
			scr_text("That's crazy right?", "piece");
				scr_option("They don't", "rook - they don't");
				scr_option("That's Illuminati talk", "rook - illuminati");
			break;
		case "rook - they don't":
			scr_text("What does that make me then?", "piece");
			audio_play_sound(snAccept, 0, false, 5);
			break;
		case "rook - illuminati":
			scr_text("Exactly! It's as weird as pretending like triangles exist.", "piece");
				scr_text_color(42, 50, c_yellow, c_yellow, c_yellow, c_yellow);
			instance_create_layer(global.talker.x, global.talker.y, "Instances", oBond);
			audio_play_sound(snAccept, 0, false, 5);
			break;
		case "rook rPostLevel2 1":
			scr_text("I guess I'll just be sittin' here... not moving", "piece");
			break;
			
		case "bishop rPostLevel2 0":
			scr_text("As someone that only goes in diagonals, these corners bother me.", "piece");
			scr_text("Was putting in connect pieces really that much of a hassle?", "piece");
				scr_option("Yes", "bishop - yes");
				scr_option("No", "bishop - no");
			break;
		case "bishop - yes":
			scr_text("SO YOU'RE THE HEATHEN RESPONSIBLE!", "piece");
			audio_play_sound(snAccept, 0, false, 5);
			break;
		case "bishop - no":
			scr_text("Right? It couldn't be. So I wonder why...", "piece");
			instance_create_layer(global.talker.x, global.talker.y, "Instances", oBond);
			audio_play_sound(snAccept, 0, false, 5);
			break;
		case "bishop rPostLevel2 1":
			scr_text("...", "piece");
			break;
			
		case "knight rPostLevel2 0":
			scr_text("...", "horse");
				scr_option("...", "knight - ...");
				scr_option("...", "knight - ...");
			break;
		case "knight - ...":
			scr_text("...", "horse");
			audio_play_sound(snAccept, 0, false, 5);
			scr_text("(You get the impression you cannot date a horse)");
			break;
		case "knight rPostLevel2 1":
			scr_text("(Rejection hurts)");
			break;
			
		case "queen rPostLevel2 0":
			scr_text("Our next opponent seems to be quite the warmongerer.", "piece");
			scr_text("They have many enemies who have been slighted past the point of reason.", "piece");
			scr_text("I hope that doesn't become a problematic variable...", "piece");
				scr_option("It won't", "queen - won't");
				scr_option("I'll keep an eye out", "queen - eye out");
			break;
		case "queen - won't":
			scr_text("Right. Dismiss problems the rest of us will have to clean up.", "piece");
			audio_play_sound(snAccept, 0, false, 5);
			break;
		case "queen - eye out":
			scr_text("Good, I appreciate you taking counsel.", "piece");
			instance_create_layer(global.talker.x, global.talker.y, "Instances", oBond);
			audio_play_sound(snAccept, 0, false, 5);
			break;
		case "queen rPostLevel2 1":
			scr_text("Thank you for that.", "piece");
			break;
		
		//------------------------POST GAME-------------------------------//
		case "me rPostGame 0":
			scr_text("Sorry, that's actually all I have done so far.", "blue npc");
			scr_text("Thanks for playing my game, I hope it brought you a smile.", "blue npc happy");
			scr_text("Of course the game is pretty short, in no small part because the AI moves randomly.", "blue npc");
			scr_text("So you can usually beat the level within 3-4 moves if you're trying to.", "blue npc");
			scr_text("But that's okay. It was still worth doing.", "blue npc");
			scr_text("Would you like to hear about the game and process? Or would you like to close the game?", "blue npc");
			scr_text("Don't worry, this whole dialogue tree takes very little effort.", "blue npc");
				scr_option("Listen", "listen 0");
				scr_option("Exit", "exit - yes");
			break;
			
		case "listen 0":
			instance_create_layer(global.talker.x, global.talker.y, "Instances", oBond);
			audio_play_sound(snBackgroundMusic, 0, true, 0.1);
			audio_play_sound(snAccept, 0, false, 5);
			scr_text("The idea of the game was Chess with compounding mechanics with every level.", "blue npc");
			scr_text("Usually with some kind of punchline.", "blue npc");
			scr_text("Before the first level up you have basically normal chess with a little cutscene.", "blue npc");
			scr_text("Then it's Chess with F*re Embl*m type strategy.", "blue npc");
			scr_text("Then we MIGHT AS WELL add in bonds and a dating sim element.", "blue npc happy");
			scr_text("In discussion this was lovingly referred to as 'Chess with ***.'", "blue npc happy");
				scr_option("Keep listening", "listen 1");
				scr_option("Exit", "exit - yes");
			break;
		case "listen 1":
			instance_create_layer(global.talker.x, global.talker.y, "Instances", oBond);
			audio_play_sound(snAccept, 0, false, 5);
			scr_text("Level 2 introduces the idea of new pieces and movement types.", "blue npc");
			scr_text("Originally it was supposed to be whenever you took a piece your unit would GAIN the movement/attack of the taken piece", "blue npc");
			scr_text("Which later kind of morphed into eventual class upgrades that included unique movement and mechanics.", "blue npc");
			scr_text("Knight? More like Dragon Knight. Yes please.", "blue npc happy");
			scr_text("(The horse rides a dragon)", "blue npc");
			if !global.betrayal
			{	scr_text("Fun fact: You didn't run into it, but while the opponent is regretting their decisions, you can click on their King to immediately win while they're talking.", "blue npc");
			} else
			{	scr_text("Out of curiousity; when you took the king (or bishop) while they were talking, did you expect it to work?", "blue npc");
				scr_text("Or was it more of a 'NO TAKSIES BACKSIES'? Also could have been a missclick I suppose.", "blue npc");
				scr_text("If it was I bet suddenly attacking was a bit confusing.", "blue npc happy");
			};
			scr_text("Betcha didn't think the dialogue could know that did ya?", "blue npc");
				scr_option("Keep listening", "listen 2");
				scr_option("Exit", "exit - yes");
			break;
		case "listen 2":
			instance_create_layer(global.talker.x, global.talker.y, "Instances", oBond);
			audio_play_sound(snAccept, 0, false, 5);
			scr_text("Level 3 was a ménage à trois... Apparently French characters don't work... Anyways halfway through the level a red team would show up with more board and attack everything in sight.", "blue npc");
			scr_text("That was going to be an absolute nightmare to build.", "blue npc angry");
			scr_text("Even just adding in the board and stuff, the entire game is built around the current sizes.", "blue npc");
			scr_text("But it would be extremely funny!", "blue npc happy");
			scr_text("Especially once I got the banter going between the two NPC's", "blue npc");
			scr_text("Was going to be 'I attack the moon' level of over the top and silly.", "blue npc happy");
				scr_option("Keep listening", "listen 3");
				scr_option("Exit", "exit - yes");
			break;
		case "listen 3":
			instance_create_layer(global.talker.x, global.talker.y, "Instances", oBond);
			audio_play_sound(snAccept, 0, false, 5);
			scr_text("Level 4 was the last one I really had any sort of plan for.", "blue npc");
			scr_text("And it was based entirely around the punchline of 'Castles don't move, idiot.'", "blue npc happy");
			scr_text("Enemy rooks were going to be immobile fortresses that they could hide pieces inside of.", "blue npc");
			scr_text("You'd have to break down the fortress before you could get at anything inside.", "blue npc");
			scr_text("Of course when you moved YOUR rook they would like lose their mind at the insanity of you yeeting a castle across the field.", "blue npc happy");
			scr_text("But it turns out just building regular Chess took almost half the entire game jam.", "blue npc");
			scr_text("MORE than half if you include adding in AI, however terrible it may be.", "blue npc angry");
			scr_text("(I had to completely throw out and rebuild the movement/attack system at least 4 times before I could get the AI to actually make use of it)", "blue npc angry");
			scr_text("So I didn't end up making it that far content wise.", "blue npc");
				scr_option("Keep listening", "listen 4");
				scr_option("Exit", "exit - yes");
			break;
		case "listen 4":
			instance_create_layer(global.talker.x, global.talker.y, "Instances", oBond);
			audio_play_sound(snAccept, 0, false, 5);
			scr_text("Overall the project was a lot of fun though.", "blue npc happy");
			scr_text("And I'm proud of how many bits of mechanics and QoL stuff I was able to add.", "blue npc happy");
			scr_text("Now it's time for me to get back to my personal project.", "blue npc");
			scr_text("A short rpg (that I basically just ripped the dialogue system out of for this) about a ghost who can't move on until they resolve their lingering issues.", "blue npc");
			scr_text("While also having no memories of who they are or what issues they may have.", "death");
			scr_text("Kind of a puzzle mystery, mostly an introspective. Will hopefully be finished and released in September.", "blue npc");
			scr_text("In the mean time; thanks for playing!", "blue npc happy");
			scr_text("See you next time.", "blue npc happy");
			break;
			
		case "me rPostGame 1":
			scr_text("Exit?", "piece");
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
			scr_text("The ! in 'Chess!' is actually 'Factorial'. Not just a general exuberation for Chess.", "piece");
	}
}