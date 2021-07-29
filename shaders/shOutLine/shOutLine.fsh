//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texturePixel;

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