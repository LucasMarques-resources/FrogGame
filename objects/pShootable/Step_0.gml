/// @description Insert description here
// You can write your code in this editor
if (colShootable)
{
	xscaleSaved = image_xscale;
	tookHit = true;
	flash = 40;
	// knock back
	if (HknockBack) velh = lengthdir_x(knockBack, hitFrom);
	if (VknockBack) velv = lengthdir_y(knockBack, hitFrom);
	colShootable = false;
}