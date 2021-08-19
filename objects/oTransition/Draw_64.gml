/// @description desc

if (mode != TRANS_MODE.OFF)
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, global.guiWidth, percent * heightHalf, false);
	draw_rectangle(0, global.guiHeight, global.guiWidth, global.guiHeight - (percent * heightHalf), false);
}

draw_set_color(c_white);
draw_text(50, 50, string(percent));