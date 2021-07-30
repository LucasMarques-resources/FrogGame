//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texturePixel;

// CREATE EVENT uniformHandle = shader_get_uniform(shOutLine, "texturePixel");
/* DRAW EVENT
shader_set(shOutLine);

var texelW = texture_get_texel_width(sprite_get_texture(sprite_index, image_index));
var texelH = texture_get_texel_height(sprite_get_texture(sprite_index, image_index));

shader_set_uniform_f(uniformHandle, texelW, texelH);
draw_self();

shader_reset();*/

void main()
{
	vec4 endPixel =	v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (texture2D( gm_BaseTexture, v_vTexcoord ).a <= 0.0)
	{
		float alpha = 0.0;
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - texturePixel.x, v_vTexcoord.y)).a);
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + texturePixel.x, v_vTexcoord.y)).a);
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + texturePixel.y)).a);
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - texturePixel.y)).a);
		
		if (alpha != 0.0)
		{
			endPixel = vec4(1.0);
		}
	}
	
	gl_FragColor = endPixel;
}