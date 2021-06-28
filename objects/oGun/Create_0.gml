/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

firingDelay = 0;
recoil = 0;
invulnerable = 0;
flash = 0;

velh = 0;
velv = 0;
grav = 0.3;

dropped = false;

typeGun = 0;
ownAmmo = 0;

switch (typeGun)
{
	case 0: ownAmmo = 30; break;
	case 1: ownAmmo = 10; break;
}