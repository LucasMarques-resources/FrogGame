/// @description Insert description here
// You can write your code in this editor

if (!normalText)
{
	if (yMove) yy -= 0.1;
	else textString = " +" + string(oControl.ammoBeingAdded);
	if (decreaseAlpha) alpha -= 0.01;
	else
	{
		decreaseAlphaTimer--;
		
		if (decreaseAlphaTimer <= 0)
		{
			alpha -= 0.02;
		}
	}

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
}

if (instance_exists(objCreator))
{
	// Follow (X) creator
	if (xFollow)
	{
		xx = objCreator.x;
	}
}

// PRESS E (pick up items)
if (!global.plRoll)
{
	if (gunItemPressEobj)
	{
		PickUpGunItem();
	}
	else if (itemPressEobj)
	{
		PickUpItem();
	}
}