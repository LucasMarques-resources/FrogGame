/// @description Insert description here
// You can write your code in this editor

show_debug_overlay(true);

ground = place_meeting(x, y + 1, pCollider) || place_meeting(x, y + 1, pBox);

#region Input

var left, right, down, up, jump, jumpCheck
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
down = keyboard_check(ord("S"));
up = keyboard_check(ord("W"));
jump = keyboard_check_pressed(vk_space);
jumpCheck = keyboard_check(vk_space);
jumpRel = keyboard_check_released(vk_space);

#endregion

switch (state)
{
	#region FREE STATE
	case PlStates.free:
		
		grav = .3;
		walkspd = 2;
		
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
		
		// Swim state
		var water = place_meeting(x, y, oWater);
		if (water)
			state = PlStates.swim;
		
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
	
	#region SWIM STATE
	case PlStates.swim:
		
		image_speed = 0.5;
		
		sprite_index = sFrogRun;
		
		walkspd = 1;
		grav = .1;
		
		var move = right - left;
		velh = (move * walkspd) + gunKickX;
		gunKickX = 0;
		if (move = 0) velh = lerp(velh, 0, 0.2);
		
		velv += gunKickY;
		gunKickY = 0;
		velv *= 0.6;

		velv = (down - (jumpCheck || up)) * 0.6;
		
		// Free state
		var water = place_meeting(x, y, oWater);
		if (!water)
		{
			velv -= 1;
			state = PlStates.free;
		}
		
	break;
	#endregion
}

// Gravity
velv += grav;


#region Animation

if ((velh != 0 && ground) && state != PlStates.swim)
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
else if (state != PlStates.swim)
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