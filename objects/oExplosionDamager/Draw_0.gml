/// @description Insert description here
// You can write your code in this editor
var list = ds_list_create();
var num = collision_circle_list(x, y, damagerRadius - 10, pShootable, false, true, list, false);
if (num > 0)
{
	for (var i = 0; i < num; ++i)
	{
		with (list[| i])
		{
			if (!item)
			{
				with (other)
				{
					var s = Raycast(damagerRadius - 10, other, point_direction(x, y, other.x, other.y));
					if (s) with (s)
					{
						hp -= 5;
						colShootable = true;
						knockBack = 2;
						hitFrom = other.direction;
						if (oBox) createFireParticles = true;
					}
				}
			}
		}
	}
}
ds_list_destroy(list);