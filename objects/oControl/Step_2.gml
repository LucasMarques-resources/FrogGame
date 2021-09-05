/// @description desc

if (global.pause)
{
	keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	pauseOptionSelected += (keyDown - keyUp);
	if (pauseOptionSelected >= array_length(pauseOptions)) pauseOptionSelected = 0;
	if (pauseOptionSelected < 0) pauseOptionSelected = array_length(pauseOptions) - 1;
	
	keyActivate = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);
	if (keyActivate)
	{
		switch (pauseOptionSelected)
		{
			case 0: // Continue
			{
				global.pause = false;
				instance_activate_all();
			}
			break;
			
			case 1: // Quit to Menu
			{
				game_restart();
			}
			break;
			
			case 2: // Quit to desktop
			{
				game_end();
			}
		}
	}
}