/// @description Insert description here
// You can write your code in this editor
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

// Collision with something
if (place_meeting(x, y, pShootable))
{
	with (instance_place(x, y, pShootable))
	{
		colShootable = true;
		hitFrom = other.direction;
	}
	instance_destroy();
}