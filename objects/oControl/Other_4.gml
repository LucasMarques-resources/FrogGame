 /// @description desc

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
	with (instance_create_layer(0, room_height - 12, "BedRock", pCollider))
	{
		sprite_index = sBedRock;
		image_xscale = room_width / 16;
		destructible = false;
	}
	
	with (instance_create_layer(-16, -32, "BedRock", pCollider))
	{
		sprite_index = sBedRock;
		image_yscale = (room_height / 16) + 32;
		destructible = false;
	}
	with (instance_create_layer(room_width, -32, "BedRock", pCollider))
	{
		sprite_index = sBedRock;
		image_yscale = (room_height / 16) + 32;
		destructible = false;
	}
}

// Create oTransition
if (!instance_exists(oTransition) && layer_exists("Top")) instance_create_layer(0, 0, "Top", oTransition);