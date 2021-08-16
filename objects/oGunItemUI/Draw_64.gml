/// @description desc
if (global.hasGun)
{
	// Draw gun
	for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
	{
		if (global.gunsGrid[# i, 0] != GUN_TYPES.none)
		{
			if (global.gunsGrid[# i, 0] = global.currentGun.id)
			{
				shader_set(shOutLine);
			
				var texelW = texture_get_texel_width(sprite_get_texture(sprite_index, image_index));
				var texelH = texture_get_texel_height(sprite_get_texture(sprite_index, image_index));

				shader_set_uniform_f(uniformHandle, texelW, texelH);
			
				draw_sprite_ext(sprite_index, global.gunsGrid[# i, 1], (30 * i) + 10, 25, 1, 1, 0, c_white, 1);
			
				shader_reset();
			}
			else
			{
				draw_sprite_ext(sprite_index, global.gunsGrid[# i, 1], (30 * i) + 10, 25, 1, 1, 0, c_white, 1);
			}
		}
	}
}