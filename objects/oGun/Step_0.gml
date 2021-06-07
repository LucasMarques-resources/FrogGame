/// @description Insert description here
// You can write your code in this editor
firingDelay--;

var dir = point_direction(x, y-sprite_height/2, mouse_x, mouse_y);

recoil = max(0, recoil - 1);

// Shooting
if (mouse_check_button(mb_left) && firingDelay < 0)
{
	recoil = 4;
	ScreenShake(1, 6);
	// Create bullet
	with (instance_create_layer(x + lengthdir_x(15, dir), y + lengthdir_y(15, dir), "Bullets", oBullet))
	{
		spd = 6;
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
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