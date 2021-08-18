/// @description Insert description here
// You can write your code in this editor

ground = place_meeting(x, y + 1, pCollider) || place_meeting(x, y + 1, pBox);
colWater = place_meeting(x, y, oWater);

// Set physics values to normal
if (!colWater)
{
	grav = .3;
	walkspd = 2;
}
else
{
	image_speed = 0.5;
	velh = lerp(velh, velh / 2, 0.2);
	velv = lerp(velv, velv / 2, 0.2);
	grav = .1;
	walkspd = 1;
}

if (doRollStateDelay)
{
	rollStateDelay--;
	if (rollStateDelay <= 0)
	{
		rollStateDelay = rollStateTime;
		doRollStateDelay = false;
	}
}

if (state != PlStates.roll)
{
	global.plRoll = false;
}

#region Input

var left, right, down, up, jump, jumpCheck, roll
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
down = keyboard_check(ord("S"));
up = keyboard_check(ord("W"));
jump = keyboard_check_pressed(vk_space);
jumpCheck = keyboard_check(vk_space);
jumpRel = keyboard_check_released(vk_space);
roll = mouse_check_button_pressed(mb_right);

#endregion

switch (state)
{
	#region FREE STATE
	case PlStates.free:
		
		knockBackCol = true;
		knockBackWater = true;
		
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
		if (colWater)
			state = PlStates.swim;
			
		// Roll state
		if (roll && !doRollStateDelay)
		{
			image_index = 0;
			rollDir = image_xscale;
			state = PlStates.roll;
		}
		
	break;
	#endregion
	
	#region KNOCK BACK STATE
	case PlStates.knockBack:
		
		flash = 1;
		timerKnockGround--;
		
		// Knock back
		if (knockBackCol)
		{
			velh = lengthdir_x(2.5, knockBackDir);
			velv = lengthdir_y(2.5, knockBackDir)-2;
			
			knockBackCol = false;
		}
		
		if (colWater) state = PlStates.swim;
		
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
		
		sprite_index = sFrogRun;
		
		timerJumpWater--;
		
		knockBackWater = true;
		
		grav = .1;
		walkspd = 1;
		
		var move = right - left;
		velh = (move * walkspd) + gunKickX;
		gunKickX = 0;
		if (move = 0) velh = lerp(velh, 0, 0.18);
		
		var movev = (down - (jumpCheck || up));
		if (movev = 0) { velv = lerp(velv, 0, 0.18) + gunKickY / 3; gunKickY = 0; }
		else if (timerJumpWater <= 0)
		{
			velv = lerp(velv, (movev * walkspd), 0.3) + gunKickY / 3;
			gunKickY = 0;
		}
		
		// Free state
		var water = place_meeting(x, y, oWater);
		if (!water)
		{
			timerJumpWater = timeJumpWater;
			gunKickY = 0;
			velv = -3;
			state = PlStates.free;
		}
		
		// Roll state
		if (roll && !doRollStateDelay)
		{
			image_index = 0;
			rollDir = image_xscale;
			state = PlStates.roll;
		}
		
	break;
	#endregion
	
	#region KNOCK BACK WATER STATE
	case PlStates.knockBackWater:
		
		grav = .1;
		
		flash = 1;
		
		timerKnockWater--;
		
		// Knock back
		velh = lengthdir_x(1, knockBackDir);
		velv = lengthdir_y(1, knockBackDir) + grav;
		
		// Change state
		if (timerKnockWater <= 0)
		{
			flash = 0;
			if (colWater) state = PlStates.swim;
			else state = PlStates.free;
			timerKnockGround = 2;
			timerKnockWater = room_speed / 4;
		}
		
	break;
	#endregion
	
	#region ROLL STATE
	case PlStates.roll:
		
		sprite_index = sFrogRoll;
		
		global.plRoll = true;
		global.plRollDir = rollDir;
		
		var _velRoll = velRoll;
		var _vRollDir = 45;
		
		if (colWater)
		{
			_velRoll = floor(velRoll/1.5);
			_vRollDir = 25;
		}
		
		velh = rollDir * _velRoll;
		
		if (vRollForce)
		{
			velv = lengthdir_y(_velRoll * 1.5, _vRollDir);
			vRollForce = false;
		}
		global.plRollVel = _velRoll;
		
		// Animation end (go to free state)
		if (image_index >= image_number - 1)
		{
			state = PlStates.free;
			vRollForce = true;
			doRollStateDelay = true;
			global.plRoll = false;
		}
		
	break;
	#endregion
}

// Gravity
velv += grav;

#region Animation

if (state != PlStates.roll)
{
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
}

invulnerable = max(invulnerable - 1, 0);

#endregion

//show_debug_message(state);