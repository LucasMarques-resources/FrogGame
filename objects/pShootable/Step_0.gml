/// @description Insert description here
// You can write your code in this editor

colWater = place_meeting(x, y, oWater);

// Water (values)
if (colWater)
{
	grav = .1;
	VknockBack = true;

	velh = lerp(velh, 0, 0.1);
	velv = lerp(velv, 0, 0.1);
}
else
{
	grav = gravD;
	if (VknockBackD) VknockBack = VknockBackD;
	else VknockBack = false;
}

// Set values to normal
if (!instance_place(x, y, oFireDamager))
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
	if (HknockBack) velh = lengthdir_x(knockBack, hitFrom);
	if (VknockBack)
	{
		if (pBox) knockBack *= 0.7;
		velv = lengthdir_y(knockBack, hitFrom);
	}
	image_index = 0;
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

//show_debug_message(damagerFireCrea);
if (collision) velv += grav;