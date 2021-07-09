/// @description Insert description here
// You can write your code in this editor

// Change de sprite depending on the type
image_index = typeGun;

invulnerable = oFrog.invulnerable;
flash = oFrog.flash;

firingDelay--;

var dir = point_direction(x - 1, y-sprite_height/2, mouse_x, mouse_y);

recoil = max(0, recoil - 1);

// Shooting
if (mouse_check_button(mb_left) && firingDelay < 0)
{
	
	// Create bullet
	if (global.ammo > 0)
	{
		switch (typeGun)
		{
			// CASE NORMAL / FIRE / GRENADE LAUNCHER
			default:
			
				recoil = 5;
				ScreenShake(2, 6);
			
				with (instance_create_layer(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir) - 3, "Bullets", oBullet))
				{
					typeBullet = other.typeGun;
					global.ammo--;
					direction = other.image_angle + random_range(-2, 3);
					image_index = typeBullet;
					image_angle = direction;
				}
				
				firingDelay = 10;
	
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(1.7, other.image_angle - 180);
				}
				
			break;
			
			// Shotgun
			case 2:
				
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
						global.ammo--;
						//show_message("i" + string(i));
						//show_message("ammo" + string(global.ammo));
					}
					if (ammoShotgunCount = 1) ammoShotgunCount = 4;
				}
				
				firingDelay = 20;
				
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(3.5, other.image_angle - 180);
				}
				
			break;
			
			// Machine Gun
			case 4:
				
				recoil = 6;
				ScreenShake(2, 4);
				
				with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust)) sprite_index = sMiniDust;
				
				with (instance_create_layer(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), "Bullets", oBullet))
				{
					typeBullet = other.typeGun;
					global.ammo--;
					direction = other.image_angle + random_range(-7, 7);
					image_index = typeBullet;
					image_angle = direction;
				}
				
				firingDelay = 7;
				
				// Player gun kick
				with (oFrog)
				{
					gunKickX = lengthdir_x(3.5, other.image_angle - 180);
				}
				
			break;
		}
		
		with (instance_create_layer(x, y, "Particles", pParticleComplex))
		{
			sprite_index = sBulletShooted;
			
			var dir = 0;
			var dif = 50;
			var vel = 3.5;
		
			if (oFrog.image_xscale = -1) dir = 180 - 180 + dif;
			else dir = 0 + 180 - dif;
		
			velh = lengthdir_x(vel, dir);
			velv = lengthdir_y(vel, dir);
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