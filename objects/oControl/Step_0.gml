/// @description Insert description here
// You can write your code in this editor

show_debug_overlay(true);

// Switch by debug mode
if (keyboard_check_pressed(vk_f1)) global.debugMode = !global.debugMode;

// DEBUG mode
if (global.debugMode)
{
	if (keyboard_check_pressed(vk_f2)) global.drawGrid = !global.drawGrid;
	if (keyboard_check_pressed(vk_f3)) global.createWalls = !global.createWalls;
}

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

// Reseting thunder create variable
if (!instance_exists(oThunder)) createThunderDamager = true;

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
		instance_create_layer(mouse_x, mouse_y, "Particles", oRock);
	}
}