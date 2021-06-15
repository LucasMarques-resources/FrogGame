/// @description Insert description here
// You can write your code in this editor
event_inherited();

path = path_add();

vel_Chase = 0;
tookHit = false;
timeAttack = room_speed * 0.6;
timerAttack = timeAttack;
dirKnock = 0;
miniExpo = true;
ground = true;
grav = 0.3;

enum STATES
{
	waiting,
	chase,
	attack
}

state = STATES.waiting;