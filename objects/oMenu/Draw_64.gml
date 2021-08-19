/// @description desc

DrawSetText(c_white, menuFont, fa_right, fa_bottom, 1);

for (var i = 0; i < menuItems; i++)
{
	var offset = 1;
	var txt = menu[i];
	
	if (menuCursor == i)
	{
		txt = string_insert("> ", txt, 0);
		var col = c_white;
	}
	else
	{
		var col = c_gray;
	}
	var xx = menuX;
	var yy = menuY - (menuItemHeight * (i * 1.5));
	draw_set_color(c_black);
	draw_text(xx - offset, yy, txt);
	draw_text(xx + offset, yy, txt);
	draw_text(xx, yy - offset, txt);
	draw_text(xx, yy + offset, txt);
	draw_set_color(col);
	draw_text(xx, yy, txt);
}