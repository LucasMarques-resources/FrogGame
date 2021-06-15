/// @description Insert description here
// You can write your code in this editor
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

// Collision with something
if (place_meeting(x, y, pShootable))
{
	with (instance_place(x, y, pShootable))
	{
		hp--;
		tookHit = true;
		flash = 30;
		hitFrom = other.direction;
		// knock back
		velh = lengthdir_x(knockBack, hitFrom);
		if (VknockBack) velv = lengthdir_y(knockBack, hitFrom);
		if (hp < 1) other.create = false;
	}
	instance_destroy();
}