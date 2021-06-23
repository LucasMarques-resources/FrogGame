/// @description Insert description here
// You can write your code in this editor

// Draw life top UI
draw_sprite_ext(
	sLifeTopUI,
	image_index,
	floor(2),
	floor(1),
	global.lifeTopXscale + (0.18 * addedLifes) + (0.01 * addedLifes),
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

draw_sprite_ext(sGunItem, 0, 10, 23, 1, 1, 0, c_white, 1);
draw_set_font(fntText);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_text(25, 23, global.ammo);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);

// Draw destroyed life
for (var i = 0; i < global.plTotalHp; i++)
{
	draw_sprite(sLifeUI, 1, 9 + 12 * i, 7);
}

// Draw on top of destroyed life the normal life
for (var i = 0; i < global.plHp; i++)
{
	draw_sprite(sLifeUI, 0, 9 + 12 * i, 7);
}