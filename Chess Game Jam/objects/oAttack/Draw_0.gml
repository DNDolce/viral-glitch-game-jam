/// @description 
if global.attack_spot == id
{	Attack_exe(attacker, defender);
};
if global.stop_all
or instance_exists(oExpBar)
{	exit;
};
draw_self();