/// @description Insert description here
// You can write your code in this editor

// DEBUG
global.debugMode = false;
global.createWalls = false;
global.drawGrid = false;

global.hasGun = false;
global.currentGun = noone;

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
	total
}

// Guns name
global.gunsName = ds_map_create();
global.gunsName[? GUN_TYPES.rifle] = "Rifle"
global.gunsName[? GUN_TYPES.fire] = "Fire gun"
global.gunsName[? GUN_TYPES.shotgun] = "Shotgun"
global.gunsName[? GUN_TYPES.nadeLauncher] = "Grenade Launcher"
global.gunsName[? GUN_TYPES.sniper] = "Sniper"
global.gunsName[? GUN_TYPES.thunder] = "Thunder gun"

// Walls
doAutoTile = false;
raycastWallsChecked = ds_list_create();

// Create BedRock
with (instance_create_layer(0, room_height - 12, "ColWall", pCollider))
{
	sprite_index = sBedRock;
	image_xscale = room_width / 16;
	destructible = false;
}