/// @description Insert description here
// You can write your code in this editor
event_inherited();

vel_Chase = 0;

xscaleSaved = image_xscale;
flash = 0;

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
createDust = true;
createColAttack = true;

hurtTime = hurtTimer;

enum STATES
{
	waiting,
	chase,
	attack,
	hurt
}

state = STATES.waiting;