/// @description desc

if (!collided)
{
	velv += grav;
	image_angle = point_direction(x, y, x + velh, y + velv);
	
	// Collision with something
	if (giveDamage)
	{
		with (instance_place(x, y, pShootable))
		{
			if (destructible)
			{
				hp -= 10;
				colShootable = true;
				hitFrom = other.image_angle;
				knockBack = 4;
				if (hp < 1) other.create = false;
				other.giveDamage = false;
			}
		}
	}
}
else
{
	velh = 0;
	velv = 0;
	
	// Create thunder
	if (createThunder)
	{
		with (instance_create_layer(x + lengthdir_x(sprite_width, image_angle), y - room_height, "Top", oThunder))
		{
			createThunderDamager = true;
			randomDiversion = false;
		}
		
		ScreenShake(7, 6);
		
		createThunder = false;
	}
	
	// Thunder was created (back to player)
	if (!createThunder)
	{
		collision = false;
		
		// TODO: shaking
		
		backToPlayerDelay--;
		
		if ((backToPlayerDelay <= (backToPlayerDelayD/2)) && (point_distance(x, y, oFrog.x, oFrog.y) < 10))
		{
			backToPlayerDelay = 0;
		}
		
		if (backToPlayerDelay <= 0)
		{
			velh = lengthdir_x(3, point_direction(x, y, oFrog.x, oFrog.y));
			velv = lengthdir_y(3, point_direction(x, y, oFrog.x, oFrog.y));
			
			image_angle -= sign(velh) * 12;
			
			// Create trident gun
			if (point_distance(x, y, oFrog.x, oFrog.y) < 10)
			{
				with (instance_create_layer(oFrog.x, oFrog.y, "Gun", oGun))
				{
					typeGun = GUN_TYPES.trident;
					global.currentGun = self;
				
					global.gunsGrid[# other.tridentGunGridPos, 0] = id;
					global.gunsGrid[# other.tridentGunGridPos, 1] = typeGun;
					global.gunsGrid[# other.tridentGunGridPos, 2] = 1;
				}
				if (!instance_exists(oAim)) instance_create_layer(mouse_x, mouse_y, "Top", oAim);
				instance_destroy();
				global.hasGun = true;
			}
		}
	}
}