/// @description Insert description here
// You can write your code in this editor
if (colShootable)
{
	hp--;
	tookHit = true;
	flash = 30;
	// knock back
	if (HknockBack) velh = lengthdir_x(knockBack, hitFrom);
	if (VknockBack) velv = lengthdir_y(knockBack, hitFrom);
	if (hp < 1) other.create = false;
	colShootable = false;
}