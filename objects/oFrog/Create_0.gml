/// @description Insert description here
// You can write your code in this editor

enum PlStates
{
	free,
	knockBack
}

state = PlStates.free;

velh = 0;
velv = 0;
grav = 0.3;
jumpForce = 5;
walkspd = 2;
ground = true;
knockBackCol = true;
knockBackDir = 0;
flash = 0;

invulnerable = 0;
runPartTime = room_speed * 0.5;
runPartDelay = runPartTime;

gunKickX = 0;