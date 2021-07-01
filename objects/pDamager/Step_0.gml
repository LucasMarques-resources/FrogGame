/// @description Insert description here
// You can write your code in this editor
if (instance_exists(followId))
{
	with (followId)
	{
		if (enemy)
		{
			other.x = x;
			other.y = y;
		}
		else 
		{
			other.x = x + sprite_width / 2;
			other.y = y + sprite_height / 2;
		}
	}
} else instance_destroy();