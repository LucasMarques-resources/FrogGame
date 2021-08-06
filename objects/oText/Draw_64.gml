/// @description Insert description here
// You can write your code in this editor
DrawSetText(color1, fontText, fa_left, fa_center, alpha);

if (!normalText && textTop)
{
	if (textShadow)
	{
		draw_text_color(xx + 1, floor(yy) + 1, textString, colorShadow, colorShadow, colorShadow, colorShadow, alpha);
		draw_text(xx, floor(yy), textString);
	}
	else draw_text(xx, floor(yy), textString);
}

DrawSetText(c_white, -1, -1, -1, 1);