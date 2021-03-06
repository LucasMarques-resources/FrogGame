/// @description Insert description here
// You can write your code in this editor

// Destroying Walls
var _list = ds_list_create();
var _num = collision_rectangle_list(x - xRadius, 0, x + xRadius, room_height, pCollider, false, true, _list, false);
if (_num > 0)
{
	for (var i = 0; i < _num; ++i)
	{
		// Destroy
		with (_list[| i])
		{
			if (destructible)
			{
				// Is to do auto tiling
				other.autoTiling = true;
				// Destroy
				destroyed = true;
				hp -= 2;
			}
		}
	}
}
ds_list_destroy(_list);

// Take damage to shootables
var list = ds_list_create();
var num = collision_rectangle_list(x - (xRadius), 0, x + (xRadius), room_height, pShootable, false, true, list, false);
if (num > 0)
{
	for (var i = 0; i < num; ++i)
	{
		if (list[| i].destructible)
		{
			var r = Raycast(90, list[| i], point_direction(x, y, list[| i].x, list[| i].y), x, y);
			if (r) with (r)
			{
				hp -= 5;
				colShootable = true;
				knockBack = irandom_range(2.3, 3.7);
				hitFrom = point_direction(other.x, other.y, x, y);
				
				wasThundered = true;
				beingFireDamaged = true;
				resetDestroyDamagerTimer = true;
				
				if (oBox) createFireParticles = true;	
			}
		}
	}
}
ds_list_destroy(list);

instance_destroy();