/// @description Insert description here
// You can write your code in this editor

var temp = place_meeting(x, y + 1, pCollider);

if (temp && !ground)
{
	instance_create_layer(x, y, "Particles", oFallParticle);
}