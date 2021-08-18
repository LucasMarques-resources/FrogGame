/// @description Insert description here
// You can write your code in this editor

// States
enum PlStates
{
	free,
	knockBack,
	swim,
	knockBackWater,
	roll
}

state = PlStates.free;

// Movement
velh = 0;
velv = 0;
grav = 0.3;
jumpForce = 5;
walkspd = 2;
ground = true;
timerKnockGround = 2;
jumping = false;

controller = 0;

// Roll
velRoll = 2;
rollDir = 0;
vRollForce = true;
doRollStateDelay = false;
rollStateTime = 20;
rollStateDelay = rollStateTime;

knockBackCol = true;
knockBackDir = 0;

// Animation
flash = 0;
invulnerable = 0;
runPartTime = room_speed * 0.5;
runPartDelay = runPartTime;

// Water
colWater = false;
knockBackWater = true;
timerKnockWater = room_speed / 4;
timeJumpWater = 3;
timerJumpWater = timeJumpWater;


gunKickX = 0;
gunKickY = 0;