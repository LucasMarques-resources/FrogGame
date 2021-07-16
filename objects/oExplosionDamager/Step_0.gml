/// @description Insert description here
// You can write your code in this editor

// Check walls to auto tiling
var _list = ds_list_create();
var _num = collision_circle_list(x, y, damagerRadius + 64, oWall, false, true, _list, false);
if (_num > 0)
{
	for (var i = 0; i < _num; ++i)
	{
		// Add the walls's id to the list
		ds_list_add(wallsToAutoTiling, _list[| i]);
	}
}
ds_list_destroy(_list);

// Destroying Walls
var _list = ds_list_create();
var _num = collision_circle_list(x, y, damagerRadius - 10, oWall, false, true, _list, false);
if (_num > 0)
{
	for (var i = 0; i < _num; ++i)
	{
		if (_list[| i].sprite_index != sBedRock)
		{
			// Is to do auto tiling
			other.autoTiling = true;
			// Destroy
			instance_destroy(_list[| i]);
		}
	}
}
ds_list_destroy(_list);

instance_destroy();