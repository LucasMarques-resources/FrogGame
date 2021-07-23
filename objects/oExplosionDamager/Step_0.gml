/// @description Insert description here
// You can write your code in this editor

// Check walls to auto tiling
var _list = ds_list_create();
var _num = collision_circle_list(x, y, damagerRadius + 16, pCollider, false, true, _list, false);
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
var _num = collision_circle_list(x, y, damagerRadius - 10, pCollider, false, true, _list, false);
if (_num > 0)
{
	for (var i = 0; i < _num; ++i)
	{
		if (_list[| i].sprite_index != sBedRock)
		{
			// Is to do auto tiling
			other.autoTiling = true;
			// Destroy
			with (_list[| i]) if (destructible) instance_destroy();
		}
	}
}
ds_list_destroy(_list);

var list = ds_list_create();
var num = collision_circle_list(x, y, damagerRadius, pCollider, false, true, list, false);
if (num > 0)
{
	//show_message("CIRCLE");
	for (var i = 0; i < num; ++i)
	{
		wallsDir = point_direction(x, y, list[| i].x, list[| i].y);
	}
}
ds_list_destroy(list);

// Take damage to shootables
var list = ds_list_create();
var num = collision_circle_list(x, y, damagerRadius, pShootable, false, true, list, false);
if (num > 0)
{
	for (var i = 0; i < num; ++i)
	{
		if (list[| i].destructible)
		{
			var r = Raycast(damagerRadius, list[| i], point_direction(x, y, list[| i].x, list[| i].y));
			if (r) with (r)
			{
				hp -= 5;
				colShootable = true;
				knockBack = irandom_range(2, 3.5);
				hitFrom = other.explosionDirection;
				if (oBox) createFireParticles = true;
			}
		}
	}
}
ds_list_destroy(list);

instance_destroy();