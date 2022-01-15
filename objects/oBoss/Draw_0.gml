/// @description desc

draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x-1),
	floor(y-1),
	image_xscale,
	image_yscale, 
	image_angle,
	c_black,
	0.5,
	)

draw_sprite_ext(sprite_index, image_index, x, y, xscale * see, yscale, image_angle, image_blend, image_alpha);

if (drawLeg1)
{
	draw_sprite_ext(sBossLeg1, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (drawLeg2)
{
	draw_sprite_ext(sBossLeg2, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (drawLeg3)
{
	draw_sprite_ext(sBossLeg3, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (drawLeg4)
{
	draw_sprite_ext(sBossLeg4, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (drawLeftWind)
{
	draw_sprite_ext(sBossLeftWind, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (drawRightWind)
{
	draw_sprite_ext(sBossRightWind, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
/*
draw_text(x, y - 30, bossState);
draw_text(x, y - 50, hp);