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

if (collision) velv += grav;