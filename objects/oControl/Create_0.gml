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

global.mySystem = part_system_create();

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

// Create BedRock
for (var i = 0; i < room_width / 16; i++)
{
	with (instance_create_layer(i * 16, room_height - 12, "ColWall", oWall))
	{
		sprite_index = sBedRock;
	}
}

// Create oParticleSystem if not exists
if (!instance_exists(oParticleSystem))
{
	instance_create_layer(0, 0, "Enemy", oParticleSystem);
}