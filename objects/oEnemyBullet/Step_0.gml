/// @description Insert description here
// You can write your code in this editor

colWater = place_meeting(x, y, oWater);

var dir = point_direction(x, y, mouse_x, mouse_y);

switch (typeBullet)
{
	// Normal
	default:
	{
		destroyTimer--;
		
		if (colWater)
		{
			spd = spdD/2;
			
			velh = lerp(velh, 0, 0.03);
			velv = lerp(velv, 0, 0.03);
		}
		else spd = spdD;
		
		if (gravBullet)
		{
			velv += grav;
		}
		else
		{
			velh = lengthdir_x(spd, direction);
			velv = lengthdir_y(spd, direction);
		}

		// Collision with something
		with (instance_place(x, y, pShootable))
		{
			if (destructible && !enemy)
			{
				hp--;
				colShootable = true;
				hitFrom = other.direction;
				knockBack = 4.5;
				if (hp < 1) other.create = false;
					
				instance_destroy(other);
			}
		}
		if (place_meeting(x, y, oFrog) && oFrog.invulnerable = 0 && !global.plRoll)
		{
			dirKnock = point_direction(x, y, oFrog.x, oFrog.y);
			
			ScreenShake(2, 6);
			global.plHp--;
			PlayerKnockBack();
			
			instance_destroy();
		}
	}
	break;
}

// Being destroyed
if (destroyTimer <= 0) instance_destroy();

// Destroying walls
with (instance_place(x, y, pCollider))
{
	if (destructible)
	{
		hp -= other.damage;
		raycastCheck = true;
	}
	instance_destroy(other);
}

x += velh;
y += velv;