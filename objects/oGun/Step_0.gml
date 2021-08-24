/// @description Insert description here
// You can write your code in this editor

// Change de sprite depending on the type
image_index = typeGun;

invulnerable = oFrog.invulnerable;
flash = oFrog.flash;

firingDelay--;

var dir = image_angle;

recoil = max(0, recoil - 1);

//drawInitialBulletSprite = false;

#region Shooting
if ((mouse_check_button(mb_left) || gamepad_button_check(0, gp_shoulderrb)) && firingDelay < 0 && !global.plRoll)
{
	//drawInitialBulletSprite = true;
	
	// Create bullet
	if (global.currentGun.ownAmmo > 0)
	{
		switch (typeGun)
		{
			// CASE DEFAULT
			default:
				
				CreateBullet(5, 2, 6, 1.5, 1.5, -2, 3);
				
			break;
			
			case GUN_TYPES.revolver:
				
				CreateBullet(3, 2, 5, 1, 1, -1, 1);
				
			break;
			
			#region Fire
			case GUN_TYPES.fire:
				
				recoil = 5;
				ScreenShake(2, 6);
				
				with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust))
				{
					sprite_index = sMiniDust;
					image_blend = c_orange;
				}
			
				with (instance_create_layer(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir) - 3, "Bullets", oBullet))
				{
					typeBullet = other.typeGun;
					DecreaseAmmoOnGrid();
					direction = other.image_angle + random_range(-2, 3);
					image_index = typeBullet;
					image_angle = direction;
				}
				
				firingDelay = global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.firingDelay];
	
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(1.5, other.image_angle - 180);
					gunKickY = lengthdir_y(1.5, other.image_angle - 180);
				}
				
			break;
			#endregion
			
			#region Shotgun
			case GUN_TYPES.shotgun:
				
				recoil = 8;
				ScreenShake(3, 6);
				
				with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust)) sprite_index = sMiniDust;
				
				for (var i = 1; i > -2; i--)
				{
					with (instance_create_layer(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), "Bullets", oBullet))
					{
						typeBullet = other.typeGun;
						direction = other.image_angle + random_range(-2, 3) + i * 12;
						image_index = typeBullet;
						image_angle = direction;
					}
					DecreaseAmmoOnGrid();
				}
				
				firingDelay = global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.firingDelay];
				
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(3.5, other.image_angle - 180);
					gunKickY = lengthdir_y(3.5, other.image_angle - 180);
				}
				
			break;
			#endregion
			
			// Grenade Launcher
			case GUN_TYPES.nadeLauncher:
				
				CreateBullet(5, 2, 6, 1.7, 1.7, -2, -3);
				
			break;
			
			// Machine Gun
			case GUN_TYPES.machineGun:
				
				CreateBullet(6, 2, 4, 3.5, 3.5, -7, 7);
				
			break;
			
			#region Sniper
			case GUN_TYPES.sniper:
				
				recoil = 7;
				ScreenShake(4, 8);
				
				with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust)) sprite_index = sMiniDust;
				
				if (sniperRaycastChecked)
				{
					with (instance_create_layer(sniperRaycastCheckedX, sniperRaycastCheckedY, "Bullets", oBullet))
					{
						typeBullet = other.typeGun;
						direction = other.image_angle + random_range(-1, 1);
						image_index = typeBullet;
						image_angle = direction;
					}
					DecreaseAmmoOnGrid();
					sniperRaycastChecked = false;
				}
				
				firingDelay = global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.firingDelay];
	
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(3.7, other.image_angle - 180);
					gunKickY = lengthdir_y(3.7, other.image_angle - 180);
				}
				
			break;
			#endregion
			
			// Thunder gun
			case GUN_TYPES.thunder:
				
				CreateBullet(5, 2, 6, 1.7, 1.7, -2, 3);
				
			break;
			
			// Ice gun
			case GUN_TYPES.iceGun:
			
				CreateBullet(5, 2, 6, 1.7, 1.7, -2, -3);
				
			break;
			
			// Drum gun
			case GUN_TYPES.drumGun:
				
				CreateBullet(5, 2, 4, 3.5, 3.5, -7, 7);
				
			break;
			
			// Trident
			case GUN_TYPES.trident:
				
				bulletsShootedNumb = 0;
				
				if (!global.plRoll)
				{
					velh = lengthdir_x(6, (dir - 180));
					velv = lengthdir_y(6, (dir - 180));
				}
				
				
				createTrident = true;
				
			break;
		}
		
		for (var i = 0; i < bulletsShootedNumb; i++)
		{
			with (instance_create_layer(x, y, "Particles", pParticleComplex))
			{
				image_speed = 0;
				sprite_index = sBulletShooted;
			
				image_index = other.typeGun;
			
				var dir = 0;
				var dif = 50;
				var vel = 3;
		
				if (oFrog.image_xscale = -1) dir = 180 - 180 + dif;
				else dir = 0 + 180 - dif;
		
				velh = lengthdir_x(vel, dir + (random_range(25, -25) * i));
				velv = lengthdir_y(vel, dir + (random_range(25, -25) * i));
			}
		}
	}
	else
	{
		// Create mini dust
		with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust)) sprite_index = sMiniDust;
		oControl.draw = true;
		
		firingDelay = global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.firingDelay];
	
		// Player gun kick
		with (oFrog)
		{
			gunKickX = lengthdir_x(1.5, other.image_angle - 180);
		}
	}
}
#endregion
if (global.plRoll)
{
	if (typeGun == GUN_TYPES.trident)
	{
		if (tridentSetNormalPos)
		{
			velh = lengthdir_x(6, dir);
			velv = lengthdir_y(6, dir);
			tridentSetNormalPos = false;
		}
		if (!tridentSetNormalPos)
		{
			velh = 0;
			velv = 0;
		}
	}
}
// Create trident
if (createTrident)
{
	if (mouse_check_button_released(mb_left))
	{
		global.changeWeapon = false;
		with (instance_create_layer(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), "Bullets", oTrident))
		{
			image_angle = other.image_angle;
			
			for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
			{
				if (global.gunsGrid[# i, 0] == global.currentGun.id)
				{
					tridentGunGridPos = i;
				}
			}
		}
		createTrident = false;
		instance_destroy();
	}
}

// Recoil
x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);

if (velv != 0) velv += grav;

x += velh;
y += velv;