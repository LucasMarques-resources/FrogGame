/// @description Insert description here
// You can write your code in this editor

activateParticles = false;
global.hasGun = false;
global.currentGun = noone;

global.ammo = 0;
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

