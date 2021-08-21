/// @description Insert description here
// You can write your code in this editor
DrawSetText(color1, fontText, fa_left, fa_center, alpha);

if (!normalText && !textTop) draw_text(xx, yy, textString);

if (normalText)
{
	var halfw = w * 0.5;

	// Draw the box
	draw_set_colour(c_black);
	draw_set_alpha(0.5);
	draw_roundrect_ext(xx - halfw - border, yy - h, xx + halfw + border, yy, 10, 10, false);
	draw_set_alpha(1);

	DrawSetText(color1, fntMiniText, fa_center, fa_top, alpha);
	// Shadow
	if (textShadow) draw_text_color(xx + 1, (yy - h) + 1, textCurrent, colorShadow, colorShadow, colorShadow, colorShadow, alpha);
	// Draw text
	draw_text(xx + 1, yy - h, textCurrent);
}

if (objCreator != noone)
{
	yy = objCreator.y - 10;
	
	with (objCreator)
	{
		drawOutLine = true;
	}
}

DrawSetText(c_white, -1, -1, -1, 1);