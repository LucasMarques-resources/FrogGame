/// @description Insert description here
// You can write your code in this editor

show_debug_overlay(true);

ground = place_meeting(x, y + 1, oWall) || place_meeting(x, y + 1, pBox);

#region Input

var left, right, jump
left = keyboard_check(vk_left) || keyboard_check(ord("A"));
right = keyboard_check(vk_right) || keyboard_check(ord("D"));
jump = keyboard_check_pressed(vk_space) || keyboard_check(ord("C"));
jumpRel = keyboard_check_released(vk_space);

#endregion

switch (state)
{
	#region FREE STATE
	case PlStates.free:
		
		knockBackCol = true;
		
		// Movement
		var move = right - left;

		velh = (move * walkspd) + gunKickX;
		gunKickX = 0;

		// Jumping
		if (ground && !place_meeting(x, y - 1, pBox))
		{
			if (jump)
			{
				jumping = true;
				velv -= jumpForce;
				var jumpPart = instance_create_layer(x, y, "Particles", oJumpSideParticle);
				if (velh != 0) jumpPart.image_xscale = sign(velh);
				else jumpPart.sprite_index = sJumpParticle;
			}
			else jumping = false;
		}

		if (jumpRel && velv < 0)
		{
			velv *= .5;
		}
		
	break;
	#endregion
	
	#region KNOCK BACK STATE
	case PlStates.knockBack:
		
		flash = 1;
		invulnerable = 60;
		timerKnockGround--;
		
		// Knock back
		if (knockBackCol)
		{
			velh = lengthdir_x(2.5, knockBackDir);
			velv = lengthdir_y(2.5, knockBackDir)-2;
			
			knockBackCol = false;
		}
		
		// Free state
		if (ground && timerKnockGround <= 0)
		{
			flash = 0;
			state = PlStates.free;
			timerKnockGround = 2;
		}
		
	break;
	#endregion
}

// Gravity
velv += grav;



#region Animation

if (velh != 0 && ground)
{
	runPartDelay--;
	sprite_index = sFrogRun;
	if (runPartDelay <= 0) 
	{
		var part = instance_create_layer(x - (sign(velh) * 10), y, "Particles", oRunParticle);
		part.image_xscale = sign(velh);
		
		runPartDelay = runPartTime;
	}
}
else
{
	runPartDelay = runPartTime;
	if (!global.hasGun) sprite_index = sFrog;
}

if (global.hasGun) sprite_index = sFrogGun;

var aimSide = sign(mouse_x - x);
if (aimSide != 0) image_xscale = aimSide;

invulnerable = max(invulnerable - 1, 0);

#endregion

//show_debug_message(state);

