/// @description Insert description here
// You can write your code in this editor

// Being destroyed if touched on water
if (place_meeting(x, y, oWater))
{
	instance_destroy();
}

if (instance_exists(followId))
{
	with (followId)
	{
		other.x = x;
		other.y = y;
		/*if (enemy)
		{
			other.x = x;
			other.y = y;
		}
		else 
		{
			other.x = x + sprite_width / 2;
			other.y = y + sprite_height / 2;
		}*/
		
		if (resetDestroyDamagerTimer)
		{
			other.losingHpTimerD = other.losingHpTimeD;
			resetDestroyDamagerTimer = false;
		}
	}
	
} else instance_destroy();