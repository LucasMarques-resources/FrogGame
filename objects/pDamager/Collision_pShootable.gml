/// @description Colliding with pShootable

with (other)
{
	//show_message("COL " + string(id));
	image_blend = c_red;
	if (colDamager)
	{
		//show_message("COL MENSAGEM" + string(id));
		loseHpTimer = 0;
		loseHpTime = other.loseHpTimeD;
		losingHpTime = other.losingHpTimeD;
		losingHpTimer = losingHpTime;
	}
	colDamager = false;
	//show_message("pShootable col = false " + string(id));
	
	loseHpTimer--;
	losingHpTimer--;

	if (loseHpTimer <= 0)
	{
		hp--;
		knockBack = 1;
		colShootable = true;
		if (hp < 1) other.create = false;
		
		loseHpTimer = loseHpTime;
	}
	show_debug_message(losingHpTimer);
	if (losingHpTimer <= 0)
	{
		instance_destroy(other);
		damagerCrea = true;
		//show_message(damagerCrea);
		losingHpTimer = losingHpTime;
	}
}