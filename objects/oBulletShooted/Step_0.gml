/// @description Insert description here
// You can write your code in this editor

velv += grav;
if (rotate)
	image_angle += 5;


invulnerable = max(invulnerable - 1, 0);

//Vertical
if (place_meeting(x, y + velv, oWall))
{
	while(!place_meeting(x, y + sign(velv), oWall))
	{
		y += sign(velv)
	}
	velv = 0;
	velh = lerp(velh, 0, 0.7);
	if (inv)
	{
		invulnerable = 60;
		inv = false;
	}
	rotate = false;
}

show_debug_message(invulnerable);

/*//Horizontal
if (place_meeting(x + velh, y, oWall))
{
	while(!place_meeting(x + sign(velh), y, oWall))
	{
		x += sign(velh);
	}
	velh *= -.3;
}
*/

y += velv;
x += velh;