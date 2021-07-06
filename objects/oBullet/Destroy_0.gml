/// @description Insert description here
// You can write your code in this editor
if (create)
{
	switch (typeBullet)
	{
		// Normal
		case 0:
		
			instance_create_layer(x, y, "Particles", oMiniExplosion);
		
		break;
		// Fire
		case 1:
		
			with (instance_create_layer(x, y, "Particles", oMiniExplosion)) image_blend = c_orange;
		
		break;
		// Shotgun
		case 2:
		
			with (instance_create_layer(x, y, "Particles", oMiniExplosion)) image_xscale = 1.5; image_yscale = image_xscale;
		
		break;
	}
}