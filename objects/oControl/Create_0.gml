/// @description Insert description here
// You can write your code in this editor

randomize();

// DEBUG
global.debugMode = false;
global.createWalls = false;
global.drawGrid = false;

global.hasGun = false;
global.currentGun = noone;
GunsStatusGrid();

global.ammoAdded = false;
global.ammoAdd = 0;

global.plHp = 4;
global.plTotalHp = 4;
global.addLife = false;
global.lifeAdded = false;
global.newlifeAdded = false;

global.lifeTopXscale = 1;

pressEtextObj = noone;

addedLifes = 0;

skipDraw = 60;
draw = false;
xItem = 0;
yItem = 0;

timeNoAmmo = room_speed / 1.6;
timerNoAmmo = 0;

// Ammo added
ammoBeingAdded = 0;
ammoBeingAddedCrea = true;
ammoBeingAddedCreaRepeat = true;
objAmmoBeingAdded = noone;

// Guns
createGunItemUI = true;
global.gunsSlots = 1;
global.currentGunPos = 0;
global.gunsGrid = ds_grid_create(2, 3);
timeChangeWeapon = room_speed / 5;
timerChangeWeapon = timeChangeWeapon;
changeWeapon = true;

// Guns Type
enum GUN_TYPES
{
	none,
	rifle,
	fire,
	shotgun,
	nadeLauncher,
	machineGun,
	sniper,
	thunder,
	iceGun,
	total
}
// Guns status
enum GUN_STATUS
{
	firingDelay,
	maxAmmo,
	gunName
}

// Guns name
global.gunsName = ds_map_create();
for (var i = 0; i < GUN_TYPES.total; i++)
{
	global.gunsName[? i] = global.gunsGridStatus[i, GUN_STATUS.gunName];
}

// Walls
doAutoTile = false;
raycastWallsChecked = ds_list_create();

// Create BedRock
with (instance_create_layer(0, room_height - 12, "BedRock", pCollider))
{
	sprite_index = sBedRock;
	image_xscale = room_width / 16;
	destructible = false;
}