//if this indicator is the only valid move and it is destroyed
//there are no valid moves for the held piece (so put it down)
if instance_number(oIndicator) == 1
	global.held_piece = noone;