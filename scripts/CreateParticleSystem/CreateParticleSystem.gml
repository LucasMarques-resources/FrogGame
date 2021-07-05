// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function CreateParticleSystem(sprite, lifeMin, lifeMax, sizeMin, sizeMax, color1, color2, dirMin, dirMax, spdMin, spdMax, alpha1, alpha2, alpha3)
{
	var myParticle = part_type_create();

	part_type_sprite(myParticle, sprite, false, false, false);
	part_type_life(myParticle, lifeMin, lifeMax);
	part_type_size(myParticle, sizeMin, sizeMax, 0, 0);
	part_type_orientation(myParticle, 0, 359, 0, 20, 1);
	part_type_color2(myParticle, color1, color2)
	part_type_blend(myParticle, true);
	part_type_direction(myParticle, dirMin, dirMax, 1, 1);
	part_type_speed(myParticle, spdMin, spdMax, .01, .01);
	part_type_alpha3(myParticle, alpha1, alpha2, alpha3);
	
	return myParticle;
}