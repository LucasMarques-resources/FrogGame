/// @description desc

flash = 0;

velh = 0;
velv = 0;

grav = .2;

timeAttack = room_speed;
timerAttack = timeAttack;

timeChase = room_speed * 2;
timerChase = timeChase;

drawLeg1 = true;
drawLeg2 = true;
drawLeg3 = true;
drawLeg4 = true;

initialHp = hp;

leg1ExpoCrea = true;
leg2ExpoCrea = true;
leg3ExpoCrea = true;
leg4ExpoCrea = true;

createEnemies = true;

enum BOSS_STATES
{
	idle,
	chase,
	attackDown,
	createEnemies
}

bossState = BOSS_STATES.idle;