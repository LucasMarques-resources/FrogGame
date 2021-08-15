/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

if (flash > 0)
{
	flash--;
	shader_set(shFlashWhite);
	draw_self();
	shader_reset();
}


if (global.debugMode)
{
	draw_circle_color(x, y - 10, radiusAttack, c_red, c_red, true);
	/*
	draw_set_alpha(.2);
	// Area to chase
	draw_circle_color(x, y, radiusChase, c_yellow, c_yellow, false);

	// Area to get out of the chase
	draw_circle_color(x, y, radiusChaseGetOut, c_gray, c_gray, false);
	draw_set_alpha(1);
	*/

	DrawSetText(c_white, fntText, fa_center, fa_bottom, 1);
	draw_text(x, y - 10, string(hp));
}