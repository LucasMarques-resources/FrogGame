/// @description Insert description here
// You can write your code in this editor

if (destructible)
{
	
	if (hp <= 0 && raycastCheck)
	{
		var _list = ds_list_create();
		var _num = collision_rectangle_list(choose(x, x-16), y - 10, choose(x, x+16), y, pCollider, false, true, _list, false);
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
		
		instance_destroy();
	}
	
	if (!raycastCheck)
	{
		if (destroyTimerDown)
		{
			destroyTimer--;
			if (destroyTimer <= 0)
			{
				doAutoTileWall = true;
				instance_destroy();			
			}
		}
	}
}