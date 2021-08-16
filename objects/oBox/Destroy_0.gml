/// @description Insert description here
// You can write your code in this editor

event_inherited();

var particle_type = 0;
if (beingFireDamaged || createFireParticles) particle_type = 1;

CreateParticles(x + sprite_width / 2, y, 5, sBox1Particle, 70, 1, .7, 0.2, 1.7, false, true, room_speed / 1.3, particle_type, .6, .8);