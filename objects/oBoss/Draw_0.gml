/// @description desc
draw_self();

if (drawLeg1)
{
	draw_sprite_ext(sBossLeg1, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
}
if (drawLeg2)
{
	draw_sprite_ext(sBossLeg2, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
}
if (drawLeg3)
{
	draw_sprite_ext(sBossLeg3, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
}
if (drawLeg4)
{
	draw_sprite_ext(sBossLeg4, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
}

draw_text(x, y - 30, bossState);