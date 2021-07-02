/// @description Insert description here
// You can write your code in this editor

invulnerableTimer--;

velv += grav;
if (rotate)
	image_angle += angleRotate;


if (invulnerableTimer <= 0)
{
	invulnerable = max(invulnerable - 1, 0);
	if (invulnerable <= 0) instance_destroy();
}

//Vertical
if (place_meeting(x, y + velv, oWall))
{
	repeat (abs(velv) + 1) {
	    if (place_meeting(x, y + sign(velv), oWall))
	        break;
	    y += sign(velv);
	}
	velv *= -bouncingValue;
	velh = lerp(velh, 0, 0.7);
	if (inv)
	{
		invulnerable = invulnerableNumber;
		inv = false;
	}
	rotate = false;
}

//Horizontal
if (place_meeting(x + velh, y, oWall))
{
	repeat (abs(velh) + 1) {
	    if (place_meeting(x + sign(velh), y, oWall))
	        break;
	    x += sign(velh);
	}
	velh *= -bouncingValue;
}

if (collideBoxes)
{
	//Vertical
	if (place_meeting(x, y + velv, pBox))
	{
		repeat (abs(velv) + 1) {
		    if (place_meeting(x, y + sign(velv), pBox))
		        break;
		    y += sign(velv);
		}
		velv = 0;
		velh = lerp(velh, 0, 0.7);
		if (inv)
		{
			invulnerable = invulnerableNumber;
			inv = false;
		}
		rotate = false;
	}

	//Horizontal
	if (place_meeting(x + velh, y, pBox))
	{
		repeat (abs(velh) + 1) {
		    if (place_meeting(x + sign(velh), y, pBox))
		        break;
		    x += sign(velh);
		}
		velh *= -bouncingValue;
	}
}


y += velv;
x += velh;