/// @description Insert description here
// You can write your code in this editor
event_inherited();

flash = 0;

velh = 0;
velv = 0;

colWater = false;

timeAttack = room_speed * 0.6;
timerAttack = timeAttack;

timeCustomAttack = room_speed / 3;
timerCustomAttack = 0;

reattackTime = 50;
reattackTimer = reattackTime;

dirKnock = 0;

ground = true;
grav = 0.3;

tookHit = false;
damagePlayer = false;
createColAttack = true;

hurtTime = hurtTimer;

firingDelay = 0;

enum STATES
{
	waiting,
	chase,
	attack,
	shoot,
	hurt
}

state = STATES.waiting;

// Default values
flyEnemyD = flyEnemy;
customAttackD = customAttack;
vel_ChaseD = vel_Chase;