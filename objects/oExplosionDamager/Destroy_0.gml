/// @description Insert description here
// You can write your code in this editor

// If to auto tiling
if (autoTiling)
{
	// Run by all the walls to auto tiling
	for (var i = 0; i < ds_list_size(wallsToAutoTiling); i++)
	{
		// Do auto tiling
		with (wallsToAutoTiling[| i])
		{
			//show_message(id);
			image_index = AutoTile();
		}
	}
}