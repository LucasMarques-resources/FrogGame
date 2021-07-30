/// @description desc

ground = place_meeting(x, y + 1, pCollider) || place_meeting(x, y + 1, pShootable);

if (hp <= 0)
{
	instance_destroy();
}

if (velv > 3.5) can = true;
else can = false;

velv += grav;