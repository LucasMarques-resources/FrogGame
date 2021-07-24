/// @description Insert description here
// You can write your code in this editor
x = mouse_x;
y = mouse_y;

switch (global.currentGun.typeGun)
{
	// Normal
	default:
		sprite_index = sAim;
	break;
	// Shotgun
	case GUN_TYPES.shotgun:
		sprite_index = sAimShotgun;
	break;
}