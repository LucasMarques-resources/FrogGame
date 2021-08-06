/// @description Insert description here
// You can write your code in this editor

// Change de sprite depending on the type
image_index = typeGun;

invulnerable = oFrog.invulnerable;
flash = oFrog.flash;

firingDelay--;

var dir = point_direction(x, y, mouse_x, mouse_y);

recoil = max(0, recoil - 1);

//drawInitialBulletSprite = false;

// Shooting
if (mouse_check_button(mb_left) && firingDelay < 0)
{
	//drawInitialBulletSprite = true;
	
	// Create bullet
	if (global.currentGun.ownAmmo > 0)
	{
		switch (typeGun)
		{
			// CASE NORMAL
			default:
			
				recoil = 5;
				ScreenShake(2, 6);
				
				//with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust)) sprite_index = sMiniDust;
			
				with (instance_create_layer(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir) - 3, "Bullets", oBullet))
				{
					typeBullet = other.typeGun;
					DecreaseAmmoOnGrid(id);
					direction = other.image_angle + random_range(-2, 3);
					image_index = typeBullet;
					image_angle = direction;
				}
				
				firingDelay = 10;
	
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(1.7, other.image_angle - 180);
					gunKickY = lengthdir_y(1.7, other.image_angle - 180);
				}
				
			break;
			
			// Fire
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
					DecreaseAmmoOnGrid(id);
					direction = other.image_angle + random_range(-2, 3);
					image_index = typeBullet;
					image_angle = direction;
				}
				
				firingDelay = 17;
	
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(1.5, other.image_angle - 180);
					gunKickY = lengthdir_y(1.5, other.image_angle - 180);
				}
				
			break;
			
			// Shotgun
			case GUN_TYPES.shotgun:
				
				recoil = 8;
				ScreenShake(3, 6);
				
				with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust)) sprite_index = sMiniDust;
				
				for (var i = 1; i > -2; i--)
				{
					ammoShotgunCount = max(0, ammoShotgunCount - 1);
					if (ammoShotgunCount <= global.ammo)
					{
						with (instance_create_layer(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), "Bullets", oBullet))
						{
							typeBullet = other.typeGun;
							direction = other.image_angle + random_range(-2, 3) + i * 12;
							image_index = typeBullet;
							image_angle = direction;
						}
						DecreaseAmmoOnGrid(id);
					}
					if (ammoShotgunCount = 1) ammoShotgunCount = 4;
				}
				
				firingDelay = 20;
				
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(3.5, other.image_angle - 180);
					gunKickY = lengthdir_y(3.5, other.image_angle - 180);
				}
				
			break;
			
			// Grenade Launcher
			case GUN_TYPES.nadeLauncher:
				
				recoil = 5;
				ScreenShake(2, 6);
				
				with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust)) sprite_index = sMiniDust;
			
				with (instance_create_layer(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir) - 3, "Bullets", oBullet))
				{
					typeBullet = other.typeGun;
					DecreaseAmmoOnGrid(id);
					direction = other.image_angle + random_range(-2, 3);
					image_index = typeBullet;
					image_angle = direction;
				}
				
				firingDelay = 40;
	
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(1.7, other.image_angle - 180);
					gunKickY = lengthdir_y(1.7, other.image_angle - 180);
				}
				
			break;
			
			// Machine Gun
			case GUN_TYPES.machineGun:
				
				recoil = 6;
				ScreenShake(2, 4);
				
				with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust)) sprite_index = sMiniDust;
				
				with (instance_create_layer(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), "Bullets", oBullet))
				{
					typeBullet = other.typeGun;
					DecreaseAmmoOnGrid(id);
					direction = other.image_angle + random_range(-7, 7);
					image_index = typeBullet;
					image_angle = direction;
				}
				
				firingDelay = 7;
				
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(3.5, other.image_angle - 180);
					gunKickY = lengthdir_y(3.5, other.image_angle - 180);
				}
				
			break;
			
			// Sniper
			case GUN_TYPES.sniper:
				
				recoil = 7;
				ScreenShake(4, 8);
				
				with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust)) sprite_index = sMiniDust;
				
				if (sniperRaycastChecked)
				{
					with (instance_create_layer(sniperRaycastCheckedX, sniperRaycastCheckedY, "Bullets", oBullet))
					{
						typeBullet = other.typeGun;
						DecreaseAmmoOnGrid(id);
						direction = other.image_angle + random_range(-1, 1);
						image_index = typeBullet;
						image_angle = direction;
					}
					sniperRaycastChecked = false;
				}
				
				firingDelay = 50;
	
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(3.7, other.image_angle - 180);
					gunKickY = lengthdir_y(3.7, other.image_angle - 180);
				}
				
			break;
			
			// Thunder gun
			case GUN_TYPES.thunder:
				
				recoil = 5;
				ScreenShake(2, 6);
				
				with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust)) sprite_index = sMiniDust;
			
				with (instance_create_layer(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir) - 3, "Bullets", oBullet))
				{
					typeBullet = other.typeGun;
					DecreaseAmmoOnGrid(id);
					direction = other.image_angle + random_range(-2, 3);
					image_index = typeBullet;
					image_angle = direction;
				}
				
				firingDelay = 100;
	
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(1.7, other.image_angle - 180);
					gunKickY = lengthdir_y(1.7, other.image_angle - 180);
				}
				
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
		
		firingDelay = 10;
	
		// Player gun kick
		with (oFrog)
		{
			gunKickX = lengthdir_x(1.5, other.image_angle - 180);
		}
	}
}

// Recoil
x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);

if (velv != 0) velv += grav;

x += velh;
y += velv;