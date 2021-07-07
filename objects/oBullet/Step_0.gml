/// @description Insert description here
// You can write your code in this editor

switch (typeBullet)
{
	// Normal
	case 0:
	{
		destroyTimer--;
		
		spd = 6;
		
		x += lengthdir_x(spd, direction);
		y += lengthdir_y(spd, direction);

		// Collision with something
		with (instance_place(x, y, pShootable))
		{
			if (shootable)
			{
				hp--;
				colShootable = true;
				hitFrom = other.direction;
				if (hp < 1) other.create = false;
					
				instance_destroy(other);
			}
		}
	}
	
	break;
	// Fire
	case 1:
		
		destroyTimer--;
		
		var dir = point_direction(x, y, mouse_x, mouse_y);
		var p = CreateParticleSystem(sprite_index, 4, 5, .6, .8, c_yellow, c_red, dir, dir, 0.5, 1, 0.4, 0.2, 0);
		part_particles_create(global.mySystem, x, y, p, 1);
		
		spd = 5;
		
		x += lengthdir_x(spd, direction);
		y += lengthdir_y(spd, direction);

		// Collision with something
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
			if (beingDamaged) resetDestroyDamagerTimer = true;
		}
		
		
	break;
	
	// Shotgun
	case 2:
		
		destroyTimer--;
		
		spd = 6;
		
		x += lengthdir_x(spd, direction);
		y += lengthdir_y(spd, direction);

		// Collision with something
		with (instance_place(x, y, pShootable))
		{
			if (shootable)
			{
				hp--;
				colShootable = true;
				hitFrom = other.direction;
				knockBack = 4.5;
				if (hp < 1) other.create = false;
					
				instance_destroy(other);
			}
		}
	
	break;
	
	// GrenadeLauncher
	case 3:
		
		velv += grav;
		
		destroyTimer--;
		
		var bouncingValue = .6;
		
		HorizontalCollision(pBox, true, bouncingValue);
		HorizontalCollision(oWall, true, bouncingValue);
		
		VerticalCollision(pBox, true, bouncingValue, true);
		VerticalCollision(oWall, true, bouncingValue, true);
		
		// COLLISION WITH ENEMIES
		/*
		if (collideWithEnemy)
		{
			with (instance_place(x + velh, y + velv, pEnemy))
			{
				colShootable = true;
				hitFrom = other.direction;
				knockBack = 2;
				if (hp < 1) other.create = false;
			
				with (other)
				{
					velv *= -.4;
					velh = lerp(velh, 0, 0.7);
				}
				//other.collideWithEnemy = false;
			}
		}
		*/
		
	break;
}

// Being destroyed
if (destroyTimer <= 0) instance_destroy();


x += velh;
y += velv;
