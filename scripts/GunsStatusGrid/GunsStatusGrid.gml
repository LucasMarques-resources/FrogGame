// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GunsStatusGrid()
{
	global.gunsGridStatus = ds_grid_create(GUN_TYPES.total - 1, 1);
	ds_grid_clear(global.gunsGridStatus, -1);

	global.gunsGridStatus[GUN_TYPES.none, GUN_STATUS.firingDelay] = 0;
	global.gunsGridStatus[GUN_TYPES.none, GUN_STATUS.loaderAmmo] = 0;
	
	global.gunsGridStatus[GUN_TYPES.rifle, GUN_STATUS.firingDelay] = 10;
	global.gunsGridStatus[GUN_TYPES.rifle, GUN_STATUS.loaderAmmo] = 10;
	
	global.gunsGridStatus[GUN_TYPES.fire, GUN_STATUS.firingDelay] = 17;
	global.gunsGridStatus[GUN_TYPES.fire, GUN_STATUS.loaderAmmo] = 5;
	
	global.gunsGridStatus[GUN_TYPES.shotgun, GUN_STATUS.firingDelay] = 20;
	global.gunsGridStatus[GUN_TYPES.shotgun, GUN_STATUS.loaderAmmo] = 6;
	
	global.gunsGridStatus[GUN_TYPES.nadeLauncher, GUN_STATUS.firingDelay] = 40;
	global.gunsGridStatus[GUN_TYPES.nadeLauncher, GUN_STATUS.loaderAmmo] = 5;
	
	global.gunsGridStatus[GUN_TYPES.machineGun, GUN_STATUS.firingDelay] = 7;
	global.gunsGridStatus[GUN_TYPES.machineGun, GUN_STATUS.loaderAmmo] = 40;
	
	global.gunsGridStatus[GUN_TYPES.sniper, GUN_STATUS.firingDelay] = 50;
	global.gunsGridStatus[GUN_TYPES.sniper, GUN_STATUS.loaderAmmo] = 5;
	
	global.gunsGridStatus[GUN_TYPES.thunder, GUN_STATUS.firingDelay] = 70;
	global.gunsGridStatus[GUN_TYPES.thunder, GUN_STATUS.loaderAmmo] = 3;
}