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
createDust = true;
state = 0;
statePrevious = 0;
xTo = x;
yTo = y;

// Fire damager
damagerFireCrea = true;
colFireDamager = true;
beingFireDamaged = false;
resetDestroyDamagerTimer = false;
fireDamagerId = noone;

// Ice Damager
damagerIceCrea = true;
beingIceDamaged = false;
iceDamagerId = noone;

// Drop list
entityDropList = 0;

// Thunder
wasThundered = false;
createThunderDamager = true;

uniqueEntityDropList = UniqueEntityDropList();

// Default values
gravD = grav;
VknockBackD = VknockBack;