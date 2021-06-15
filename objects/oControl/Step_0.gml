/// @description Insert description here
// You can write your code in this editor
// DEBUG
if (keyboard_check_pressed(ord("H")))
{
	global.addLife = true;
}
else global.addLife = false;

// Adding lifes
if (global.addLife)
{
	global.plTotalHp++;
	addedLifes++;
}