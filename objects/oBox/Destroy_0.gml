/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var particle_type = 0;
if (beingDamaged || createFireParticles) particle_type = 1;

CreateParticles(x + sprite_width / 2, y, 5, sBox1Particle, 70, 7, .7, 0.2, 1.7, false, true, room_speed / 1.8, particle_type, .6, .8);