/// @description Insert description here
// You can write your code in this editor

// DEBUG
global.debugMode = false;
global.createWalls = false;
global.drawGrid = false;

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

doAutoTile = false;
raycastWallsChecked = ds_list_create();

// Create BedRock
with (instance_create_layer(0, room_height - 12, "ColWall", pCollider))
{
	sprite_index = sBedRock;
	image_xscale = room_width / 16;
	destructible = false;
}