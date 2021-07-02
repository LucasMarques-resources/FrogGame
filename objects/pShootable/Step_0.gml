/// @description Insert description here
// You can write your code in this editor

if (!instance_place(x, y, pDamager))
{
	colDamager = true;
	beingDamaged = false;
	image_blend = c_white;
}

with (oFrog)
{
	if (!place_meeting(x + velh, y, pBox))
	{
		other.beingDragged = false;
	}
}

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

//show_debug_message(damagerCrea);
if (collision) velv += grav;