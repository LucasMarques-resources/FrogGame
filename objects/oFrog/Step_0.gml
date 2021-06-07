/// @description Insert description here
// You can write your code in this editor

#region Input

var left, right, jump
left = keyboard_check(vk_left) || keyboard_check(ord("A"));
right = keyboard_check(vk_right) || keyboard_check(ord("D"));
jump = keyboard_check_pressed(vk_space);
ground = place_meeting(x, y + 1, oWall);

#endregion

#region Movement & Gravity & Jumping

var move = right - left;

velh = (move * walkspd) + gunKickX;
gunKickX = 0;

velv += grav;

if (ground)
{
	if (jump)
	{
		velv -= jumpForce;
	}
}

#endregion

#region Collisions

//Horizontal Collision
if (place_meeting(x + velh, y, oWall))
{
	while (!place_meeting(x + sign(velh), y, oWall))
	{
		x += sign(velh);
	}
	velh = 0;
}

// Vertical Collision
if (place_meeting(x, y + velv, oWall))
{
	while (!place_meeting(x, y + sign(velv), oWall))
	{
		y += sign(velv);
	}
	velv = 0;
}

#endregion

#region Animation

if (velh != 0) sprite_index = sFrogRun; 
else if (!global.hasGun) sprite_index = sFrog;

if (global.hasGun) sprite_index = sFrogGun;

var aimSide = sign(mouse_x - x);
if (aimSide != 0) image_xscale = aimSide;

#endregion

invulnerable = max(invulnerable - 1, 0);

x += velh;
y += velv;