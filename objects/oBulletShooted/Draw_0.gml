/// @description Insert description here
// You can write your code in this editor
if (invulnerable != 0) && ((invulnerable mod 8 < 2) == 0)
{
	// Skip draw
}
else
{
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