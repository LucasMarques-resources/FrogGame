/// @description Insert description here
// You can write your code in this editor

if (autoTiling)
{
	// Check walls to auto tiling
	var _list = ds_list_create();
	var _num = collision_circle_list(x, y, damagerRadius + 16, pCollider, false, true, _list, false);
	if (_num > 0)
	{
		for (var i = 0; i < _num; ++i)
		{
			// Add the walls's id to the list
			with (_list[| i])
			{
				if (destructible && !destructibleCustom)
				{
					hp -= hp;
					raycastCheck = false;
					destroyTimerDown = true;
					image_index = AutoTile();
				}
			}
		}
	}
	ds_list_destroy(_list);
	/*
	// Run by all the walls to auto tiling
	for (var i = 0; i < ds_list_size(wallsToAutoTiling); i++)
	{
		ds_list_add(oControl.raycastWallsChecked, wallsToAutoTiling[| i]);
		oControl.doAutoTile = true;
		with (wallsToAutoTiling[| i])
		{
			if (destructible)
			{
				hp -= hp;
				raycastCheck = false;
				destroyTimerDown = true;
			}
		}
	}
	*/
}

ds_list_destroy(wallsToAutoTiling);