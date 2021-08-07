/// @description desc

gpu_set_blendmode(bm_add);

for (var i = 0; i < trailParts-1; i++)
{
	var scale = random_range(2, 3);
	draw_sprite_ext(sThunderLight, 0, arrayPosX[i], arrayPosY[i], scale, scale, glowArrayAngle[i], color, 0.1);
	draw_line_width(arrayPosX[i], arrayPosY[i], arrayPosX[i+1], arrayPosY[i+1], lineScale);
	
	if ((collision_line(arrayPosX[i], arrayPosY[i], arrayPosX[i+1], arrayPosY[i+1], pCollider, 0, 0)
	|| collision_line(arrayPosX[i], arrayPosY[i], arrayPosX[i+1], arrayPosY[i+1], pShootable, 0, 0)))
	{
		if (createThunderDamager)
		{
			var expo = instance_create_layer(arrayPosX[i], arrayPosY[i], "Particles", oThunderDamager);
			createThunderDamager = false;
		}
		break;
	}
	/*
	with (collision_line(arrayPosX[i], arrayPosY[i], arrayPosX[i+1], arrayPosY[i+1], pShootable, 0, 0))
	{
		if (destructible)
		{
			hp -= 5;
			colShootable = true;
			knockBack = irandom_range(2.3, 3.7);
			hitFrom = point_direction(other.x, other.y, x, y);
			if (oBox) createFireParticles = true;
		}
	}
	*/
}

draw_sprite_ext(sThunderLightBall, 0, arrayPosX[0], arrayPosY[0], 2, 2, 0, color, 0.1);

gpu_set_blendmode(bm_normal);