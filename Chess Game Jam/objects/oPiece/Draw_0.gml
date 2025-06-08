draw_self();
//highlight selected piece
if global.held_piece == id
	draw_sprite(sIndicator, 2, x, y);

//NOTE: this section has the most potential to be simplified
//		but it works pretty well so not a priority

//highlight valid moves
//(does not account for knights)
if	global.held_piece == id
and !instance_exists(oIndicator)
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
};