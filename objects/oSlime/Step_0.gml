/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (state = STATES.chase && !colWater)
{
	timerJump--;
	if (timerJump <= 0)
	{
		velv -= 5;
		velh += lengthdir_x(1, point_direction(x, y, oFrog.x, oFrog.y));
		timerJump = room_speed;
	}
}