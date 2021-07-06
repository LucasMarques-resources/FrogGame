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
		// Shotgun
		case 2:
		
			with (instance_create_layer(x, y, "Particles", oMiniExplosion)) image_xscale = 1.5; image_yscale = image_xscale;
		
		break;
		// Grenade Launcher
		case 3:
		
			with (instance_create_layer(x, y, "Particles", oExplosion))
			{
				scale = 1.7;
				scaleMin = 1.5;
			}
			
			with (instance_create_layer(x, y, "Particles", pDamager)) damagerRadius = 45;
			
			ScreenShake(5, 6);
		
		break;
	}
}