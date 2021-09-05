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
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1))
	{
		menuXtarget = global.guiWidth + 200;
		menuCommitted = menuCursor;
		ScreenShake(4, 30);
		menuControl = false;
	}
	
	// Gamepad
	if ((gamepad_axis_value(0, gp_axislv)) > 0.2 && gamepadDelay)
	{
		menuCursor--;
		if (menuCursor < 0) menuCursor = menuItems-1;
		gamepadDelay = false;
	}
	
	if ((gamepad_axis_value(0, gp_axislv)) < -0.2 && gamepadDelay)
	{
		menuCursor++;
		if (menuCursor >= menuItems) menuCursor = 0;
		gamepadDelay = false;
	}
	if ((gamepad_axis_value(0, gp_axislv)) = 0) gamepadDelay = true;
	
	var mouseYgui = device_mouse_y_to_gui(0);
	if (mouseYgui < menuY) && (mouseYgui > menuTop)
	{
		menuCursor = (menuY - mouseYgui) div (menuItemHeight * 1.5);
		if (mouse_check_button_pressed(mb_left))
		{
			menuXtarget = global.guiWidth + 200;
			menuCommitted = menuCursor;
			ScreenShake(4, 20);
			menuControl = false;
		}
	}
}

if (menuX > global.guiWidth + 150) && (menuCommitted != -1)
{
	switch (menuCommitted)
	{
		// TODO: transition
		case 1: default:
			
			Transition(TRANS_MODE.GOTO, rOne);
			
		break;
		case 0:
			
			game_end();
			
		break;
	}
}