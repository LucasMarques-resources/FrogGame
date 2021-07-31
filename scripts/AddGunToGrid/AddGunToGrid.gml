// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AddGunToGrid(idd, ammo)
{
	var gridW = ds_grid_width(global.gunsGrid);
	var gridH = ds_grid_height(global.gunsGrid);
	
	for (var i = 0; i < gridW; i++)
	{
		// If is the same weapon
		if (global.gunsGrid[# i, 1] == idd.typeGun)
		{
			global.gunsGrid[# i, 0] = idd;
			global.gunsGrid[# i, 1] = idd.typeGun;
			global.gunsGrid[# i, 2] = idd.ownAmmo;
			return true;
		} 
	}
	
	for (var i = 0; i < gridW; i++)
	{
		// If there is empty space
		if (global.gunsGrid[# i, 1] == -4)
		{
			global.gunsGrid[# i, 0] = idd;
			global.gunsGrid[# i, 1] = idd.typeGun;
			global.gunsGrid[# i, 2] = idd.ownAmmo;
			return true;
		}
	}
	
	return false;
}