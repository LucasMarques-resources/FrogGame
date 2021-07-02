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
	shader_set(shFlashWhite);
	image_xscale = xscaleSaved;
	draw_self();
	shader_reset();
}
else if (state = STATES.chase)
{
	image_speed = 1;
	xscaleSaved = image_xscale;
}


//draw_circle_color(x, y - 10, radiusAttack, c_red, c_red, true);

/*
draw_set_alpha(.2);
// Area to chase
draw_circle_color(x, y, radiusChase, c_yellow, c_yellow, false);

// Area to get out of the chase
draw_circle_color(x, y, radiusChaseGetOut, c_gray, c_gray, false);
draw_set_alpha(1);

