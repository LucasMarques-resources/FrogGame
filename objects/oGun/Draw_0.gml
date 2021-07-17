/// @description Insert description here
// You can write your code in this editor
if (invulnerable != 0) && (invulnerable mod 8 < 2) && (flash == 0)
{
	// Skip draw
}
else
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

if (drawInitialBulletSprite)
{
	// Create bullet
	if (global.ammo > 0)
	{
		var dir = point_direction(x, y, mouse_x, mouse_y);
		
		draw_sprite(sDust, 0, x + lengthdir_x(15, dir), y + lengthdir_y(10, dir) - 3);
	}
}