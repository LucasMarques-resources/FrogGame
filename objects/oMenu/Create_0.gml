/// @description desc

guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();
guiMargin = 10;

menuX = guiWidth + 200;
menuY = guiHeight - guiMargin;
menuXtarget = guiWidth - guiMargin;
menuSpeed = 25; // lower is faster
menuFont = fntText;
menuItemHeight = font_get_size(fntText);
menuCommitted = -1;
menuControl = true;

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menuItems = array_length_1d(menu);
menuCursor = 2;