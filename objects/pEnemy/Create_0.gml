/// @description Insert description here
// You can write your code in this editor
event_inherited();

vel_Chase = 0;
tookHit = false;
timeAttack = room_speed * 0.7;
timerAttack = timeAttack;

enum STATES
{
	waiting,
	chase,
	attack
}

state = STATES.waiting;