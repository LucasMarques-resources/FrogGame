/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

enum TYPES
{
	normal,
	fire,
	shotgun,
	nadeLauncher
}

activate = true;
textCrea = true;
textObj = noone;

itemOwnAmmo = 40;

pickUpGun = false;

velh = 0;
velv = 0;

yStart = y;

grav = 0.3;

switch (typeItem)
{
	case 0: itemOwnAmmo = 30; break; // Normal
	case 1: itemOwnAmmo = 10; break; // Fire
	case 2: itemOwnAmmo = 600; break;  // Shotgun
	case 3: itemOwnAmmo = 5; break;  // Grenade launcher
}