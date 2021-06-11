/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case STATES.waiting:
		
		image_blend = c_green;
		
		vel_Chase = 0;
		
		var chaseFrog = collision_circle(x, y, radiusChase, oFrog, false, true);
		
		if (chaseFrog || tookHit)
		{
			state = STATES.chase;
		}
		
	break;
	case STATES.chase:
		
		image_blend = c_yellow;
	
		vel_Chase = velChase;
	
		var chaseGetOut = collision_circle(x, y, radiusChaseGetOut, oFrog, false, true);
		var attack = place_meeting(x, y, oFrog);
	
		var dir = point_direction(x, y, oFrog.x, oFrog.y - oFrog.sprite_height / 2);
		velh += lengthdir_x(vel_Chase, dir);
		velv += lengthdir_y(vel_Chase, dir);
	
		if (!chaseGetOut && !tookHit) state = STATES.waiting;
		
		if (attack)
		{
			dirKnock = point_direction(x, y, oFrog.x, oFrog.y);
			state = STATES.attack;
		}
	
	break;
	case STATES.attack:
		
		image_blend = c_red;
		timerAttack--;
		
		with (oFrog)
		{
			state = PlStates.knockBack;
			//var dir = point_direction(other.x, other.y, x, y);
			if (other.dirKnock > 90 && other.dirKnock < 270) knockBackDir = 135;
			else knockBackDir = 45;
		}
		
		if (oFrog.ground || timerAttack <= 0)
		{
			state = STATES.waiting;
			timerAttack = timeAttack;
		}
		
		
	break;
}
//show_debug_message(state);