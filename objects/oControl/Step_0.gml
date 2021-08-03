/// @description Insert description here
// You can write your code in this editor

show_debug_overlay(true);

if (global.currentGun)
{
	show_debug_message("global.currentGun " + string(global.currentGun));
	show_debug_message("global.currentGun ID " + string(global.currentGun.id));
}

// Switch by debug mode
if (keyboard_check_pressed(vk_f1)) global.debugMode = !global.debugMode;

// DEBUG mode
if (global.debugMode)
{
	if (keyboard_check_pressed(vk_f2)) global.drawGrid = !global.drawGrid;
	if (keyboard_check_pressed(vk_f3)) global.createWalls = !global.createWalls;
} else
{
	global.drawGrid = false;
	global.createWalls = false;
}

// Auto tile
if (doAutoTile)
{
	for (var i = 0; i < ds_list_size(raycastWallsChecked); i++)
	{
		with (raycastWallsChecked[| i])
		{
			if (destructible)
			{
				image_index = AutoTile();
			}
		}
	}
	ds_list_clear(raycastWallsChecked);
	doAutoTile = false;
}

// Change gun with mouse
/*if (mouse_wheel_up() || mouse_wheel_down())
{			
	instance_destroy(oGun);
	
	global.hasGun = false;
	
	show_message(global.currentGun);
			
	for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
	{
		if (!global.hasGun)
		{
			if (global.gunsGrid[# i, 0] != global.currentGun.id)
			{
				show_message(" 1 "+ string(global.gunsGrid[# i, 0]));
				show_message(" 2 "+ string(global.currentGun.id));
				
				with (instance_create_layer(oFrog.x, oFrog.y, "Gun", oGun))
				{
					typeGun = global.gunsGrid[# i, 1];
					global.currentGun = self;
		
					ownAmmo = global.gunsGrid[# i, 2];
					
					AddGunToGrid(global.currentGun, ownAmmo);
		
					global.ammo = ownAmmo;
				}
				if (!instance_exists(oAim)) instance_create_layer(mouse_x, mouse_y, "Top", oAim);
				global.hasGun = true;
			} 
		}
	}
}*/

if (mouse_wheel_up())
{
	instance_destroy(oGun);
	
	for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
	{
		//show_message(global.currentGun.id);
		//show_message(global.gunsGrid[# i, 0]);
		if (global.gunsGrid[# i, 0] == global.currentGun.id)
		{
			//show_message(global.gunsGrid[# i, 0]);
			global.currentGunPos = i;
			var _currentGunPos = global.currentGunPos - 1;
			with (instance_create_layer(oFrog.x, oFrog.y, "Gun", oGun))
			{
				global.gunsGrid[# _currentGunPos, 0] = id;
				global.currentGun = self;
				global.currentGun.typeGun = global.gunsGrid[# _currentGunPos, 1];
				global.currentGun.ownAmmo = global.gunsGrid[# _currentGunPos, 2];
				return true;
			}
		}
	}
}

if (mouse_wheel_down())
{
	instance_destroy(oGun);
	
	for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
	{
		//show_message(global.currentGun.id);
		//show_message(global.gunsGrid[# i, 0]);
		if (global.gunsGrid[# i, 0] == global.currentGun.id)
		{
			//show_message(global.gunsGrid[# i, 0]);
			global.currentGunPos = i;
			var _currentGunPos = global.currentGunPos + 1;
			with (instance_create_layer(oFrog.x, oFrog.y, "Gun", oGun))
			{
				global.gunsGrid[# _currentGunPos, 0] = id;
				global.currentGun = self;
				global.currentGun.typeGun = global.gunsGrid[# _currentGunPos, 1];
				global.currentGun.ownAmmo = global.gunsGrid[# _currentGunPos, 2];
				return true;
			}
		}
	}
}


// Add lifes
/*
if (global.plHp > global.plTotalHp)
{
	global.addLife = true;
}
else global.addLife = false;
*/

// Adding lifes
if (global.addLife)
{
	global.plTotalHp++;
	addedLifes++;
}

// Destroying oAim when player have not a gun
if (instance_exists(oAim) && !global.hasGun) instance_destroy(oAim);

// Create walls DEBUG
if (global.createWalls)
{
	if (mouse_check_button_pressed(mb_left))
	{
		//instance_create_layer((floor(mouse_x / 16) * 16) + 8, (floor(mouse_y / 16) * 16) + 8, "Col", oWall);
		instance_create_layer((floor(mouse_x / 16) * 16) + 8, (floor(mouse_y / 16) * 16) + 8, "Col", oRock);
	}
}