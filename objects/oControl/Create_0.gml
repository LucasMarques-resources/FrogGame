/// @description Insert description here
// You can write your code in this editor

global.hasGun = false;

global.plHp = 4;
global.plTotalHp = 4;
global.addLife = false;

global.lifeTopXscale = 1;

addedLifes = 0;

// Creating oAim
if (!instance_exists(oAim) && !global.hasGun) instance_create_layer(mouse_x, mouse_y, "Top", oAim);