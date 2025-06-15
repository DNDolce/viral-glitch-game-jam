draw_self();


//highlight selected piece
if global.held_piece == id
	draw_sprite(sIndicator, 2, prev_x, prev_y);

//NOTE: this section has the most potential to be simplified
//		but it works pretty well so not a priority

//highlight valid moves
//(does not account for knights)
if	global.held_piece == id
and instance_number(oIndicator) == 0
and instance_number(oAttack) == 0
{	var _column = (prev_x - 32) / 16;
	var _row	= (prev_y - 32) / 16;
	
	//UPLR
	for (var n = 0; n < clamp(move_up[0], 0, _row); n++)
	{	instance_create_layer(prev_x, prev_y - tile_h * (n + 1), 
			"Instances", oIndicator, {image_index : 0})
	};
	
	for (var n = 0; n < clamp(move_down[0], 0, 7 - _row); n++)
	{	instance_create_layer(prev_x, prev_y + tile_h * (n + 1), 
			"Instances", oIndicator, {image_index : 0})
	};
	
	for (var n = 0; n < clamp(move_left[0], 0, _column); n++)
	{	instance_create_layer(prev_x - tile_w * (n + 1), prev_y, 
			"Instances", oIndicator, {image_index : 0})
	}; 
	
	for (var n = 0; n < clamp(move_right[0], 0, 7 - _column); n++)
	{	instance_create_layer(prev_x + tile_w * (n + 1), prev_y, 
			"Instances", oIndicator, {image_index : 0})
	}; 
	
	//diagonal 
	for (var n = 0; n < clamp(move_up_diag[0], 0, 7); n++)
	{	if  prev_x - tile_w * (n + 1) >= 32
		and prev_y - tile_h * (n + 1) >= 32
			instance_create_layer(prev_x - tile_w * (n + 1), prev_y - tile_h * (n + 1), 
				"Instances", oIndicator, {image_index : 0})
		if  prev_x + tile_w * (n + 1) <= 144
		and prev_y - tile_h * (n + 1) >= 32
			instance_create_layer(prev_x + tile_w * (n + 1), prev_y - tile_h * (n + 1), 
				"Instances", oIndicator, {image_index : 0})
	}; 
	
	for (var n = 0; n < clamp(move_down_diag[0], 0, 7); n++)
	{	if  prev_x - tile_w * (n + 1) >= 32
		and prev_y + tile_h * (n + 1) <= 144
			instance_create_layer(prev_x - tile_w * (n + 1), prev_y + tile_h * (n + 1), 
				"Instances", oIndicator, {image_index : 0})
		if  prev_x + tile_w * (n + 1) <= 144
		and prev_y + tile_h * (n + 1) <= 144
			instance_create_layer(prev_x + tile_w * (n + 1), prev_y + tile_h * (n + 1), 
			"Instances", oIndicator, {image_index : 0})
	}; 
	
	//pawn attacks
	if piece == "pawn"
	{	if move_up_diag[1] != 0
		{	//take the nearest piece to the viable attack squares
			var _target_left = instance_nearest(prev_x - tile_w, prev_y - tile_h, oPiece);
			//nearest =/= in that spot, make sure it's in THAT spot
			//and the piece is an opponent's
			if  _target_left.x == prev_x - tile_w 
			and _target_left.y == prev_y - tile_h
			and _target_left.team != oControl.turn
				instance_create_layer(prev_x - tile_w, prev_y - tile_h, 
					"Instances", oAttack, {image_index : 1, depth : -1});
			var _target_right = instance_nearest(prev_x + tile_w, prev_y - tile_h, oPiece);
			if  _target_right.x == prev_x + tile_w 
			and _target_right.y == prev_y - tile_h
			and _target_right.team != oControl.turn
				instance_create_layer(prev_x + tile_w, prev_y - tile_h, 
					"Instances", oAttack, {image_index : 1, depth : -1});
		};
		
		if move_down_diag[1] != 0
		{	var _target_left = instance_nearest(prev_x - tile_w, prev_y + tile_h, oPiece);
			if  _target_left.x == prev_x - tile_w 
			and _target_left.y == prev_y + tile_h
			and _target_left.team != oControl.turn
				instance_create_layer(prev_x - tile_w, prev_y + tile_h, 
					"Instances", oAttack, {image_index : 1, depth : -1});
			var _target_right = instance_nearest(prev_x + tile_w, prev_y + tile_h, oPiece);
			if  _target_right.x == prev_x + tile_w 
			and _target_right.y == prev_y + tile_h
			and _target_right.team != oControl.turn
				instance_create_layer(prev_x + tile_w, prev_y + tile_h, 
					"Instances", oAttack, {image_index : 1, depth : -1});
		};
	};
	
	//inverted pawn attack
	if piece == "pawn inverse"
	{	if move_down[1] != 0
		{	var _target = instance_nearest(prev_x, prev_y + tile_h, oPiece);
			if  _target.x == prev_x
			and _target.y == prev_y + tile_h
			and _target.team != oControl.turn
				instance_create_layer(prev_x, prev_y + tile_h,
					"Instances", oAttack, {image_index : 1, depth : -1});
		};
		
		if move_up[1] != 0
		{	var _target = instance_nearest(prev_x, prev_y - tile_h, oPiece);
			if  _target.x == prev_x
			and _target.y == prev_y - tile_h
			and _target.team != oControl.turn
				instance_create_layer(prev_x, prev_y - tile_h,
					"Instances", oAttack, {image_index : 1, depth : -1});
		};
	};
};