/// @description Insert description here
// You can write your code in this editor

colWater = place_meeting(x, y, oWater);

var dir = point_direction(x, y, mouse_x, mouse_y);

switch (typeBullet)
{
	#region RIFLE
	case GUN_TYPES.rifle:
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
			if (destructible)
			{
				hp--;
				colShootable = true;
				hitFrom = other.direction;
				knockBack = 4.5;
				if (hp < 1) other.create = false;
					
				instance_destroy(other);
			}
		}
	}
	break;
	#endregion
	
	#region FIRE
	case GUN_TYPES.fire:
		
		destroyTimer--;
		
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
		
		velh = lengthdir_x(spd, direction);
		velv = lengthdir_y(spd, direction);

		// Collision with something
		with (instance_place(x, y, pShootable))
		{
			if (destructible)
			{
				hp--;
				colShootable = true;
				hitFrom = other.direction;
				if (hp < 1) other.create = false;
				
				if (damagerFireCrea)
				{
					/*var xx = x;
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
					}*/
					with (instance_create_layer(x, y, "Instances", oFireDamager))
					{
						followId = other.id;
						other.fireDamagerId = id;
					}

					colFireDamager = true;
					damagerFireCrea = false;
					beingFireDamaged = true;
				}
			}
			instance_destroy(other);
			
			if (beingFireDamaged) resetDestroyDamagerTimer = true;
		}
		
		
	break;
	#endregion
	
	#region SHOTGUN
	case GUN_TYPES.shotgun:
		
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
			if (destructible)
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
	#endregion
	
	#region GRENADE LAUNCHER
	case GUN_TYPES.nadeLauncher:
		
		if (setCreateValues)
		{
			velh = lengthdir_x(4, dir);
			velv = lengthdir_y(7, dir);
			destroyTime = 30;
			destroyTimer = destroyTime;
			setCreateValues	= false;
		}
		
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
				velv = sign(velv);
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
				velh = sign(velh);
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
	#endregion
	
	#region MACHINE GUN
	case GUN_TYPES.machineGun:
		
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
			if (destructible)
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
	#endregion
	
	#region SNIPER
	case GUN_TYPES.sniper:
		
		damage = 3;
		
		if (colWater)
		{
			spd = 4;
			
			velh = lerp(velh, 0, 0.03);
			velv = lerp(velv, 0, 0.03);
		}
		else spd = 7;
		
		velh = lengthdir_x(spd, direction);
		velv = lengthdir_y(spd, direction);

		// Collision with pShootable
		with (instance_place(x, y, pShootable))
		{
			if (destructible)
			{
				hp -= other.damage;
				colShootable = true;
				hitFrom = other.direction;
				if (hp < 1) other.create = false;
				if (box) hp -= hp;
					
				instance_destroy(other);
			}
		}
		
	break;
	#endregion
	
	#region THUNDER GUN
	case GUN_TYPES.thunder:
		
		if (setCreateValues)
		{
			velh = lengthdir_x(4, dir);
			velv = lengthdir_y(7, dir);
			setCreateValues	= false;
		}
		
		if (colWater)
		{	
			velh = lerp(velh, 0, 0.08);
			velv = lerp(velv, 0, 0.08);
			grav = .1;
			angleRotate = 3;
		}
		else
		{
			grav = .3;
			angleRotate = 6;
		}
		
		velv += grav;
		
		image_angle += sign(velh) * angleRotate;
		
		// Destroy
		if (place_meeting(x, y, pCollider) || place_meeting(x, y, pShootable)) instance_destroy();
		
	break;
	#endregion
	
	#region ICE GUN
	case GUN_TYPES.iceGun:
		
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
			if (destructible)
			{
				hp--;
				colShootable = true;
				hitFrom = other.direction;
				knockBack = 2;
				if (hp < 1) other.create = false;
				
				if (damagerIceCrea)
				{
					with (instance_create_layer(x, y, "Bullets", oIceDamager))
					{
						followId = other.id;
						followIdXscale = other.image_xscale;
						frozenImageSpeed = other.image_speed;
						other.iceDamagerId = id;
					}
					damagerIceCrea = false;
				}
				
				if (beingIceDamaged) iceDamagerId.resetDestroyIceDamagerTimer = true;
				
				instance_destroy(other);
			}
		}
		
	break;
	#endregion
}

// Being destroyed
if (destroyTimer <= 0) instance_destroy();

// Destroying walls
if (typeBullet != GUN_TYPES.nadeLauncher && typeBullet != GUN_TYPES.thunder)
{
	with (instance_place(x, y, pCollider))
	{
		if (destructible)
		{
			hp -= other.damage;
			raycastCheck = true;
			//with (other) { CreateParticles(x, y, 3, sDestroyedBulletParticle, 50, 4, .2, .3, 2, false, false, room_speed / 1.8, 0, 0, 0); }
		}
		instance_destroy(other);
	}
}

if (typeBullet = GUN_TYPES.sniper) instance_destroy();

x += velh;
y += velv;