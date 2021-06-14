/// @description Insert description here
// You can write your code in this editor
image_angle -= angle;

if (scaleMove)
{
	if (image_index <= 4)
	{
		image_xscale = lerp(image_xscale, scale, 0.8);
		image_yscale = image_xscale;
	}
	else
	{
		image_xscale = lerp(image_xscale, 1, 0.2);
		image_yscale = image_xscale;	
	}
}