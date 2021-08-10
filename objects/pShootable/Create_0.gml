/// @description Insert description here
// You can write your code in this editor

// Variables
velh = 0;
velv = 0;
grav = 0.3;
hitFrom = 0;
flash = 0;
colShootable = false;
beingDragged = false;
colWater = false;

// Fire damager
damagerFireCrea = true;
colFireDamager = true;
beingFireDamaged = false;
resetDestroyDamagerTimer = false;

// Drop list
entityDropList = 0;

// Thunder
wasThundered = false;
createThunderDamager = true;

uniqueEntityDropList = choose
(
	[oLife],
	[oLoader],
	[oLoader],
	-1,
	-1
)

// Default values
gravD = grav;
VknockBackD = VknockBack;