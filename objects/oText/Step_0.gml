/// @description Insert description here
// You can write your code in this editor
if (!normalText)
{
	if (yMove) y -= 0.2;
	else textString = " +" + string(oControl.ammoBeingAdded);
	alpha -= 0.02;

	if (alpha <= 0)
	{
		instance_destroy();
	}
}
else
{
	letters += spd;
	textCurrent = string_copy(textString, 1, floor(letters));

	draw_set_font(fntMiniText);
	if (h == 0) h = string_height(textString);
	w = string_width(textCurrent);

	// TODO: Destroy when done
}