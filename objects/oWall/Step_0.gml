/// @description Insert description here
// You can write your code in this editor


if (sprite_index != sBedRock)
{
	if (hp <= 0 && raycastCheck)
	{
		var dir = choose(45, 0, 180, 90, 135, 225, -45);
		var times = choose(7, 9);
		var lineSize = choose(16, 32);

		for (var i = 0; i < times; i++)
		{
			if (i >= times - 1) dir = 90;
			var wall = Raycast(16, oWall, dir, false, 0, 0);
			if (wall)
			{
				wall.destroyTimerDown = true;
				wall.raycastCheck = false;
			}
		}
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