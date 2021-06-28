/// @description Insert description here
// You can write your code in this editor
if (colShootable)
{
	if (!enemy) flash = 40;
	// knock back
	if (HknockBack) velh = lengthdir_x(knockBack, hitFrom);
	if (VknockBack) velv = lengthdir_y(knockBack, hitFrom);
	image_index = 0;
	xscaleSaved = image_xscale;
	state = STATES.hurt;
	colShootable = false;
}

// Losing hp by time
if (loseHp)
{
	loseHpTimer--;
	losingHpTimer--;

	if (loseHpTimer <= 0)
	{
		hp--;
		knockBack = 1;
		colShootable = true;
		hitFrom = other.direction;
		if (hp < 1) other.create = false;
		
		loseHpTimer = loseHpTime;
	}
	
	if (losingHpTimer <= 0)
	{
		loseHp = false;
		losingHpTimer = losingHpTime;
	}
}

if (collision) velv += grav;