/// @description Colliding with pShootable

if (!other.item)
{
	if (other.id = followId)
	{
		other.image_blend = c_red;

		if (other.colDamager)
		{
			loseHpTimerD = 0;
			losingHpTimerD = losingHpTimeD;
		}
		other.colDamager = false;
	
		loseHpTimerD--;
		losingHpTimerD--;

		// Being damage
		if (loseHpTimerD <= 0)
		{
			with (other)
			{
				hp--;
				knockBack = 1;
				colShootable = true;
			}
		
			loseHpTimerD = loseHpTimeD;
		}
		show_debug_message(losingHpTimerD);
	
		// Stop damaging
		if (losingHpTimerD <= 0)
		{
			other.damagerCrea = true;
			instance_destroy();
			losingHpTimerD = losingHpTimeD;
		}
	}
	else
	{
		if (!other.beingDamaged)
		{
			with (other)
			{	
				var xx = x;
				var yy = y;
				if (enemy)
				{
					xx = x;
					yy = y;
				}
				else
				{
					xx = x + sprite_width / 2;
					yy = y + sprite_height / 2;
				}
				with (instance_create_layer(xx, yy, "Instances", oFireDamager))
				{
					followId = other.id;
				}
				beingDamaged = true;
			}
		}
	}
}