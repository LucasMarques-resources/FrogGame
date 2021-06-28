/// @description Insert description here
// You can write your code in this editor
draw_set_font(fontText);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

if (!normalText && !textTop) draw_text_color(x, y, textString, cor1, cor2, cor3, cor4, alpha);

if (normalText)
{
	var halfw = w * 0.5;

	// Draw the box
	draw_set_colour(c_black);
	draw_set_alpha(0.5);
	draw_roundrect_ext(x - halfw - border, y - h, x + halfw + border, y, 10, 10, false);
	draw_set_alpha(1);

	// Draw text
	DrawSetText(c_white, fntMiniText, fa_center, fa_top);
	draw_text(x + 1, y - h, textCurrent);
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);