/// @description 
if  mouse_check_button_pressed(mb_left)
and position_meeting(mouse_x, mouse_y, id)
and global.held_piece != noone
{	Move_exe();
};