// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sCollisions(object, scondCol, object2)
{
	if (place_meeting(x + velh, y, object))
	{
		while (!place_meeting(x + sign(velh), y, object))
		{
			x += sign(velh);
		}
		with (instance_place(x + velh, y, object))
		{
			if (drag) velh = sign(other.velh);
			if (bounce)
			{	
				if (!collision) velh = 0;
				else velh *= -.3;
			}
		}
		velh = 0;
	}
	
	x += velh;

	if (place_meeting(x, y + velv, object))
	{
		while (!place_meeting(x, y + sign(velv), object))
		{
			y += sign(velv);
		}
		velv = 0;
	}
	
	if (scondCol)
	{
		if (place_meeting(x, y + velv, object2))
		{
			while (!place_meeting(x, y + sign(velv), object2))
			{
				y += sign(velv);
			}
			velv = 0;
		}
	}

	y += velv;
}