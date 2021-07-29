/// @description desc

// Stop knock back
if (velh != 0)
{
	if (enemy)
	{
		velh = lerp(velh, 0, 0.1);
		velv = lerp(velv, 0, 0.1);
	}
	else
	{
		if (!beingDragged)
		{
			velh = lerp(velh, 0, 0.1);
			velv = lerp(velv, 0, 0.1);
		}
	}
}