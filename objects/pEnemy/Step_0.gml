/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case STATES.waiting:
		
		vel_Chase = 0;
		
		var chaseFrog = collision_circle(x, y, radiusChase, oFrog, false, true);
		
		if (chaseFrog || tookHit)
		{
			state = STATES.chase;
		}
		
	break;
	case STATES.chase:
		
		sprite_index = spriteChase;
	
		vel_Chase = velChase;
	
		var chaseGetOut = collision_circle(x, y, radiusChaseGetOut, oFrog, false, true);
		var attack = place_meeting(x, y, oFrog);
	
		var dir = point_direction(x, y, oFrog.x, oFrog.y - oFrog.sprite_height / 2);
		velh += lengthdir_x(vel_Chase, dir);
		velv += lengthdir_y(vel_Chase, dir);
	
		if (!chaseGetOut && !tookHit) state = STATES.waiting;
		
		if (attack && oFrog.invulnerable = 0)
		{
			dirKnock = point_direction(x, y, oFrog.x, oFrog.y);
			state = STATES.attack;
		}
	
	break;
	case STATES.attack:
		
		image_blend = c_red;
		timerAttack--;
		tookHit = true;
		
		with (oFrog)
		{
			if (other.miniExpo)
			{
				instance_create_layer(x, y - 10, "Particles", oMiniExplosion);
				other.miniExpo = false;
			}
			state = PlStates.knockBack;
			//var dir = point_direction(other.x, other.y, x, y);
			if (other.dirKnock > 90 && other.dirKnock < 270) knockBackDir = 135;
			else knockBackDir = 45;
		}
		
		if ((oFrog.ground && timerAttack <= room_speed * 0.3) || timerAttack <= 0)
		{
			miniExpo = true;
			image_blend = c_white;
			state = STATES.chase;
			timerAttack = timeAttack;
		}
		
		
	break;
}

if (velh != 0) image_xscale = sign(velh);
//show_debug_message(state);