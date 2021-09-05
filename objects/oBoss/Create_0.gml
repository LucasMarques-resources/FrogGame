/// @description desc

flash = 0;

velh = 0;
velv = 0;
velChase = 1;

attackDownDamagerRadius = 15;

grav = .2;

timeAttack = 60;
timerAttack = timeAttack;

xscale = 1;
yscale = 1;

see = 1;

timeChase = 70;
timerChase = timeChase;

drawLeg1 = true;
drawLeg2 = true;
drawLeg3 = true;
drawLeg4 = true;
drawLeftWind = true;
drawRightWind = true;

initialHp = hp;

leg1ExpoCrea = true;
leg2ExpoCrea = true;
leg3ExpoCrea = true;
leg4ExpoCrea = true;

createEnemies = true;
createEnemies2 = true;
createEnemies3 = true;

timeDeadExplosionCrea = 10;
timerDeadExplosionCrea = timeDeadExplosionCrea;

timerDead = room_speed * 2;

ground = false;

enum BOSS_STATES
{
	idle,
	chase,
	attackDown,
	createEnemies,
	createEnemies2,
	createEnemies3,
	dead
}

bossState = BOSS_STATES.idle;