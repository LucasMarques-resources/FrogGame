/// @description Insert description here
// You can write your code in this editor

#region COLLISION WITH pShootable
//Horizontal Collision
if (place_meeting(x + velh, y, pShootable))
{
	repeat (abs(velh) + 1) {
	    if (place_meeting(x + sign(velh), y, pShootable))
	        break;
	    x += sign(velh);
	}
	velh = 0;
}
	
// Vertical pShootable
if (place_meeting(x, y + velv, pShootable))
{
	repeat (abs(velv) + 1) {
	    if (place_meeting(x, y + sign(velv), pShootable))
	        break;
	    y += sign(velv);
	}
	velv = 0;
}
#endregion

#region COLLISION WITH SELF
with(self)
{
    if (object_index != self)
	{
		//Horizontal Collision
        if (place_meeting(x + velh, y, object_index))
		{
			repeat (abs(velh) + 1) {
				if (place_meeting(x + sign(velh), y, object_index))
				    break;
				x += sign(velh);
			}
			if (!colBounce) velh = 0;
			else velh *= -.3;
		}

		// Vertical Collision
		if (place_meeting(x, y + velv, object_index))
		{
			repeat (abs(velv) + 1) {
			    if (place_meeting(x, y + sign(velv), object_index))
			        break;
			    y += sign(velv);
			}
			velv = 0;
		}
        break;
    }
}
#endregion


event_inherited();