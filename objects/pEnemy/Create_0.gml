/// @description Insert description here
// You can write your code in this editor
event_inherited();

vel_Chase = 0;
tookHit = false;

timeAttack = room_speed * 0.6;
timerAttack = timeAttack;

timeCustomAttack = room_speed / 3;
timerCustomAttack = 0;

reattackTime = 50;
reattackTimer = reattackTime;

dirKnock = 0;

ground = true;
grav = 0.3;

damagePlayer = false;
createDust = true;
createColAttack = true;

enum STATES
{
	waiting,
	chase,
	attack
}

state = STATES.waiting;