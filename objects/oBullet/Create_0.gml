/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

destroyTime = 14;

create = true;

typeBullet = 0;

spd = 0;

velh = 0;
velv = 0;

grav = 0.3;

// Initial force to grenade launcher bullet
if (global.currentGun.typeGun = 3)
{
	velh = lengthdir_x(4, point_direction(x, y, mouse_x, mouse_y));
	velv = lengthdir_y(7, point_direction(x, y, mouse_x, mouse_y));
	destroyTime = room_speed * 2;
}

destroyTimer = destroyTime;