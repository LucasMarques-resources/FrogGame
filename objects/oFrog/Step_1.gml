/// @description Insert description here
// You can write your code in this editor

var temp = place_meeting(x, y + 1, oWall);

if (temp && !ground) //Acabei de tocar no chao
{
	instance_create_layer(x, y, "Particles", oFallParticle);
}