/// @description Insert description here
// You can write your code in this editor
draw_set_font(fontText);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

if (!textTop) draw_text_color(x, y, textString, cor1, cor2, cor3, cor4, alpha);

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);