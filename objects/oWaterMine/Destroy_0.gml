/// @description desc
ScreenShake(10, 10);

instance_create_layer(x, y, "Particles", oExplosion);
with (instance_create_layer(x, y, "Particles", oExplosion))
{
	sprite_index = sExplosion2;
	scale = 1.8;
	scaleMin = 1.6;
}

var expo = instance_create_layer(x, y, "Particles", oExplosionDamager)
expo.damagerRadius = 40;