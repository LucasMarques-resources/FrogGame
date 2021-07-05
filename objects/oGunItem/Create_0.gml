/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

enum TYPES
{
	normal,
	fire,
	shotgun
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
	case 0: itemOwnAmmo = 30; break;
	case 1: itemOwnAmmo = 10; break;
	case 2: itemOwnAmmo = 6; break;
}