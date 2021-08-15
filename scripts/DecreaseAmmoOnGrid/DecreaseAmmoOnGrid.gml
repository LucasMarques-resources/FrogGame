// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DecreaseAmmoOnGrid()
{
	for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
	{
		if (global.gunsGrid[# i, 0] == global.currentGun.id)
		{
			global.gunsGrid[# i, 2] -= 1;
			return global.gunsGrid[# i, 2];
		}
	}
}