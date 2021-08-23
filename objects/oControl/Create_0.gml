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

// Player
global.plHp = 4;
global.plTotalHp = 4;
global.plRoll = false;
global.plRollDir = 0;
global.plRollVel = 0;

global.changeWeapon = true;

global.addLife = false;
global.lifeAdded = false;
global.newlifeAdded = false;

global.gunSlotAdded = false;

addedLifes = 0;

// Guns
global.gunsSlots = 2;
global.currentGunPos = 0;
global.gunsGrid = ds_grid_create(global.gunsSlots, 3);

// Guns Type
enum GUN_TYPES
{
	none,
	revolver,
	rifle,
	fire,
	shotgun,
	nadeLauncher,
	machineGun,
	sniper,
	thunder,
	iceGun,
	drumGun,
	trident,
	total
}
// Guns status
enum GUN_STATUS
{
	infiniteAmmo,
	firingDelay,
	maxAmmo,
	gunName,
	aim
}

// Guns name
global.gunsName = ds_map_create();
for (var i = 0; i < GUN_TYPES.total; i++)
{
	global.gunsName[? i] = global.gunsGridStatus[i, GUN_STATUS.gunName];
}