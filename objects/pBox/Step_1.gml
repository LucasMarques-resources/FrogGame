/// @description Insert description here
// You can write your code in this editor

#region COLLISION WITH ENEMY
//Horizontal Collision
if (place_meeting(x + velh, y, pEnemy))
{
	while (!place_meeting(x + sign(velh), y, pEnemy))
	{
		x += sign(velh);
	}
	velh = 0;
}
	
// Vertical Collision
if (place_meeting(x, y + velv, pEnemy))
{
	while (!place_meeting(x, y + sign(velv), pEnemy))
	{
		y += sign(velv);
	}
	velv = 0;
}
#endregion

// Make player unable to jump under a box
if (place_meeting(x, y + velv, oFrog)) oFrog.canJump = false;
else oFrog.canJump = true;

event_inherited();