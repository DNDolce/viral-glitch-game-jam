if battle_start
{	draw_sprite(sBattleScene, 0, 0, 0);
	if attacker.hp >= 0
		draw_sprite(attacker.sprite_index, attacker.image_index, attacker.x, attacker.y);
	if defender.hp >= 0
		draw_sprite(defender.sprite_index, defender.image_index, defender.x, defender.y);
	draw_healthbar(20, 4, 72, 8, attacker.hp, c_white, c_red, c_red, 0, false, true);
	draw_healthbar(120, 4, 172, 8, defender.hp, c_white, c_red, c_red, 0, false, true);
} else
{	draw_self();
};

if anim_start
{	if anim_frame < 8
	{	if attack_num == 0
			draw_sprite(sAttackAnim, clamp(round(anim_frame), 0, 7), defender.x, defender.y);
		else
			draw_sprite_ext(sAttackAnim, clamp(round(anim_frame), 0, 7), attacker.x + 16, attacker.y,
				-1, 1, 0, c_white, 1);
		anim_frame += 0.25;
	} else
	{	anim_start = false;
		if attack_num == 0
		{	defender.hp -= attacker.dmg - defender.def;
			if defender.hp <= 0
			{	defender.visible = false;
			};
		} else
		{	attacker.hp -= defender.dmg - attacker.def;
			if attacker.hp <= 0
			{	attacker.visible = false;
			};
		};
		alarm[2] = 30;
	};
};

if alarm[2]
{	draw_set_font(fn_start_menu);
	if attack_num == 0
	{	draw_set_halign(fa_left);
		draw_text_color(defender.x, defender.y, string(attacker.dmg - defender.def), c_red, c_red, c_red, c_red, 1);

	} else
	{	draw_set_halign(fa_right);
		draw_text_color(attacker.x + 16, attacker.y, string(defender.dmg - attacker.def), c_red, c_red, c_red, c_red, 1);
	};
};