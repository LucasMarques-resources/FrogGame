/// @description Insert description here
// You can write your code in this editor

// Add lifes
/*
if (global.plHp > global.plTotalHp)
{
	global.addLife = true;
}
else global.addLife = false;
*/


// Adding lifes
if (global.addLife)
{
	global.plTotalHp++;
	addedLifes++;
}

// Destroying oAim when player have not a gun
if (instance_exists(oAim) && !global.hasGun) instance_destroy(oAim);

if (keyboard_check_pressed(ord("P"))) activateParticles = true;

if (activateParticles)
{
	var p = CreateParticleSystem(sParticle, room_speed / 6, room_speed / 5, .6, .8, c_red, c_yellow, 70, 100, 0.5, 1, 1, 0.5, 0);
	part_particles_create(global.mySystem, mouse_x, mouse_y, p, 1);
}