/// @description desc

// Inherit the parent event
event_inherited();

if (state = STATES.attack)
{
	sprite_index = sflyBugAcidAttack;
	
	flip = false;
	
	if (getAttackScale == noone)
	{
		getAttackScale = sign(oFrog.x - x);
	}
	
	velh = lerp(velh, 0, 0.1);
	velv = lerp(velv, 0, 0.1);
	
	image_speed = 0;
	
	explodeTimer--;
	
	image_xscale += (0.01 * getAttackScale);
	image_yscale = abs(image_xscale);
	
	if (explodeTimer <= 0)
	{
		for (var i = 0; i < 360; i += 45)
		{
			with (instance_create_layer(x, y - 15, "Bullets", oEnemyBullet))
			{
				spd = irandom_range(1, 2);
				grav = random_range(.1, .2);
				gravBullet = true;
				typeBullet = other.typeEnemy;
				direction = i;
				velh = lengthdir_x(spd, direction);
				velv = lengthdir_y(spd, direction);
			}
			instance_destroy();
		}
	}
}
else sprite_index = sflyBugAcidIdle;