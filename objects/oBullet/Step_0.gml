/// @description Insert description here
// You can write your code in this editor

switch (typeBullet)
{
	// Normal
	case 0:
	{
		x += lengthdir_x(spd, direction);
		y += lengthdir_y(spd, direction);

		// Collision with something
		if (place_meeting(x, y, pShootable))
		{
			with (instance_place(x, y, pShootable))
			{
				hp--;
				colShootable = true;
				hitFrom = other.direction;
				if (hp < 1) other.create = false;
			}
			instance_destroy();
		}
	}
	
	break;
	// Fire
	case 1:
		
		
		
	break;
}