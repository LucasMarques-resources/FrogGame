/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

create = true;

typeBullet = 0;

spd = 0;
velh = 0;
velv = 0;
grav = .3;
bouncingValue = .6;
angleRotate = 6;

collideWithEnemy = true;

destroyTime = 14;

// Initial force to grenade launcher bullet
if (global.currentGun.typeGun = 3)
{
	velh = lengthdir_x(4, point_direction(x, y, mouse_x, mouse_y));
	velv = lengthdir_y(7, point_direction(x, y, mouse_x, mouse_y));
	destroyTime = 5;
}

damage = 1;

beDestroy = false;
setDestroyTimer = true;
destroyTimer = destroyTime;

// Particles
particleTypeId = noone;
particleSystem = noone;

colWater = false;