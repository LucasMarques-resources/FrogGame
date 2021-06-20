/// @description Insert description here
// You can write your code in this editor

#region COLLISION WITH BOXES
//Horizontal Collision
if (place_meeting(x + velh, y, pBox))
{
	while (!place_meeting(x + sign(velh), y, pBox))
	{
		x += sign(velh);
	}
	velh = 0;
}
	
// Vertical Collision
if (place_meeting(x, y + velv, pBox))
{
	while (!place_meeting(x, y + sign(velv), pBox))
	{
		y += sign(velv);
	}
	velv = 0;
}
#endregion

event_inherited();