/// @description Insert description here
// You can write your code in this editor
velh = 0;
velv = 0;
grav = 0.4
ground = 0;
bouncingValue = .4;
rotate = true;
inv = true;
invulnerableTimer = room_speed / 3;
invulnerableNumber = 60;
invulnerable = invulnerableNumber;
angleRotate = 5;
collideBoxes = true;

// Particle
partSizeMin = .6
partSizeMax = .8;


enum TYPES_PARTICLE
{
	normal,
	fire
}

particleType = TYPES_PARTICLE.normal;