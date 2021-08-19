/// @description desc

// Item ease in
menuX += (menuXtarget - menuX) / menuSpeed;

// Keyboard controls
if (menuControl)
{
	if (keyboard_check_pressed(vk_up))
	{
		menuCursor++;
		if (menuCursor >= menuItems) menuCursor = 0;
	}
	if (keyboard_check_pressed(vk_down))
	{
		menuCursor--;
		if (menuCursor < 0) menuCursor = menuItems - 1;
	}
	if (keyboard_check_pressed(vk_enter))
	{
		menuXtarget = global.guiWidth + 200;
		menuCommitted = menuCursor;
		ScreenShake(4, 30);
		menuControl = false;
	}
}

if (menuX > global.guiWidth + 150) && (menuCommitted != -1)
{
	switch (menuCommitted)
	{
		// TODO: transition
		case 2: default:
			
			SlideTransition(TRANS_MODE.GOTO, rOne);
			
		break;
		case 1:
			
		break;
		case 0:
			
		break;
	}
}