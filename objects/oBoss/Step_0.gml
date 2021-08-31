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
	with (instance_create_layer(x, y + 10, "Particles", oExplosion)) sprite_index = sExplosion2;
	leg4ExpoCrea = false;
}

switch (bossState)
{
	case BOSS_STATES.idle:
		
		sprite_index = sBossIdle;
		
		velh = lerp(velh, 0, 0.1);
		velv = lerp(velv, 0, 0.1);
		
		y = lerp(y, ystart, .1);
		
		var xscale = sign(oFrog.x - x);
		if (xscale != 0) image_xscale = xscale;
		
		timerChase--;
		
		if (timerChase <= 0) bossState = BOSS_STATES.chase;
		
		if (!drawLeg1 && createEnemies && (y - ystart) <= 20) bossState = BOSS_STATES.createEnemies;
		
	break;
	
	case BOSS_STATES.chase:
	
		var xscale = sign(oFrog.x - x);
		if (xscale != 0) image_xscale = xscale;
		
		var dir = point_direction(x, y, oFrog.x, oFrog.y - oFrog.sprite_height / 2);
		var dist = point_distance(x, x, oFrog.x, oFrog.x);
		
		velh = lengthdir_x(1, dir);
		
		if (dist <= 30)
		{
			bossState = BOSS_STATES.attackDown;
			timerChase = timeChase;
		}
		
		if (!drawLeg1 && createEnemies && (y - ystart) <= 20) bossState = BOSS_STATES.createEnemies;
		
	break;
	
	case BOSS_STATES.attackDown:
		
		velv += grav;
		
		if (place_meeting(x, y + velv, pCollider))
		{
			bossState = BOSS_STATES.idle;
			with (instance_create_layer(x, y, "Instances", oExplosionDamagerEnemy)) damagerRadius = 15;
			ScreenShake(5, 5);
		}
		
	break;
	
	case BOSS_STATES.createEnemies:
	
		velh = lerp(velh, 0, 0.1);
		velv = lerp(velv, 0, 0.1);
		
		for (var i = 0; i <= 1; i++)
		{
			show_message(i);
			with (instance_create_layer(x, y, "Enemy", oFlyBugBigBoss))
			{
				if (i == 1)
				{
					xGo = -25;
					yGo = 25;
				}
			}
		}
		
		bossState = BOSS_STATES.idle;
		createEnemies = false;
		
	break;
}