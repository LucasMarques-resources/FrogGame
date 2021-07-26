/// @description Insert description here
// You can write your code in this editor

// If to auto tiling

if (autoTiling)
{
	// Run by all the walls to auto tiling
	for (var i = 0; i < ds_list_size(wallsToAutoTiling); i++)
	{
		ds_list_add(oControl.raycastWallsChecked, wallsToAutoTiling[| i]);
		oControl.doAutoTile = true;
		with (wallsToAutoTiling[| i])
		{
			if (destructible)
			{
				raycastCheck = true;
				hp -= hp;
			}
		}
	}
}

ds_list_destroy(wallsToAutoTiling);