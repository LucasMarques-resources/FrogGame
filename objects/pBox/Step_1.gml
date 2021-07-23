/// @description Insert description here
// You can write your code in this editor

#region COLLISION WITH pSHOOTABLE
// Horizontal Collision
var col = instance_place(x + velh, y, pShootable)
if (col && col.colBox)
{
	repeat (abs(velh) + 1) {
	    if (place_meeting(x + sign(velh), y, pShootable))
	        break;
	    x += sign(velh);
	}
	with (instance_place(x + velh, y, pShootable))
	{
		velh = sign(other.velh);
		beingDragged = true;
	}
	velh = 0;
}
	
// Vertical Collision pSHOOTABLE
var col = instance_place(x, y + velv, pShootable)
if (col && col.colBox)
{
	repeat (abs(velv) + 1) {
		if (place_meeting(x, y + sign(velv), pShootable))
			break;
		y += sign(velv);
	}
	if (velv > distDestroy) hp -= hp;
	velv = 0;
}

// Vertical Collision pCOLLIDER
if (place_meeting(x, y + velv, pCollider))
{
	repeat (abs(velv) + 1) {
		if (place_meeting(x, y + sign(velv), pCollider))
			break;
		y += sign(velv);
	}
	if (velv > distDestroy) hp -= hp;
	velv = 0;
}


#endregion

event_inherited();