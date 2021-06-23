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


// Draw gun
draw_sprite_ext(sGunItem, 0, 10, 23, 1, 1, 0, c_white, 1);

draw_set_font(fntText);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

// Draw ammo
draw_text(25, 23, global.ammo);

if (global.ammo < 10)
{
	skipDraw--;
	
	if (global.ammo > 0)
	{
		if (abs(skipDraw) mod 11 < 4)
		{
			// Skip draw
		}
		else
		{
			draw_text(35, 23, "low ammo");
		}
	}
	if (global.ammo <= 0)
	{
		if (draw)
		{
			yy -= 0.2;
			alpha -= 0.02;
			draw_text_color(35, yy, "no ammo", c_white, c_white, c_white, c_white, alpha);
			if (alpha < 0)
			{
				draw = false;
				alpha = 1;
				yy = 23;
			}
		}
	}
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);