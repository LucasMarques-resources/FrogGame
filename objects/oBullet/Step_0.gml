/// @description Insert description here
// You can write your code in this editor

switch (typeBullet)
{
	// Normal
	case 0:
	{
		spd = 6;
		
		x += lengthdir_x(spd, direction);
		y += lengthdir_y(spd, direction);

		// Collision with something
		if (place_meeting(x, y, pShootable))
		{
			with (instance_place(x, y, pShootable))
			{
				if (shootable)
				{
					xscaleSaved = image_xscale;
					//show_message(xscaleSaved);
					hp--;
					colShootable = true;
					hitFrom = other.direction;
					if (hp < 1) other.create = false;
					
					instance_destroy(other);
				}
			}
		}
	}
	
	break;
	// Fire
	case 1:
		
		spd = 5;
		
		x += lengthdir_x(spd, direction);
		y += lengthdir_y(spd, direction);

		// Collision with something
		if (place_meeting(x, y, pShootable))
		{
			with (instance_place(x, y, pShootable))
			{
				if (!item)
				{
					hp--;
					colShootable = true;
					hitFrom = other.direction;
					if (hp < 1) other.create = false;
				
					if (damagerCrea)
					{
						var xx = x;
						var yy = y;
						if (enemy)
						{
							xx = x;
							yy = y;
						}
						else
						{
							xx = x + sprite_width / 2;
							yy = y + sprite_height / 2;
						}
					
						with (instance_create_layer(xx, yy, "Instances", oFireDamager))
						{
							followId = other.id;
						}

						colDamager = true;
						damagerCrea = false;
					}
					beingDamaged = true;
					instance_destroy(other);
				}
			}
		}
		
		
	break;
}