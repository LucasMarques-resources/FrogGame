/// @description Insert description here
// You can write your code in this editor

if (typeBullet != 3)
{
	with (instance_place(x, y, oWall))
	{
		hp--;
		instance_destroy(other);
	}
}