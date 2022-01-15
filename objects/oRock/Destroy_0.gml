/// @description desc

with (instance_create_layer(x, y, "Particles", oExplosion)) scale = other.explosionScale;

var amount = particlesAmount;

CreateParticles(x, y, amount, particlesSprite, 100, particleScale, .2, .3, 2.5, true, false, room_speed / 1.8, 0, 0, 0, true);