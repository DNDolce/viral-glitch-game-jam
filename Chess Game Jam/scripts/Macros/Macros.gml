#macro tile_w		16
#macro tile_h		16
global.board		= ds_grid_create(8, 8); //default chess board
global.held_piece	= noone;
enum tile
{	SPRITE,
	Z
}