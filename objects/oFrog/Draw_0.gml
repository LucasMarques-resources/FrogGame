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
		if (state != PlStates.swim) image_speed = 1;
		
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

if (instance_exists(oExplosionDamager))
{
	with (oExplosionDamager)
	{
		// Take damage to shootables
		var list = ds_list_create();
		var num = collision_circle_list(x, y, damagerRadius, pShootable, false, true, list, false);
		if (num > 0)
		{
			show_debug_message("COL CIRCLE");
			for (var i = 0; i < num; ++i)
			{
				show_debug_message("FOR && ARRAY " + string(list[|i].id) + " " + string(point_direction(x, y, list[| i].x, list[| i].y)));
				var r = Raycast(damagerRadius, list[| i], point_direction(x, y, list[| i].x, list[| i].y));
			}
		}
		ds_list_destroy(list);
	}
}