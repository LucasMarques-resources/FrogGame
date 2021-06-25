/// @description Insert description here
// You can write your code in this editor

global.hasGun = false;
global.ammo = 20;
global.ammoAdded = false;
global.ammoAdd = 0;

global.plHp = 4;
global.plTotalHp = 4;
global.addLife = false;
global.lifeAdded = false;

global.lifeTopXscale = 1;

addedLifes = 0;

skipDraw = 60;
draw = false;
xItem = 0;
yItem = 0;

timeNoAmmo = room_speed / 1.3;
timerNoAmmo = timeNoAmmo;

// Ammo added
ammoBeingAdded = 0;
ammoBeingAddedCrea = true;
ammoBeingAddedCreaRepeat = true;
objAmmoBeingAdded = noone;


// Creating oAim
if (!instance_exists(oAim) && !global.hasGun) instance_create_layer(mouse_x, mouse_y, "Top", oAim);