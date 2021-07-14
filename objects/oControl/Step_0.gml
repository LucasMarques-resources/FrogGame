/// @description Insert description here
// You can write your code in this editor

// Switch by debug mode
if (keyboard_check_pressed(vk_f1)) global.debugMode = !global.debugMode;

if (global.debugMode)
{
	if (keyboard_check_pressed(vk_f2)) global.drawGrid = !global.drawGrid;
	if (keyboard_check_pressed(vk_f3)) global.createWalls = !global.createWalls;
}

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
/*
if (keyboard_check_pressed(ord("P"))) activateParticles = true;

if (activateParticles)
{
	var p = CreateParticleSystem(sParticle, room_speed / 6, room_speed / 5, .6, .8, c_red, c_yellow, 70, 100, 0.5, 1, 1, 0.5, 0);
	part_particles_create(global.mySystem, mouse_x, mouse_y, p, 1);
}
*/

if (global.createWalls)
{
	if (mouse_check_button_pressed(mb_left))
	{
		instance_create_layer((floor(mouse_x / 16) * 16) + 8, (floor(mouse_y / 16) * 16) + 8, "Col", oWall);
	}
}