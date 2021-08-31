/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (state = STATES.attack)
{
	if (jump)
	{
		var dir = ((sign(x - oFrog.x)) * -1);
		if (dir == 1) var _dir = 45;
		else if (dir == -1) var _dir = 135;
		
		var dist = point_distance(x, y, oFrog.x, oFrog.y);
		var velH = 3;
		if (dist <= 50) velH = dist / 16;
		else velH = 3;
		
		velh = lengthdir_x(velH, _dir);
		velv -= 4;
		
		ground = false;
		
		jump = false;
		jumped = true;
	}
	if (jumped)
	{
		timerGetBackToChaseState--;
	}
	if (timerGetBackToChaseState <= 0)
	{
		getBackToChaseState = true;
	}
	if (getBackToChaseState && (place_meeting(x, y + velv, pCollider) || ground))
	{
		timerCustomAttack = timeCustomAttack;
		state = STATES.chase;
		jump = true;
		jumped = false;
		getBackToChaseState = false;
		timerGetBackToChaseState = 30;
	}
	
	if (place_meeting(x, y, oFrog) && oFrog.invulnerable = 0 && !global.plRoll)
	{
		hp--;
		flash = 7;
		ScreenShake(2, 6);
		global.plHp--;
		image_index = 0;
		state = STATES.hurt;
		PlayerKnockBack();
	}
	
}
else
{
	jump = true;
	jumped = false;
	getBackToChaseState = false;
	timerGetBackToChaseState = 30;
}