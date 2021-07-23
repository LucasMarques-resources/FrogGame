/// @description Insert description here
// You can write your code in this editor
event_inherited();

VknockBack = flyEnemy;
ground = place_meeting(x, y + 1, pCollider);
colWater = place_meeting(x, y, oWater);

// States
switch (state)
{
	#region WAITING
	case STATES.waiting:
		
		sprite_index = spriteWaiting;
		vel_Chase = 0;
		
		// Reattack timer
		if (reattackTimer > 0) reattackTimer--;
		
		var chaseFrog = collision_circle(x, y, radiusChase, oFrog, false, true);
		
		// Chase state
		if (customAttack)
		{
			if (reattackTimer <= 0 && chaseFrog)
			{
				state = STATES.chase;
				image_index = 0;	
			}
		}
		else if (chaseFrog || tookHit) // Chase state
		{
			state = STATES.chase;
			image_index = 0;
		}
		
	break;
	#endregion
	
	#region CHASE
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
				ScreenShake(2, 6);
			}
		}
		else // Custom attack
		{
			if (attackRadius && oFrog.invulnerable = 0 && timerCustomAttack <= 0)
			{
				createColAttack = true;
				state = STATES.attack;
				image_index = 0;
			}
		}
	
	break;
	#endregion
	
	#region ATTACK
	case STATES.attack:
		
		timerAttack--;
		tookHit = true;
		
		// Custom attack
		if (customAttack)
		{
			sprite_index = spriteAttack;
			
			// Creating collision attack
			if (createColAttack && image_index >= 2)
			{
				createDust = true;
				
				var col = instance_create_layer(x, y, "Particles", colAttack);
				col.image_xscale = image_xscale;
				
				// Set player knock back direction to the collision attack direction
				if (col.image_xscale == 1) dirKnock = 0;
				else dirKnock = 180;
				
				damagePlayer = true;
				createColAttack = false;
			}
			
			var colAtt = instance_place(oFrog.x, oFrog.y, colAttack);
			// Damaging the player
			if (instance_exists(colAttack) && oFrog.state != PlStates.knockBack && damagePlayer && colAtt && !colAtt.disable)
			{
				global.plHp--;
				ScreenShake(2, 6);
				damagePlayer = false;
				PlayerKnockBack();
			}
			
			// Go to waiting state
			if (image_index >= image_number - 1)
			{
				timerCustomAttack = timeCustomAttack;
				reattackTimer = reattackTime;
				state = STATES.waiting;
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
	#endregion
	
	#region HURT
	case STATES.hurt:
		
		hurtTimer--;
		
		if (spriteHurt) sprite_index = spriteHurt;
		
		tookHit = true;
		
		if (instance_exists(colAttack)) instance_destroy(colAttack);
		
		if (spriteHurt)
		{
			if (image_index > image_number - 1)
			{
				velh = 0;
				state = STATES.chase;
			}
		}
		else if (hurtTimer <= 0)
		{
			velh = 0;
			state = STATES.chase;
			hurtTimer = hurtTime;
		}
		
	break;
	#endregion
}

// Water
if (colWater)
{
	if (!flyEnemyD) flyEnemy = true;
	if (customAttackD)	customAttack = false;
}
else
{
	if (!flyEnemyD) flyEnemy = false;
	if (customAttackD) customAttack = true;
}

// Normal player collision with enemy
if (customAttack && !instance_exists(colAttack))
{
	if (place_meeting(x, y, oFrog) && oFrog.invulnerable = 0)
	{
		global.plHp--;
		ScreenShake(2, 6);
		PlayerKnockBack();
	}
}

// Add gravity to some enemies
if (!flyEnemy)
{
	velv += grav;
	if (ground) velv = 0;
}



// Fliping
if (velh != 0 && state != STATES.hurt) image_xscale = sign(velh);

//show_debug_message(state);