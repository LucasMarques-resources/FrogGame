/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

firingDelay = 0;
#region FIRING DELAY ARRAY
firingDelayArray = array_create(GUN_TYPES.total - 1, -1);
firingDelayArray[GUN_TYPES.none] = 0;
firingDelayArray[GUN_TYPES.rifle] = 10;
firingDelayArray[GUN_TYPES.fire] = 17;
firingDelayArray[GUN_TYPES.shotgun] = 20;
firingDelayArray[GUN_TYPES.nadeLauncher] = 40;
firingDelayArray[GUN_TYPES.machineGun] = 7;
firingDelayArray[GUN_TYPES.sniper] = 50;
firingDelayArray[GUN_TYPES.thunder] = 70;
#endregion

recoil = 0;
invulnerable = 0;
flash = 0;

velh = 0;
velv = 0;
grav = 0.3;

typeGun = 0;
ownAmmo = 0;

sniperBulletRange = 150;
sniperRaycastChecked = false;
sniperRaycastCheckedX = 0;
sniperRaycastCheckedY = 0;

// Updating image angle and postion
if (instance_exists(oFrog) && global.hasGun)
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