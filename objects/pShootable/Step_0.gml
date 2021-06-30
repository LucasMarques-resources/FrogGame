/// @description Insert description here
// You can write your code in this editor

if (!instance_place(x, y, pDamager))
{
	show_debug_message("_COL.COL = FALSE STOP COL" + string(id));
	colDamager = true;
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