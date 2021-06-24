/// @description Insert description here
// You can write your code in this editor
// DEBUG
if (global.plHp > global.plTotalHp)
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

// Destroying oAim when player have not a gun
if (instance_exists(oAim) && !global.hasGun) instance_destroy(oAim);