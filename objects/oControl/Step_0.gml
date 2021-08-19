/// @description Insert description here
// You can write your code in this editor

show_debug_overlay(true);

#region DEBUGS
if (global.currentGun)
{
	//show_debug_message("global.currentGun " + string(global.currentGun));
	//show_debug_message("global.currentGun ID " + string(global.currentGun.id));
}

// Switch by debug mode
if (keyboard_check_pressed(vk_f1)) global.debugMode = !global.debugMode;

// DEBUG mode
if (global.debugMode)
{
	global.drawGunsGrid = true;
	if (keyboard_check_pressed(vk_f2)) global.drawGrid = !global.drawGrid;
	if (keyboard_check_pressed(vk_f3)) global.createWalls = !global.createWalls;
	if (keyboard_check_pressed(vk_f4))
	{
		global.gunsSlots = real(get_string("guns slots", 0));
		ds_grid_resize(global.gunsGrid, global.gunsSlots, ds_grid_height(global.gunsGrid));
	}
}
else
{
	global.drawGrid = false;
	global.drawGunsGrid = false;
	global.createWalls = false;
}

// Create objects debug
if (global.createWalls)
{
	if (mouse_check_button_pressed(mb_left))
	{
		//instance_create_layer((floor(mouse_x / 16) * 16) + 8, (floor(mouse_y / 16) * 16) + 8, "Col", oWall);
		instance_create_layer((floor(mouse_x / 16) * 16) + 8, (floor(mouse_y / 16) * 16) + 8, "Col", oRock);
	}
}

#endregion

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

#region CHANGE WEAPON
if (global.currentGun && !global.plRoll)
{
	if ((mouse_wheel_up() || gamepad_button_check_pressed(0, gp_shoulderr)) && changeWeapon)
	{	
		for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
		{
			if (global.gunsGrid[# i, 0] == global.currentGun.id)
			{
				global.currentGunPos = i;
				var _currentGunPos = global.currentGunPos - 1;
			
				if (_currentGunPos < 0)
				{
					_currentGunPos = ds_grid_width(global.gunsGrid) - 1;
				}
				if (global.gunsGrid[# _currentGunPos, 0] != GUN_TYPES.none)
				{
					gunAngle = oGun.image_angle;
					instance_destroy(oGun);
				
					with (instance_create_layer(oFrog.x, oFrog.y, "Gun", oGun))
					{
						global.gunsGrid[# _currentGunPos, 0] = id;
						global.currentGun = self;
						global.currentGun.typeGun = global.gunsGrid[# _currentGunPos, 1];
						global.currentGun.ownAmmo = global.gunsGrid[# _currentGunPos, 2];
						firingDelay = global.gunsGridStatus[typeGun, 0] / 3;
						other.changeWeapon = false;
						// TODO: solve gun angle bug
						/*if (oFrog.controller)
						{
							image_angle = controllerAngle;
						}*/
						return true;
					}
				}
			}
		}
	}

	if ((mouse_wheel_down() || gamepad_button_check_pressed(0, gp_shoulderl)) && changeWeapon)
	{
		for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
		{
			if (global.gunsGrid[# i, 0] == global.currentGun.id)
			{
				global.currentGunPos = i;
				var _currentGunPos = global.currentGunPos + 1;

				if (_currentGunPos = ds_grid_width(global.gunsGrid))
				{
					_currentGunPos = 0;
				}
				if (global.gunsGrid[# _currentGunPos, 0] != GUN_TYPES.none)
				{
					instance_destroy(oGun);
				
					with (instance_create_layer(oFrog.x, oFrog.y, "Gun", oGun))
					{
						global.gunsGrid[# _currentGunPos, 0] = id;
						global.currentGun = self;
						global.currentGun.typeGun = global.gunsGrid[# _currentGunPos, 1];
						global.currentGun.ownAmmo = global.gunsGrid[# _currentGunPos, 2];
						other.changeWeapon = false;
						firingDelay = global.gunsGridStatus[typeGun, 0] / 3;
						return true;
					}
				}
			}
		}
	}

	if (!changeWeapon)
	{
		timerChangeWeapon--;
		if (timerChangeWeapon <= 0)
		{
			changeWeapon = true;
			timerChangeWeapon = timeChangeWeapon;
		}
	}
}
#endregion

// Adding lifes
if (global.addLife)
{
	global.plTotalHp++;
	addedLifes++;
	
	global.addLife = false;
}

// Destroying oAim when player have not a gun
if (instance_exists(oAim) && !global.hasGun) instance_destroy(oAim);