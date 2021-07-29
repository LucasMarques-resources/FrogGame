/// @description desc

ground = place_meeting(x, y + 1, pCollider) || place_meeting(x, y + 1, pShootable);

if (hp <= 0)
{
	instance_destroy();
}

if (velv > 1 && timerDestroyEnvironment <= 0)
{
	
	timerDestroyEnvActivated = true;
}

if (timerDestroyEnvActivated)
{
	timerDestroyEnvironment--;
}



velv += grav;