/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

textCrea = true;
textObj = noone;

itemOwnAmmo = 40;

pickUpGun = false;

velh = 0;
velv = 0;

yStart = y;

grav = .3;

// Ammo
switch (typeItem)
{
	case GUN_TYPES.rifle: itemOwnAmmo = 30; break; // Rifle
	case GUN_TYPES.fire: itemOwnAmmo = 10; break; // Fire
	case GUN_TYPES.shotgun: itemOwnAmmo = 600; break;  // Shotgun
	case GUN_TYPES.nadeLauncher: itemOwnAmmo = 5; break;  // Grenade launcher
	case GUN_TYPES.machineGun: itemOwnAmmo = 3000; break;  // MachineGun
	case GUN_TYPES.sniper: itemOwnAmmo = 5; break;  // Sniper
	case GUN_TYPES.thunder: itemOwnAmmo = 10; break;  // Thunder gun
}