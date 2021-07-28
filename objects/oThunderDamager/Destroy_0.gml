/// @description Insert description here
// You can write your code in this editor

// If to auto tiling
if (autoTiling)
{
	// Check walls to auto tiling
	var _list = ds_list_create();
	var _num = collision_rectangle_list(x - (xRadius + 20), y - room_height, x + (xRadius + 20), y + (yRadius + 20) , pCollider, false, true, _list, false);
	if (_num > 0)
	{
		for (var i = 0; i < _num; ++i)
		{
			// Add the walls's id to the list
			with (_list[| i])
			{
				if (destructible)
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
}

ds_list_destroy(wallsToAutoTiling);