/// @description Insert description here
// You can write your code in this editor
if (!other.item)
{
	if (other.id = followId)
	{
		other.image_blend = c_red;

		if (other.colFireDamager)
		{
			loseHpTimerD = loseHpTimeD;
			losingHpTimerD = losingHpTimeD;
		}
		other.colFireDamager = false;
	
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
		//show_debug_message(losingHpTimerD);
	
		// Stop damaging
		if (losingHpTimerD <= 0)
		{
			other.damagerFireCrea = true;
			other.beingFireDamaged = false;
			other.wasThundered = false;
			instance_destroy();
			losingHpTimerD = losingHpTimeD;
		}
	}
	else
	{
		if (!other.beingFireDamaged)
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
				beingFireDamaged = true;
			}
		}
	}
}