/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

firingDelay = 0;

recoil = 0;
invulnerable = 0;
flash = 0;
controllerAngle = 0;

velh = 0;
velv = 0;
grav = 0.3;
tridentSetNormalPos = true;

typeGun = 0;
ownAmmo = 0;

sniperBulletRange = 150;
sniperRaycastChecked = false;
sniperRaycastCheckedX = 0;
sniperRaycastCheckedY = 0;

// Trident
createTrident = false;

// Updating image angle and postion
if (instance_exists(oFrog) && global.hasGun && !oFrog.controller)
{
	x = oFrog.x;
	y = oFrog.y - 6;
	
	image_angle = point_direction(x, y, mouse_x, mouse_y);
}

//drawInitialBulletSprite = false;

// Number of bullets particle object to create
bulletsShootedNumb = 1;

// Change de sprite depending on the type
image_index = typeGun;