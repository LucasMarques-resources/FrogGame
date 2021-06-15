/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	xscaleSaved,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

if (flash > 0)
{
	flash--;
	image_speed = 0;
	shader_set(shFlashWhite);
	image_xscale = xscaleSaved;
	draw_self();
	shader_reset();
}
else
{
	image_speed = 1;
	xscaleSaved = image_xscale;
}