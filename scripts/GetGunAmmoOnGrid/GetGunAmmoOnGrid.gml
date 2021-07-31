// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetGunAmmoOnGrid(gunType)
{
	for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
	{
		if (global.gunsGrid[# i, 1] == gunType)
		{
			return global.gunsGrid[# i, 2];
		}
	}
}