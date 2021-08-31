/// @description Insert description here
// You can write your code in this editor

// Destroying Walls
var _list = ds_list_create();
var _num = collision_circle_list(x, y, damagerRadius - 10, pCollider, false, true, _list, false);
if (_num > 0)
{
	for (var i = 0; i < _num; i++)
	{
		var r = Raycast(damagerRadius - 10, _list[| i], point_direction(x, y, _list[| i].x, _list[| i].y), x, y);
		if (r && r.destructible)
		{
			with (r)
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


if (collision_circle(x, y, damagerRadius, oFrog, false, true))
{
	ScreenShake(2, 6);
	global.plHp -= 2;
	PlayerKnockBack();
}

instance_destroy();