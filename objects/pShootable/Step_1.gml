/// @description Insert description here
// You can write your code in this editor

// Destroying
if (hp <= 0) 
{
	instance_create_layer(x, y, "Particles", oExplosion,)
	instance_destroy();
}

// Stop knock back
if (velh != 0)
{
	velh = lerp(velh, 0, 0.1);
	velv = lerp(velv, 0, 0.1);
}

x += velh;
y += velv;