/// @description Insert description here
// You can write your code in this editor

colWater = place_meeting(x, y, oWater);

// Water (values)
if (colWater)
{
	grav = .1;
	VknockBack = true;

	velh = lerp(velh, 0, 0.2);
	velv = lerp(velv, 0, 0.2);
}
else
{
	grav = gravD;
	if (VknockBackD) VknockBack = VknockBackD;
	else VknockBack = false;
}

// Set values to normal
if (!beingFireDamaged)
{
	colFireDamager = true;
	beingFireDamaged = false;
	image_blend = c_white;
}

// Set beingDragged to false
with (oFrog)
{
	if (!place_meeting(x + velh, y, pBox))
	{
		other.beingDragged = false;
	}
}

// Knock back and hurt state
if (colShootable)
{	
	var _knockBack = knockBack;
	if (beingIceDamaged)
	{
		_knockBack = knockBack / 6;
	}
	
	//xTo = x + lengthdir_x(_knockBack, hitFrom);
	//yTo = y + lengthdir_y(_knockBack, hitFrom);
	
	if (HknockBack) velh = lengthdir_x(_knockBack, hitFrom);
	if (VknockBack)
	{
		if (pBox) _knockBack *= 0.7;
		velv = lengthdir_y(_knockBack, hitFrom);
	}
	
	image_index = 0;
	statePrevious = state;
	state = STATES.hurt;
	flash = 10;
	colShootable = false;
}

// If was thundered
if (wasThundered)
{
	beingFireDamaged = true;
	if (damagerFireCrea)
	{
		with (instance_create_layer(x, y, "Instances", oFireDamager))
		{
			followId = other.id;
		}
		damagerFireCrea = false;
	}
}

if (collision) velv += grav;