/// @description Insert description here
// You can write your code in this editor
var amount = irandom_range(6, 8);

CreateParticles(x, y, amount, sGrassTileParticles, 100, 7, .2, .3, 2.5, true, false, room_speed / 1.8, 0, 0, 0, true);

with (oControl) doAutoTile = true;