/// @description Insert description here
// You can write your code in this editor
if (!enemy)
{
	if (flash > 0)
	{
		flash--;
		image_speed = 0;
		shader_set(shFlashBlackWhite);
		draw_self();
		shader_reset();
	}
	else
	{
		image_speed = 1;
		draw_sprite_ext(
		sprite_index,
		image_index,
		floor(x),
		floor(y),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
		)
	}
}