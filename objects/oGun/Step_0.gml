/// @description Insert description here
// You can write your code in this editor

invulnerable = oFrog.invulnerable;
flash = oFrog.flash;


firingDelay--;

var dir = point_direction(x, y-sprite_height/2, mouse_x, mouse_y);

recoil = max(0, recoil - 1);

// Shooting
if (mouse_check_button(mb_left) && firingDelay < 0)
{
	recoil = 4;
	ScreenShake(1, 6);
	// Create bullet
	if (global.ammo > 0)
	{
		with (instance_create_layer(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), "Bullets", oBullet))
		{
			global.ammo--;
			spd = 6;
			direction = other.image_angle + random_range(-2, 3);
			image_angle = direction;
		}
		with (instance_create_layer(x, y, "Particles", oBulletShooted))
		{
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
		with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust)) sprite_index = sMiniDust;
	}
	
	firingDelay = 10;
	
	// Player gun kick
	with (oFrog)
	{
		gunKickX = lengthdir_x(1.5, other.image_angle - 180);
	}
}

// Recoil
x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);