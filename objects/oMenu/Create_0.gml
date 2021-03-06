/// @description desc
InitGame();

guiMargin = 10;

menuX = global.guiWidth + 200;
menuY = global.guiHeight - guiMargin;
menuXtarget = global.guiWidth - guiMargin;
menuSpeed = 25; // lower is faster
menuFont = fntText;
menuItemHeight = font_get_size(fntText);
menuCommitted = -1;
menuControl = true;

menu[1] = "New Game";
menu[0] = "Quit";

menuItems = array_length_1d(menu);
menuCursor = 1;

menuTop = menuY - ((menuItemHeight * 1.5) * menuItems);

gamepadDelay = true;