/// @description Insert description here
// You can write your code in this editor

if (destructible)
{
	if (hp <= 0 && raycastCheck)
	{
		var _list = ds_list_create();
		if (oFrog.image_xscale = 1)
		{
			var x1 = x;
			var x2 = x + 16;
		}
		else
		{
			var x1 = x - 16;
			var x2 = x;
		}
		var _num = collision_rectangle_list(x1, y - 10, x2, y, pCollider, false, true, _list, false);
		if (_num > 0)
		{
			for (var i = 0; i < _num; ++i)
			{
				with (_list[| i])
				{
					raycastCheck = false;
					destroyTimerDown = true;
				}
			}
		}
		ds_list_destroy(_list);
		
		var _list = ds_list_create();
		var _num = collision_circle_list(x, y, 64, pCollider, false, true, _list, false);
		if (_num > 0)
		{
			for (var i = 0; i < _num; ++i)
			{
				ds_list_add(oControl.raycastWallsChecked, _list[| i]);
			}
		}
		ds_list_destroy(_list);
		
		instance_destroy();
	}
	
	if (!raycastCheck)
	{
		if (destroyTimerDown)
		{
			destroyTimer--;
			if (destroyTimer <= 0)
			{
				instance_destroy();
			}
		}
	}
}