/// @description Insert description here
// You can write your code in this editor

if (invulnerable != 0) && (invulnerable mod 8 < 2) && (flash == 0)
{
	// Skip draw
}
else
{
	switch (typeGun)
	{
		case GUN_TYPES.sniper:
		
			var dir = image_angle;
			for (var i = 0; i < sniperBulletRange; i++)
			{
				var xx = x + lengthdir_x(i, dir);
				var yy = y + lengthdir_y(i, dir);
		
				// Colliding with the some object
				var _other = collision_line(x, y, xx, yy, pShootable, 1, 1);
				var _coll = collision_line(x, y, xx, yy, pCollider, 1, 1);
				var _colWater = collision_line(x, y, xx, yy, oWater, 1, 1);

				draw_line_color(x, y, xx, yy, c_red, c_red);

				if (_other || _coll)
				{
					sniperRaycastChecked = true;
					sniperRaycastCheckedX = xx;
					sniperRaycastCheckedY = yy;
					break;
				}
				else
				{
					sniperRaycastChecked = true;
					sniperRaycastCheckedX = x + lengthdir_x(sniperBulletRange, dir);
					sniperRaycastCheckedY = y + lengthdir_y(sniperBulletRange, dir);
				}
			}
		
		break;
	}	
	
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

/*
if (drawInitialBulletSprite)
{
	// Create bullet
	var dir = point_direction(x, y, mouse_x, mouse_y);
		
	draw_sprite(sDust, 0, x + lengthdir_x(15, dir), y + lengthdir_y(10, dir) - 3);
}
*/