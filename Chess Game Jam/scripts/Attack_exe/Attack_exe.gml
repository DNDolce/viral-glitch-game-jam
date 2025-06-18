// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Attack_exe(_attacker, _defender){
	show_debug_message(battle_step);
	/*STEPS:
	1.  Check if attack object is being selected	(Done prior to script)
		 -> Left click oAttack for player
		 -> [insert variable] check for AI
	2.  Determine Attacker and Defender				(Done Prior to script)
		 -> global.held_piece				= Attacker
		 -> oPiece with same x,y as oAttack	= Defender
	3.  Draw auxillery sprites
		 -> Rectangular arena
		 -> Health bars
		 -> Attacker/Defender sprites
	4.  Loop micro-movements until battlers are in position
	 	 -> ( 36, 32) Attacker
	 	 -> (140, 32) Defender
	5.  Check for pre-battle dialogue prompts
	6.  Draw first attack animation
	7.  Draw text and draw damage dealt, hold for short delay
	8.  If Defender dies - skip to 13
	9/10.  Repeat 6 + 7 for Defender attack
	11. If neither unit dies - loop micro movements until battlers return to initial positions
		 -> Skip to 17
	12. If Attacker dies - destroy Attacker & return Defender to initial position
	13. If Defender dies - destroy Defender & move Attacker to Defender's initial position
	14. Draw exp bar and display gained exp, hold for short delay
	15. If exp >= max exp - randomly grant stat increases within a range
		 -> Otherwise skip to 17
	16. Draw level up UI and display stat changes, hold for short delay
	17. Check for post-battle dialogue prompts
	18. Destroy attack and indicator objects
	19. Change turns
	*/

	//3. Draw auxillery sprites
	if  battle_step >= 3
	and battle_step <  11
	{	show_debug_message(battle_step);
		//-> Rectangular arena
		draw_sprite(sBattleScene, 0, 0, 0);
		//-> Health bars
		draw_healthbar(20, 4, 72, 8, _attacker.hp, c_white, c_red, c_red, 0, false, true);
		draw_healthbar(120, 4, 172, 8, _defender.hp, c_white, c_red, c_red, 0, false, true);
		//-> Attacker/Defender sprites
		if _attacker.hp > 0
		{	draw_sprite(_attacker.sprite_index, _attacker.image_index, _attacker.x, _attacker.y);
		};
		if _defender.hp > 0
		{	draw_sprite(_defender.sprite_index, _defender.image_index, _defender.x, _defender.y);
		};
		if battle_step == 3
		{	battle_step++;
			audio_play_sound(snAtkPiece, 0, false, 20);
		};
	};
	//4. Loop micro-movements until battlers are in position
	if battle_step == 4
	{	show_debug_message(battle_step);
		var _end = false;
		//-> ( 36, 32) Attacker
		if _attacker.x != 36
		or _attacker.y != 32
		{	with _attacker
			{	move_towards_point(36, _attacker.y, 2);
				move_towards_point(_attacker.x, 32, 2);
				_attacker.x = round(_attacker.x);
				_attacker.y = round(_attacker.y);
			};
		} else
		{	_attacker.speed = 0;
			_attacker.visible = false;
			_end = true;
		};
		//-> (140, 32) Defender
		if _defender.x != 140
		or _defender.y != 32
		{	with _defender
			{	move_towards_point(_defender.x, 32, 2);
				move_towards_point(140, _defender.y, 2);
				_defender.x = round(_defender.x);
				_defender.y = round(_defender.y);
			};
		} else 
		{	_defender.speed = 0;
			_defender.visible = false;
			if _end == true
			{	battle_step++;
			};
		};
	};
	//5. Check for pre-battle dialogue prompts
	if battle_step == 5
	{	show_debug_message(battle_step);
		battle_step++;
	};
	//6. Draw first attack animation
	if battle_step == 6
	{	show_debug_message(battle_step);
		if anim_frame == 0
		{	audio_play_sound(snAttack, 0, false);
		};
		if anim_frame < 8
		{	draw_sprite(sAttackAnim, clamp(round(anim_frame), 0, 7), _defender.x, _defender.y);
			anim_frame += 0.25;
		} else
		{	battle_step++;
			anim_frame = 0;
		};
	};
	//7. Draw text and draw damage dealt, hold for short delay
	if battle_step == 7
	{	show_debug_message(battle_step);
		draw_set_font(fn_start_menu_1);
		draw_set_color(c_red);
		draw_set_halign(fa_left);
		draw_text(_defender.x, _defender.y, string(_attacker.dmg - _defender.def));
		if !alarm[0]
		{	_defender.hp -= _attacker.dmg - _defender.def;
			alarm[0] = 30; //batle_step++
		};
	};
	//8. If Defender dies - skip to 13
	if battle_step == 8
	{	show_debug_message(battle_step);
		_attacker.visible = true;
		if _defender.hp <= 0
		{	battle_step = 13;
		} else
		{	battle_step++;
		};
	};
	//9/10. Repeat 6 + 7 for Defender attack
	//6. Draw second attack animation
	if battle_step == 9
	{	show_debug_message(battle_step);
		if anim_frame == 0
		{	audio_play_sound(snAttack, 0, false);
		};
		if anim_frame < 8
		{	draw_sprite_ext(sAttackAnim, clamp(round(anim_frame), 0, 7), 
							_attacker.x + 16, _attacker.y,
							-1, 1, 0, c_white, 1);
			anim_frame += 0.25;
		} else
		{	battle_step++;
		};
	};
	//7. Draw text and draw damage dealt, hold for short delay
	if battle_step == 10
	{	show_debug_message(battle_step);
		draw_set_font(fn_start_menu_1);
		draw_set_color(c_red);
		draw_set_halign(fa_right);
		draw_text(_attacker.x + 16, _attacker.y, string(_defender.dmg - _attacker.def));
		if !alarm[0]
		{	_attacker.hp -= _defender.dmg - _attacker.def;
			alarm[0] = 30; //batle_step++
		};	
	};
	//11. If neither unit dies - loop micro movements until battlers return to initial positions
	//	 -> Skip to 17
	if battle_step == 11
	{	show_debug_message(battle_step);
		_attacker.visible = true;
		_defender.visible = true;
		if _attacker.hp <= 0
		{	battle_step++;
			exit;
		};
		var _end = false;
		if _attacker.x != _attacker.prev_x
		or _attacker.y != _attacker.prev_y
		{	with _attacker
			{	move_towards_point(_attacker.prev_x, _attacker.y, 2);
				move_towards_point(_attacker.x, _attacker.prev_y, 2);
				_attacker.x = round(_attacker.x);
				_attacker.y = round(_attacker.y);
			};
		} else
		{	_attacker.speed = 0;
			_end = true;
		};
		if _defender.x != _defender.prev_x
		or _defender.y != _defender.prev_y
		{	with _defender
			{	move_towards_point(_defender.prev_x, _defender.y, 2);
				move_towards_point(_defender.x, _defender.prev_y, 2);
				_defender.x = round(_defender.x);
				_defender.y = round(_defender.y);
			};
		} else if _end == true
		{	_defender.speed = 0;
			battle_step = 17;
		};
	};
	//12. If Attacker dies - destroy Attacker & return Defender to initial position
	if battle_step == 12
	{	show_debug_message(battle_step);
		_defender.visible = true;
		if instance_exists(_attacker)
		{	if _attacker.hp > 0
			{	battle_step++;
				exit;
			};
			instance_destroy(_attacker);
			attacker = noone;
			_attacker = noone;
		};
		if _defender.x != _defender.prev_x
		or _defender.y != _defender.prev_y
		{	with _defender
			{	move_towards_point(_defender.prev_x, _defender.y, 2);
				move_towards_point(_defender.x, _defender.prev_y, 2);
				_defender.x = round(_defender.x);
				_defender.y = round(_defender.y);
			};
		} else
		{	_defender.speed = 0;
			battle_step = 14;
		};
	};
	//13. If Defender dies - destroy Defender & move Attacker to Defender's initial position
	if battle_step == 13
	{	show_debug_message(battle_step);
		if _attacker.x != _defender.prev_x
		or _attacker.y != _defender.prev_y
		{	with _attacker
			{	move_towards_point(_defender.prev_x, _attacker.y, 2);
				move_towards_point(_attacker.x, _defender.prev_y, 2);
				_attacker.x = round(_attacker.x);
				_attacker.y = round(_attacker.y);
			};
		} else
		{	instance_destroy(_defender);
			_defender = noone;
			defender = noone;
			_attacker.speed = 0;
			_attacker.moved = true;
			battle_step++;
		};
	};
	//14. Draw exp bar and display gained exp, hold for short delay
	if battle_step == 14
	{	show_debug_message(battle_step);
		var _winner = noone;
		if _attacker == noone
		{	_winner = _defender;
		} else
		{	_winner = _attacker;
		};
		if !alarm[0]
		{	instance_create_layer(center_pos, center_pos, "Instances", oExpBar, {caller : _winner});
			alarm[0] = 30; //battle_step++;
		};
	};
	//15. If exp >= max exp - randomly grant stat increases within a range
	if battle_step == 15
	{	show_debug_message(battle_step);
		battle_step++;
		//	 -> Otherwise skip to 17
	};
	//16. Draw level up UI and display stat changes, hold for short delay
	if battle_step == 16
	{	show_debug_message(battle_step);
		battle_step++;
	};
	//17. Check for post-battle dialogue prompts
	if battle_step == 17
	{	show_debug_message(battle_step);
		battle_step++;
	};
	//18. Destroy attack and indicator objects
	if battle_step == 18
	{	show_debug_message(battle_step);
		global.attack_spot = noone;
		global.held_piece = noone;
		global.stop_all = false;
		//19. Change turns
		if oControl.turn == 0
		{	oControl.turn++;
		} else
		{	oControl.turn = 0;
		};
		oControl.first_attack = true;
		oControl.turns_passed++;
		instance_destroy(oAttack);
		instance_destroy(oIndicator);
	};

//end
};