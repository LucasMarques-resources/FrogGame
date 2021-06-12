/// @description Insert description here
// You can write your code in this editor

// States
switch (state)
{
	case STATES.waiting:
		
		vel_Chase = 0;
		
		var chaseFrog = collision_circle(x, y, radiusChase, oFrog, false, true);
		
		// Chase state
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
		// Moving to player
		var dir = point_direction(x, y, oFrog.x, oFrog.y - oFrog.sprite_height / 2);
		velh += lengthdir_x(vel_Chase, dir);
		velv += lengthdir_y(vel_Chase, dir);
		
		// Waiting
		if (!chaseGetOut && !tookHit) state = STATES.waiting;
		
		// Attcking
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
				// Hurt enemy when jumping above him
				other.hp--;
				other.tookHit = true;
				other.flash = 30;
				
				// Create mini explosion
				instance_create_layer(x, y - 10, "Particles", oMiniExplosion);
				other.miniExpo = false;
			}
			// Knock back player state
			state = PlStates.knockBack;
			if (other.dirKnock > 90 && other.dirKnock < 270) knockBackDir = 135;
			else knockBackDir = 45;
		}
		
		// Coming back to chase state
		if ((oFrog.ground && timerAttack <= room_speed * 0.3) || timerAttack <= 0)
		{
			miniExpo = true;
			image_blend = c_white;
			state = STATES.chase;
			timerAttack = timeAttack;
		}
		
		
	break;
}

// Fliping
if (velh != 0) image_xscale = sign(velh);

//show_debug_message(state);