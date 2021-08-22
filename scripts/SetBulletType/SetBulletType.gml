// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SetBulletType(spdWater, spdNormal, _knockBack)
{
	destroyTimer--;
		
	if (colWater)
	{
		spd = spdWater;
			
		velh = lerp(velh, 0, 0.03);
		velv = lerp(velv, 0, 0.03);
	}
	else spd = spdNormal;
		
	velh = lengthdir_x(spd, direction);
	velv = lengthdir_y(spd, direction);

	// Collision with something
	with (instance_place(x, y, pShootable))
	{
		if (destructible)
		{
			hp -= other.damage;
			colShootable = true;
			hitFrom = other.direction;
			knockBack = _knockBack;
			if (hp < 1) other.create = false;
					
			instance_destroy(other);
		}
	}
}