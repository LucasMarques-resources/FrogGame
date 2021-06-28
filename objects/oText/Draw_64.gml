/// @description Insert description here
// You can write your code in this editor
draw_set_font(fntText);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

if (!normalText && textTop) draw_text_color(x + (string_length(global.ammo) * 5) + 5, floor(y), textString, cor1, cor2, cor3, cor4, alpha);

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);