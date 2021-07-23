/// @description desc


instance_create_layer(x, y, "Particles", oExplosion);
with (instance_create_layer(x, y, "Particles", oExplosion))
{
	sprite_index = sExplosion2;
	scale = 1.9;
	scaleMin = 1.8;
}

with (instance_create_layer(x, y, "Particles", oExplosionDamager))
{
	damagerRadius = 40;
	scale = 1.5;
	scaleMin = 1.2;
}