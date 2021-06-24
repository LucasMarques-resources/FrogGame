/// @description Insert description here
// You can write your code in this editor

global.hasGun = false;
global.ammo = 300;
global.ammoAdded = false;

global.plHp = 4;
global.plTotalHp = 4;
global.addLife = false;

global.lifeTopXscale = 1;

addedLifes = 0;

skipDraw = 60;
draw = false;
yy = 23;
alpha = 1;

// Creating oAim
if (!instance_exists(oAim) && !global.hasGun) instance_create_layer(mouse_x, mouse_y, "Top", oAim);