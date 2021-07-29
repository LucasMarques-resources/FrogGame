/// @description desc

// Destroying Walls
var list = ds_list_create();
var x1 = x - ((32/2) + 5);
var y1 = y + 8;
var x2 = x + ((32/2) + 5);
var y2 = y + (8*3);
var num = collision_rectangle_list(x1, y1, x2, y2, pCollider, false, true, list, false);
if (num > 0)
{
	for (var i = 0; i < num; i++)
	{
		if (list[| i])
		{
			with (list[| i])
			{
				destroyed = true;
			}
		}
	}
}
ds_list_destroy(list);

// Take damage to shootables
var list = ds_list_create();
var num = collision_rectangle_list(x1, y1, x2, y2, pShootable, false, true, list, false);
if (num > 0)
{
	for (var i = 0; i < num; ++i)
	{
		if (list[| i].destructible)
		{
			with (list[| i])
			{
				hp -= 5;
				colShootable = true;
				knockBack = irandom_range(2.3, 3.7);
				hitFrom = point_direction(other.x, other.y, x, y);
				if (oBox) createFireParticles = true;
			}
		}
	}
}
ds_list_destroy(list);

instance_destroy();