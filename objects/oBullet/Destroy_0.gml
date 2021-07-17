/// @description Insert description here
// You can write your code in this editor
if (create)
{
	switch (typeBullet)
	{
		// Default
		default:
		
			instance_create_layer(x, y, "Particles", oMiniExplosion);
			
		break;
		
		case 1:
			
			//part_type_destroy(particleTypeId);
			//part_particles_clear(particleSystem);
			//part_system_destroy(particleSystem);
			
			CleanParticles(particleTypeId, particleSystem, false, noone);
			
			instance_create_layer(x, y, "Particles", oMiniExplosion);
			
		break;
		// Shotgun
		case 2:
		
			with (instance_create_layer(x, y, "Particles", oMiniExplosion)) image_xscale = 1.5; image_yscale = image_xscale;
		
		break;
		// Grenade Launcher
		case 3:
		
			with (instance_create_layer(x, y, "Particles", oExplosion))
			{
				sprite_index = sExplosion2;
				scale = 1.7;
				scaleMin = 1.5;
				CreateParticles(x, y - 5, 8, sPixel, 70, 7, .2, 0.3, 2.5, true, true, room_speed / 1.8, 1, .8, 1.3);
			}
			
			with (instance_create_layer(x, y, "Particles", oExplosionDamager)) damagerRadius = 45;
			
			ScreenShake(7, 6);
		
		break;
	}
}