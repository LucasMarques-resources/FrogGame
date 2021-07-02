/// @description Insert description here
// You can write your code in this editor

velh = 0;
velv = 0;
grav = 0.3;
hitFrom = 0;
flash = 0;
colShootable = false;
beingDragged = false;

// Damager
damagerCrea = true;
colDamager = true;
beingDamaged = false;

// Drop list
entityDropList = 0;

uniqueEntityDropList = choose
(
	[oLife],
	[oLoader],
	[oLoader],
	-1,
	-1
)