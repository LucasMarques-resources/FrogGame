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
	with (instance_place(x + velh, y, pShootable))
	{
		velh = sign(other.velh);
		beingDragged = true;
	}
	velh = 0;
}
	
// Vertical Collision pShootable
VerticalCollision(pShootable, false, 0, 0);

#endregion

event_inherited();