/// @description desc

if (drawOutLine)
{
	shader_set(shOutLine);

	var texelW = texture_get_texel_width(sprite_get_texture(sprite_index, image_index));
	var texelH = texture_get_texel_height(sprite_get_texture(sprite_index, image_index));

	shader_set_uniform_f(uniformHandle, texelW, texelH);
	draw_self();

	shader_reset();
}
else draw_self();