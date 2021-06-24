/// @description Insert description here
// You can write your code in this editor

global.hasGun = false;
global.ammo = 20;
global.ammoAdded = false;
global.ammoAdd = 0;

global.plHp = 4;
global.plTotalHp = 4;
global.addLife = false;

global.lifeTopXscale = 1;

addedLifes = 0;

skipDraw = 60;
draw = false;
t = noone;

timeNoAmmo = room_speed / 1.3;
timerNoAmmo = timeNoAmmo;
ammoAddCrea = true;
depth = -100;

// Creating oAim
if (!instance_exists(oAim) && !global.hasGun) instance_create_layer(mouse_x, mouse_y, "Top", oAim);