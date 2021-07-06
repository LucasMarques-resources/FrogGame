/// @description Insert description here
// You can write your code in this editor
x = mouse_x;
y = mouse_y;

switch (global.currentGun.typeGun)
{
	// Normal
	case 0:
		sprite_index = sAim;
	break;
	// Gun
	case 1:
		sprite_index = sAim;
	break;
	// Shotgun
	case 2:
		sprite_index = sAimShotgun;
	break;
}