//ignore everything here if another piece is already selected
if	global.held_piece != id
and global.held_piece != noone
	exit;
//wait for stop to end
if global.stop_all
or instance_exists(oExpBar)
	exit;
	
//select piece
if	position_meeting(mouse_x, mouse_y, id)
and	mouse_check_button_pressed(mb_left)
and global.held_piece == noone
and team == 0
{	global.held_piece = id;
	prev_x = x;
	prev_y = y;
	audio_play_sound(snGrabPiece, 0, false);
};

//cancel selection
if mouse_check_button_pressed(mb_right)
{	global.held_piece = noone;
	instance_destroy(oAttack);
	instance_destroy(oIndicator);
};
if global.held_piece != id
or instance_exists(oIndicator)
or instance_exists(oAttack)
{	exit;
};

var _col = (x - 32) / 16;
var _row = (y - 32) / 16;
if  piece == "pawn"
{	if team == 0
	{	var _nearest = instance_nearest(x, y - tile_h, oPiece);
		if _nearest.x != x
		or _nearest.y != y - tile_h
		{	instance_create_layer(x+2, y+2 - tile_h, "Instances", oIndicator);
			if !moved
			{	_nearest = instance_nearest(x, y - tile_h * 2, oPiece);
				if _nearest.x != x
				or _nearest.y != y - tile_h * 2
				{	instance_create_layer(x+2, y+2 - tile_h * 2, "Instances", oIndicator);
				};
			};
		};
		_nearest = instance_nearest(x - tile_w, y - tile_h, oPiece);
		if  _nearest.x == x - tile_w
		and _nearest.y == y - tile_h
		and _nearest.team != team
		{	instance_create_layer(x+2 - tile_w, y+2 - tile_h, "Instances", oAttack);
		};
		_nearest = instance_nearest(x + tile_w, y - tile_h, oPiece);
		if  _nearest.x == x + tile_w
		and _nearest.y == y - tile_h
		and _nearest.team != team
		{	instance_create_layer(x+2 + tile_w, y+2 - tile_h, "Instances", oAttack);
		};
	};
	if team == 1
	{	var _nearest = instance_nearest(x, y + tile_h, oPiece);
		if _nearest.x != x
		or _nearest.y != y + tile_h
		{	instance_create_layer(x+2, y+2 + tile_h, "Instances", oIndicator);
			if !moved
			{	_nearest = instance_nearest(x, y + tile_h * 2, oPiece);
				if _nearest.x != x
				or _nearest.y != y + tile_h * 2
				{	instance_create_layer(x+2, y+2 + tile_h * 2, "Instances", oIndicator);
				};
			};
		};
		_nearest = instance_nearest(x - tile_w, y + tile_h, oPiece);
		if  _nearest.x == x - tile_w
		and _nearest.y == y + tile_h
		and _nearest.team != team
		{	instance_create_layer(x+2 - tile_w, y+2 + tile_h, "Instances", oAttack);
		};
		_nearest = instance_nearest(x + tile_w, y + tile_h, oPiece);
		if  _nearest.x == x + tile_w
		and _nearest.y == y + tile_h
		and _nearest.team != team
		{	instance_create_layer(x+2 + tile_w, y+2 + tile_h, "Instances", oAttack);
		};
	};
};
if  piece == "pawn inverse"
{	if team == 0
	{	var _nearest = instance_nearest(x - tile_w, y - tile_h, oPiece);
		if  _nearest.x != x -  tile_w 
		or _nearest.y != y - tile_h
		{	instance_create_layer(x+2 - tile_w, y+2 - tile_h, "Instances", oIndicator);
			if !moved
			{	_nearest = instance_nearest(x - tile_w * 2, y - tile_h * 2, oPiece);
				if _nearest.x != x - tile_w * 2
				or _nearest.y != y - tile_h * 2
				{	instance_create_layer(x+2 - tile_w * 2, y+2 - tile_h * 2, "Instances", oIndicator);
				};
			};
		};
		_nearest = instance_nearest(x + tile_w, y - tile_h, oPiece);
		if  _nearest.x != x + tile_w 
		or _nearest.y != y - tile_h
		{	instance_create_layer(x+2 + tile_w, y+2 - tile_h, "Instances", oIndicator);
			if !moved
			{	_nearest = instance_nearest(x + tile_w * 2, y - tile_h * 2, oPiece);
				if _nearest.x != x + tile_w * 2
				or _nearest.y != y - tile_h * 2
				{	instance_create_layer(x+2 + tile_w * 2, y+2 - tile_h * 2, "Instances", oIndicator);
				};
			};
		};
		_nearest = instance_nearest(x, y - tile_h, oPiece);
		if  _nearest.x == x
		and _nearest.y == y - tile_h
		and _nearest.team != team
		{	instance_create_layer(x+2, y+2 - tile_h, "Instances", oAttack);
		};
	};
	if team == 1
	{	var _nearest = instance_nearest(x - tile_w, y + tile_h, oPiece);
		if  _nearest.x != x -  tile_w 
		or _nearest.y != y + tile_h
		{	instance_create_layer(x+2 - tile_w, y+2 + tile_h, "Instances", oIndicator);
			if !moved
			{	_nearest = instance_nearest(x - tile_w * 2, y + tile_h * 2, oPiece);
				if _nearest.x != x - tile_w * 2
				or _nearest.y != y + tile_h * 2
				{	instance_create_layer(x+2 - tile_w * 2, y+2 + tile_h * 2, "Instances", oIndicator);
				};
			};
		};
		_nearest = instance_nearest(x + tile_w, y + tile_h, oPiece);
		if  _nearest.x != x + tile_w 
		or _nearest.y != y + tile_h
		{	instance_create_layer(x+2 + tile_w, y+2 + tile_h, "Instances", oIndicator);
			if !moved
			{	_nearest = instance_nearest(x + tile_w * 2, y + tile_h * 2, oPiece);
				if _nearest.x != x + tile_w * 2
				or _nearest.y != y + tile_h * 2
				{	instance_create_layer(x+2 + tile_w * 2, y+2 + tile_h * 2, "Instances", oIndicator);
				};
			};
		};
		_nearest = instance_nearest(x, y + tile_h, oPiece);
		if  _nearest.x == x
		and _nearest.y == y + tile_h
		and _nearest.team != team
		{	instance_create_layer(x+2, y+2 + tile_h, "Instances", oAttack);
		};
	};
};
if piece == "rook"
or piece == "queen"
or piece == "king"
{	for (var u = 0; u < _row; u++)
	{	if piece == "king" && u > 0
		{	break;
		};
		var _nearest = instance_nearest(x, y - (u+1) * tile_h, oPiece);
		if _nearest.x == x 
		and _nearest.y == y - (u+1) * tile_h
		{	if _nearest.team != team
			{	instance_create_layer(x+2, y+2 - (u+1) * tile_h, "Instances", oAttack);
			};
			break;
		} else
		{	instance_create_layer(x+2, y+2 - (u+1) * tile_h, "Instances", oIndicator);
		};
	};
	
	for (var d = 0; d < 7 - _row; d++)
	{	if piece == "king" && d > 0
		{	break;
		};
		var _nearest = instance_nearest(x, y + (d+1) * tile_h, oPiece);
		if _nearest.x == x 
		and _nearest.y == y + (d+1) * tile_h
		{	if _nearest.team != team
			{	instance_create_layer(x+2, y+2 + (d+1) * tile_h, "Instances", oAttack);
			};
			break;
		} else
		{	instance_create_layer(x+2, y+2 + (d+1) * tile_h, "Instances", oIndicator);
		};
	};
	
	for (var l = 0; l < _col; l++)
	{	if piece == "king" && l > 0
		{	break;
		};
		var _nearest = instance_nearest(x - (l+1) * tile_w, y, oPiece);
		if _nearest.x == x - (l+1) * tile_w
		and _nearest.y == y 
		{	if _nearest.team != team
			{	instance_create_layer(x+2 - (l+1) * tile_w, y+2, "Instances", oAttack);
			};
			break;
		} else
		{	instance_create_layer(x+2 - (l+1) * tile_w, y+2, "Instances", oIndicator);
		};
	};
	
	for (var r = 0; r < 7 - _col; r++)
	{	if piece == "king" && r > 0
		{	break;
		};
		var _nearest = instance_nearest(x + (r+1) * tile_w, y, oPiece);
		if _nearest.x == x + (r+1) * tile_w
		and _nearest.y == y 
		{	if _nearest.team != team
			{	instance_create_layer(x+2 + (r+1) * tile_w, y+2, "Instances", oAttack);
			};
			break;
		} else
		{	instance_create_layer(x+2 + (r+1) * tile_w, y+2, "Instances", oIndicator);
		};
	};
};
if piece == "bishop"
or piece == "queen"
or piece == "king"
{	for (var ul = 0; ul < min(_row, _col); ul++)
	{	if piece == "king" && ul > 0
		{	break;
		};
		var _nearest = instance_nearest(x - (ul+1) * tile_w, y - (ul+1) * tile_h, oPiece);
		if _nearest.x == x - (ul+1) * tile_w 
		and _nearest.y == y - (ul+1) * tile_h
		{	if _nearest.team != team
			{	instance_create_layer(x+2 - (ul+1) * tile_w, y+2 - (ul+1) * tile_h, "Instances", oAttack);
			};
			break;
		} else
		{	instance_create_layer(x+2 - (ul+1) * tile_w, y+2 - (ul+1) * tile_h, "Instances", oIndicator);
		};
	};
	
	for (var ur = 0; ur < min(_row, 7 - _col); ur++)
	{	if piece == "king" && ur > 0
		{	break;
		};
		var _nearest = instance_nearest(x + (ur+1) * tile_w, y - (ur+1) * tile_h, oPiece);
		if _nearest.x == x + (ur+1) * tile_w 
		and _nearest.y == y - (ur+1) * tile_h
		{	if _nearest.team != team
			{	instance_create_layer(x+2 + (ur+1) * tile_w, y+2 - (ur+1) * tile_h, "Instances", oAttack);
			};
			break;
		} else
		{	instance_create_layer(x+2 + (ur+1) * tile_w, y+2 - (ur+1) * tile_h, "Instances", oIndicator);
		};
	};
	
	for (var dl = 0; dl < min(7 - _row, _col); dl++)
	{	if piece == "king" && dl > 0
		{	break;
		};
		var _nearest = instance_nearest(x - (dl+1) * tile_w, y + (dl+1) * tile_h, oPiece);
		if _nearest.x == x - (dl+1) * tile_w 
		and _nearest.y == y + (dl+1) * tile_h
		{	if _nearest.team != team
			{	instance_create_layer(x+2 - (dl+1) * tile_w, y+2 + (dl+1) * tile_h, "Instances", oAttack);
			};
			break;
		} else
		{	instance_create_layer(x+2 - (dl+1) * tile_w, y+2 + (dl+1) * tile_h, "Instances", oIndicator);
		};
	};
	
	for (var dr = 0; dr < min(7 - _row, 7 - _col); dr++)
	{	if piece == "king" && dr > 0
		{	break;
		};
		var _nearest = instance_nearest(x + (dr+1) * tile_w, y + (dr+1) * tile_h, oPiece);
		if _nearest.x == x + (dr+1) * tile_w 
		and _nearest.y == y + (dr+1) * tile_h
		{	if _nearest.team != team
			{	instance_create_layer(x+2 + (dr+1) * tile_w, y+2 + (dr+1) * tile_h, "Instances", oAttack);
			};
			break;
		} else
		{	instance_create_layer(x+2 + (dr+1) * tile_w, y+2 + (dr+1) * tile_h, "Instances", oIndicator);
		};
	};
}

if (piece == "knight") {
	var k_moves = [[-2,-1], [-1,-2], [-2,1], [-1,2], [1,-2], [2,-1], [1,2], [2,1]]

	for (var j = 0; j < array_length(k_moves); j++){
		if (OnBoard(x + k_moves[j][0]*16, y + k_moves[j][1]*16)){
			var _nearest = instance_nearest(x + k_moves[j][0]*16, y + k_moves[j][1]*16, oPiece);
			
			if (_nearest.x == x + k_moves[j][0]*16 && _nearest.y == y + k_moves[j][1]*16){
				if _nearest.team != team {
					instance_create_layer(x+2 + k_moves[j][0]*16, y+2 + k_moves[j][1]*16, "Instances", oAttack)
				}

			}
			else {
				instance_create_layer(x+2 + k_moves[j][0]*16, y+2 + k_moves[j][1]*16, "Instances", oIndicator)
			}
		}
	}
};

