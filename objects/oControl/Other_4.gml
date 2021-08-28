 /// @description desc

game_set_speed(60, gamespeed_fps);

#region RESET VALUES
if (global.plDied)
{
	global.ammoAdded = false;
	global.ammoAdd = 0;
	
	// Player
	global.plTotalHp = global.plTotalHpSave;
	global.plHp = global.plTotalHp;
	global.plRoll = false;
	global.plRollDir = 0;
	global.plRollVel = 0;

	global.addLife = false;
	global.lifeAdded = false;
	global.newlifeAdded = false;

	global.gunSlotAdded = false;

	// Guns
	global.gunsSlots = global.gunsSlotsSave;
	
	for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
	{
		ds_grid_set(global.gunsGrid, i, 2, global.gunsGridStatus[global.gunsGrid[# i, 1], GUN_STATUS.maxAmmo]);
	}
	
}
#endregion

global.plDied = false;
global.changeWeapon = true;

if (instance_exists(oFrog))
{
	if (global.currentGun != -4)
	{
		for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
		{
			if (global.gunsGrid[# i, 0] == global.currentGun.id)
			{
				global.currentGunPos = i;
				var _currentGunPos = global.currentGunPos;
			
				with (instance_create_layer(oFrog.x, oFrog.y, "Gun", oGun))
				{
					global.gunsGrid[# _currentGunPos, 0] = id;
					typeGun = global.gunsGrid[# _currentGunPos, 1];
		
					ownAmmo = global.gunsGrid[# _currentGunPos, 2];
		
					global.currentGun = self;
				}
			}
		}
	}
}

pressEtextObj = noone;

gunAngle = 0;
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
timeChangeWeapon = room_speed / 5;
timerChangeWeapon = timeChangeWeapon;
changeWeapon = true;

// Walls
doAutoTile = false;
raycastWallsChecked = ds_list_create();

// Create BedRock
if (layer_exists("BedRock"))
{
	// Creating bedrock at the bottom of the room
	with (instance_create_layer(0, room_height - 16, "BedRock", pCollider))
	{
		sprite_index = sBedRock;
		image_xscale = room_width / 16;
		destructible = false;
	}
	
	// Creating bedrock at the beginning of the room
	with (instance_create_layer(-16, -32, "BedRock", pCollider))
	{
		sprite_index = sBedRock;
		image_yscale = (room_height / 16) + 32;
		destructible = false;
	}
	
	// Creating bedrock at the end of the room
	with (instance_create_layer(room_width, -32, "BedRock", pCollider))
	{
		sprite_index = sBedRock;
		image_yscale = (room_height / 16) + 32;
		destructible = false;
	}
}

// Creating level transition at the end of the room
with (instance_create_layer(room_width + 10, 0, "Instances", oLevelTransition))
{
	image_yscale = (room_height / 16);
}

// Create oTransition
if (!instance_exists(oTransition) && layer_exists("Top")) instance_create_layer(0, 0, "Top", oTransition);