/// @description Insert description here
// You can write your code in this editor

colWater = place_meeting(x, y, oWater);

switch (typeBullet)
{
	// Normal
	case 0:
	{
		destroyTimer--;
		
		if (colWater)
		{
			spd = 3;
			
			velh = lerp(velh, 0, 0.03);
			velv = lerp(velv, 0, 0.03);
		}
		else spd = 6;
		
		velh = lengthdir_x(spd, direction);
		velv = lengthdir_y(spd, direction);

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
		particleTypeId = CreateParticleSystem(sprite_index, 4, 5, .6, .8, c_yellow, c_red, dir, dir, 0.5, 1, 0.4, 0.2, 0);
		particleSystem = part_system_create();
		part_particles_create(particleSystem, x, y, particleTypeId, 1);
		
		if (colWater)
		{
			spd = 2;
			
			velh = lerp(velh, 0, 0.03);
			velv = lerp(velv, 0, 0.03);
		}
		else spd = 5;
		
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
		
		if (colWater)
		{
			spd = 3;
			
			velh = lerp(velh, 0, 0.03);
			velv = lerp(velv, 0, 0.03);
		}
		else spd = 6;
		
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
	
	// Grenade Launcher
	case 3:
		
		if (colWater)
		{	
			velh = lerp(velh, 0, 0.08);
			velv = lerp(velv, 0, 0.08);
			grav = .1;
			bouncingValue = .8;
			angleRotate = 3;
		}
		else
		{
			grav = .3;
			bouncingValue = .6;
			angleRotate = 6;
		}
		
		velv += grav;
		
		image_angle += sign(velh) * angleRotate;
		
		// Horizontal Collision WALL & BOX
		if (place_meeting(x, y + velv, pCollider) || place_meeting(x, y + velv, pBox))
		{
			repeat (abs(velv) + 1) {
				if (place_meeting(x, y + sign(velv), pCollider) || place_meeting(x, y + velv, pBox))
				    break;
				y += sign(velv);
			}
			velv *= -bouncingValue;
			velh = lerp(velh, 0, 0.7);
			
			beDestroy = true;
		}
		
		// Vertical Collision WALL & BOX
		if (place_meeting(x + velh, y, pCollider) || place_meeting(x + velh, y, pBox))
		{
			repeat (abs(velh) + 1) {
				if (place_meeting(x, y + sign(velh), pCollider) || place_meeting(x, y + velh, pBox))
				    break;
				x += sign(velh);
			}
			velh *= -bouncingValue;
			
			beDestroy = true;
		}
		
		// Collision ENEMY
		if (collideWithEnemy)
		{
			with (instance_place(x, y, pShootable))
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
				other.beDestroy = true;
				other.collideWithEnemy = false;
			}
		}
		
		// Destroy
		if (beDestroy)
		{
			destroyTimer--;
		}
		
	break;
	
	// Machine gun
	case 4:
		
		destroyTimer--;
		
		if (colWater)
		{
			spd = 3;
			
			velh = lerp(velh, 0, 0.03);
			velv = lerp(velv, 0, 0.03);
		}
		else spd = 6;
		
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
}

// Being destroyed
if (destroyTimer <= 0) instance_destroy();


x += velh;
y += velv;
