/// @description Insert description here
// You can write your code in this editor

if (typeBullet != 3)
{
	with (instance_place(x, y, pCollider))
	{
		if (destructible)
		{
			hp--;
			with (other)
			{
				//CreateParticles(x, y, 3, sDestroyedBulletParticle, 50, 4, .2, .3, 2, false, false, room_speed / 1.8, 0, 0, 0);
			}
		}
		instance_destroy(other);
	}
}