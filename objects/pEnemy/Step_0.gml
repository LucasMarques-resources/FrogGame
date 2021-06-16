/// @description Insert description here
// You can write your code in this editor
event_inherited();

VknockBack = flyEnemy;
ground = place_meeting(x, y + 1, oWall);

// States
switch (state)
{
	case STATES.waiting:
		
		sprite_index = spriteWaiting;
		vel_Chase = 0;
		
		var chaseFrog = collision_circle(x, y, radiusChase, oFrog, false, true);
		
		// Chase state
		if (chaseFrog || tookHit)
		{
			state = STATES.chase;
			image_index = 0;
		}
		
	break;
	case STATES.chase:
		
		sprite_index = spriteChase;
		vel_Chase = velChase;
		
		// Decrease timer custom attack
		timerCustomAttack--;
		
		var chaseGetOut = collision_circle(x, y, radiusChaseGetOut, oFrog, false, true);
		var attack = place_meeting(x, y, oFrog);
		var attackRadius = collision_circle(x, y - 10, radiusAttack, oFrog, false, true);
		
		// Moving to player
		var dir = point_direction(x, y, oFrog.x, oFrog.y - oFrog.sprite_height / 2);
		
		velh += lengthdir_x(vel_Chase, dir);
		if (flyEnemy) velv += lengthdir_y(vel_Chase, dir);
		
		// Waiting
		if (!chaseGetOut && !tookHit) state = STATES.waiting;
		
		dirKnock = point_direction(x, y, oFrog.x, oFrog.y);
		
		// Attacking
		if (!customAttack)
		{
			if (attack && oFrog.invulnerable = 0)
			{
				state = STATES.attack;
				image_index = 0;
				global.plHp--;
			}
		}
		else // Custom attack
		{
			if (attackRadius && oFrog.invulnerable = 0 && timerCustomAttack <= 0)
			{
				state = STATES.attack;
				image_index = 0;
			}
		}
	
	break;
	case STATES.attack:
		
		timerAttack--;
		tookHit = true;
		
		// Custom attack
		if (customAttack)
		{
			sprite_index = spriteAttack;
			
			// Creating collision attack
			if (!instance_exists(oSnakeColAttack) && image_index >= 2)
			{
				var col = instance_create_layer(x, y, "Col", colAttack);
				col.image_xscale = image_xscale;
				
				// Set player knock back direction to the collision attack direction
				if (col.image_xscale == 1) dirKnock = 0;
				else dirKnock = 180;
				
				damagePlayer = true;
			}
			
			// Damaging the player
			if (instance_exists(colAttack)
			&& place_meeting(colAttack.x, colAttack.y, oFrog) && damagePlayer)
			{
				global.plHp--;
				damagePlayer = false;
				PlayerKnockBack();
			}
			
			// Go to chase state
			if (image_index > image_number - 1)
			{
				timerCustomAttack = timeCustomAttack;
				state = STATES.chase;
				image_index = 0;
			}
		}
		else // Normal attack
		{
			image_blend = c_red;
			
			// Player knock back
			PlayerKnockBack();
		
			// Coming back to chase state
			if ((oFrog.ground && timerAttack <= room_speed * 0.3) || timerAttack <= 0)
			{
				createDust = true;
				image_blend = c_white;
				state = STATES.chase;
				timerAttack = timeAttack;
				image_index = 0;
			}
		}
		
	break;
}

// Add gravity to some enemys
if (!flyEnemy)
{
	velv += grav;
	if (ground) velv = 0;
}

// Fliping
if (velh != 0) image_xscale = sign(velh);

//show_debug_message(state);