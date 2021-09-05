/// @description desc

if (hp <= (initialHp/5) * 4) drawLeg1 = false;
if (hp <= (initialHp/5) * 3) drawLeg2 = false;
if (hp <= (initialHp/5) * 2) drawLeg3 = false;
if (hp <= (initialHp/5) * 1) drawLeg4 = false;

if (!drawLeg1 && leg1ExpoCrea)
{
	with (instance_create_layer(x, y + 10, "Particles", oExplosion)) sprite_index = sExplosion2;
	leg1ExpoCrea = false;
}
if (!drawLeg2 && leg2ExpoCrea)
{
	with (instance_create_layer(x, y + 10, "Particles", oExplosion)) sprite_index = sExplosion2;
	leg2ExpoCrea = false;
}
if (!drawLeg3 && leg3ExpoCrea)
{
	with (instance_create_layer(x, y + 10, "Particles", oExplosion)) sprite_index = sExplosion2;
	leg3ExpoCrea = false;
}
if (!drawLeg4 && leg4ExpoCrea)
{
	with (instance_create_layer(x - 10, y + 10, "Particles", oExplosion)) sprite_index = sExplosion2;
	with (instance_create_layer(x, y - 10, "Particles", oExplosion)) sprite_index = sExplosion2;
	with (instance_create_layer(x + 10, y + 10, "Particles", oExplosion)) sprite_index = sExplosion2;
	//drawLeftWind = false;
	//drawRightWind = false;
	leg4ExpoCrea = false;
}

if (keyboard_check_pressed(ord("K"))) drawLeg4 = false;

if (!drawLeg4)
{
	velChase = 2;
	grav = .3;
	attackDownDamagerRadius = 20;
}

switch (bossState)
{
	case BOSS_STATES.idle:
		
		sprite_index = sBossIdle;
		
		velh = lerp(velh, 0, 0.1);
		velv = lerp(velv, 0, 0.1);
		
		y = lerp(y, ystart, .1);
		
		var _xscale = sign(oFrog.x - x);
		if (_xscale != 0) see = _xscale;
		
		timerChase--;
		
		if (timerChase <= 0) bossState = BOSS_STATES.chase;
		
		// Create enemies state
		if (!drawLeg2 && createEnemies && (y - ystart) <= 20) bossState = BOSS_STATES.createEnemies;
		if (!drawLeg3 && createEnemies2 && (y - ystart) <= 20) bossState = BOSS_STATES.createEnemies2;
		if (!drawLeg4 && createEnemies3 && (y - ystart) <= 20) bossState = BOSS_STATES.createEnemies3;
		
	break;
	
	case BOSS_STATES.chase:
	
		var _xscale = sign(oFrog.x - x);
		if (_xscale != 0) see = _xscale;
		
		var dir = point_direction(x, y, oFrog.x, y);
		var dist = point_distance(x, x, oFrog.x, oFrog.x);
		
		velh = lengthdir_x(velChase, dir);
		
		if (dist <= 20)
		{
			bossState = BOSS_STATES.attackDown;
			timerChase = timeChase;
		}
		
		// Create enemies state
		if (!drawLeg2 && createEnemies && (y - ystart) <= 20) bossState = BOSS_STATES.createEnemies;
		if (!drawLeg3 && createEnemies2 && (y - ystart) <= 20) bossState = BOSS_STATES.createEnemies2;
		
	break;
	
	case BOSS_STATES.attackDown:
		
		velv += grav;
		
		velh = lerp(velh, 0, 0.1);
		
		if (place_meeting(x, y + velv, pCollider))
		{
			bossState = BOSS_STATES.idle;
			xscale = 1.5;
			yscale = 0.5;
			with (instance_create_layer(x, y, "Instances", oExplosionDamagerEnemy)) damagerRadius = other.attackDownDamagerRadius;
			instance_create_layer(x, y + 16, "Particles", oImpactParticle);
			ScreenShake(5, 5);
		}
		
	break;
	
	case BOSS_STATES.createEnemies:
	
		velh = lerp(velh, 0, 0.1);
		velv = lerp(velv, 0, 0.1);
		
		if (drawLeg3)
		{
			for (var i = 0; i <= 1; i++)
			{
				with (instance_create_layer(x, y, "Enemy", oFlyBugBigBoss))
				{
					if (i == 1)
					{
						xGo = -25;
						yGo = 25;
					}
				}
			}
		}
		
		bossState = BOSS_STATES.idle;
		createEnemies = false;
		
	break;
	
	case BOSS_STATES.createEnemies2:
		
		for (var i = 0; i <= 1; i++)
		{
			with (instance_create_layer(x, y, "Enemy", oFlyBugRedBigBoss))
			{
				if (i == 0)
				{
					xGo = 25;
					yGo = -25;
				}
				if (i == 1)
				{
					xGo = -25;
					yGo = -25;
				}
			}
		}
		
		bossState = BOSS_STATES.idle;
		createEnemies2 = false;
		
	break;
	
	case BOSS_STATES.createEnemies3:
		
		for (var i = 0; i <= 1; i++)
		{
			with (instance_create_layer(x, y, "Enemy", oFlyBugAcidBoss))
			{
				if (i == 0)
				{
					xGo = 25;
					yGo = -25;
				}
				if (i == 1)
				{
					xGo = -25;
					yGo = -25;
				}
			}
		}
		
		bossState = BOSS_STATES.idle;
		createEnemies3 = false;
		
	break;
	
	case BOSS_STATES.dead:
	
		drawRightWind = false;
		drawLeftWind = false;
		drawLeg1 = false;
		drawLeg2 = false;
		drawLeg3 = false;
		drawLeg4 = false;
		
		velh = 0;
		velv = 0;
		
		sprite_index = sBossDead;
		
		timerDeadExplosionCrea--;
		timerDead--;
		
		if (timerDead <= 0)
		{
			instance_create_layer(x, y, "Particles", oExplosionBoss);
			with (instance_create_layer(x, y, "Particles", oExplosion)) sprite_index = sExplosion2;
			
			instance_destroy();
		}
		else
		{
			if (timerDeadExplosionCrea <= 0)
			{
				with (instance_create_layer(x + irandom_range(-15, 15), y + irandom_range(-15, 15), "Particles", oExplosion))
				{
					sprite_index = sExplosion2;
					angleRot = false;
				}
				timerDeadExplosionCrea = timeDeadExplosionCrea;
			}	
		}
		
		
	break;
}

xscale = lerp(xscale, 1, 0.15);
yscale = lerp(yscale, 1, 0.15);

if (hp <= 0)
{
	bossState = BOSS_STATES.dead;
}