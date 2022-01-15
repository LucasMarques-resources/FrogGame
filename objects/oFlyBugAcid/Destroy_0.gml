/// @description desc

if (explodeTimer > 0)
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
	}
}

ScreenShake(5, 5);

// Inherit the parent event
event_inherited();