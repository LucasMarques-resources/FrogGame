// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateParticles(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13, argument14){
	/// @arg x
	/// @arg y
	/// @arg amount
	/// @arg sprite
	/// @arg invulnerableNumber
	/// @arg angleRotate
	/// @arg bouncingValue
	/// @arg grav
	/// @arg vel
	/// @arg colideWithBoxes
	/// @arg randomScale
	/// @arg invulnerableTimer
	/// @arg particleType
	/// @arg partSizeMin
	/// @arg partSizeMax
	
	for (var i = 0; i < argument2; i++)
	{
		var _angle = choose(135, 120, 30, 140, 60, 45, 80, 89, 100);
		with (instance_create_layer(argument0, argument1, "Particles", pParticleComplex))
		{
			image_speed = 0;
			sprite_index = argument3;
			direction = _angle;
			image_index = i;
			invulnerableNumber = argument4;
			angleRotate = argument5;
			bouncingValue = argument6;
			grav = argument7;
			velh += lengthdir_x(argument8, _angle);
			velv += lengthdir_y(argument8, _angle);
			collideBoxes = argument9;
			invulnerableTimer = argument11;
			
			// Second particle
			particleType = argument12;
			partSizeMin = argument13;
			partSizeMax = argument14;
			
			if (argument10)
			{
				image_xscale = random_range(1, 1.4);
				image_yscale = image_xscale;
			}
		}
	}
}