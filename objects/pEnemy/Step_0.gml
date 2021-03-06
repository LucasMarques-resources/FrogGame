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
		velh = 0;
		if (flyEnemy) velv = 0;
		
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
		
		vel_Chase = vel_ChaseD;
		
		// Decrease timer custom attack
		timerCustomAttack--;
		
		var chaseGetOut = collision_circle(x, y, radiusChaseGetOut, oFrog, false, true);
		var attackRadius = collision_circle(x, y - 5, radiusAttack, oFrog, false, true);
		var shooterEnemyRadius = collision_circle(x, y - 5, radiusShooterEnemy, oFrog, false, true);
		
		// Moving to player
		var dir = point_direction(x, y, oFrog.x, oFrog.y - oFrog.sprite_height / 2);
		
		if (!stopChase)
		{
			velh = lengthdir_x(vel_Chase, dir);
			if (flyEnemy) velv = lengthdir_y(vel_Chase, dir);
		}
		
		// Waiting
		if (!chaseGetOut && !tookHit)
		{
			state = STATES.waiting;
			image_index = 0;
		}
		
		dirKnock = point_direction(x, y, oFrog.x, oFrog.y);
		
		// Attacking
		if (!shooterEnemy)
		{
			if (customAttack || ownCustomAttack) // Custom attack
			{
				if (attackRadius && oFrog.invulnerable = 0 && timerCustomAttack <= 0)
				{
					createColAttack = true;
					state = STATES.attack;
					image_index = 0;
				}
			}
		} // Shooter Enemy
		else if (shooterEnemyRadius)
		{
			state = STATES.shoot;
			image_index = 0;
		}
	
	break;
	#endregion
	
	#region ATTACK
	case STATES.attack:
		
		if (!ownCustomAttack)
		{
			velh = 0;
			if (!flyEnemy) velv = 0;
			
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
				if (instance_exists(colAttack) && !global.plRoll && damagePlayer && colAtt && !colAtt.disable && oFrog.invulnerable = 0)
				{
					ScreenShake(2, 6);
					damagePlayer = false;
					global.plHp--;
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
				// Player knock back
				PlayerKnockBack();
		
				// Coming back to chase state
				if ((oFrog.ground && timerAttack <= room_speed * 0.3) || timerAttack <= 0)
				{
					createDust = true;
					state = STATES.chase;
					timerAttack = timeAttack;
					image_index = 0;
				}
			}
		}
		
	break;
	#endregion
	
	#region SHOOT
	case STATES.shoot:
		
		velh = lerp(velh, 0, 0.01);
		velv = lerp(velv, 0, 0.01);
		
		firingDelay--;
		
		if (firingDelay <= 0)
		{
			var dir = point_direction(x, y, oFrog.x, oFrog.y - 10);
			for (var i = 1; i > -(numberOfBullets - 1); i--)
			{
				with (instance_create_layer(x, y, "Bullets", oEnemyBullet))
				{
					spd = other.spd;
					spdD = spd;
					typeBullet = other.typeEnemy;
					if (other.numberOfBullets == 1) direction = dir;
					else direction = dir + i * 12;
					image_angle = direction;
				}
			}
			firingDelay = firingDelayD;
		}
		
		// Moving to player
		var dir = point_direction(x, y, oFrog.x, oFrog.y - oFrog.sprite_height / 2);
		
		velh = lengthdir_x(vel_Chase, dir);
		if (flyEnemy) velv = lengthdir_y(vel_Chase, dir);
		
	break;
	#endregion
	
	#region HURT
	case STATES.hurt:
		
		hurtTimer--;
		
		velh = lerp(velh, 0, 0.1);
		velv = lerp(velv, 0, 0.1);
		
		image_blend = c_red;
		
		tookHit = true;
		
		if (instance_exists(colAttack)) instance_destroy(colAttack);
		
		if (spriteHurt)
		{
			sprite_index = spriteHurt;
			
			if (image_index >= image_number - 1)
			{
				velh = 0;
				image_blend = c_white;
				state = STATES.chase;
				image_index = 0;
			}
		}
		else if (hurtTimer <= 0)
		{
			image_blend = c_white;
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
if ((state != STATES.attack) && place_meeting(x, y, oFrog) && oFrog.invulnerable = 0 && !global.plRoll)
{
	hp--;
	flash = 7;
	ScreenShake(2, 6);
	global.plHp--;
	state = STATES.hurt;
	image_index = 0;
	PlayerKnockBack();
}

// Add gravity to some enemies
if (!flyEnemy)
{
	velv += grav;
	if (ground) velv = 0;
}

// Fliping
if (velh != 0 && state != STATES.hurt && !beingIceDamaged && flip) image_xscale = sign(velh);

//show_debug_message(state);