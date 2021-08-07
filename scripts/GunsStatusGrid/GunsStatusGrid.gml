// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GunsStatusGrid()
{
	global.gunsGridStatus = ds_grid_create(GUN_TYPES.total - 1, 1);
	ds_grid_clear(global.gunsGridStatus, -1);

	global.gunsGridStatus[GUN_TYPES.none, 0] = 0;
	global.gunsGridStatus[GUN_TYPES.none, 1] = 0;
	global.gunsGridStatus[GUN_TYPES.rifle, 0] = 10;
	global.gunsGridStatus[GUN_TYPES.rifle, 1] = 10;
	global.gunsGridStatus[GUN_TYPES.fire, 0] = 17;
	global.gunsGridStatus[GUN_TYPES.fire, 1] = 5;
	global.gunsGridStatus[GUN_TYPES.shotgun, 0] = 20;
	global.gunsGridStatus[GUN_TYPES.shotgun, 1] = 6;
	global.gunsGridStatus[GUN_TYPES.nadeLauncher, 0] = 40;
	global.gunsGridStatus[GUN_TYPES.nadeLauncher, 1] = 5;
	global.gunsGridStatus[GUN_TYPES.machineGun, 0] = 7;
	global.gunsGridStatus[GUN_TYPES.machineGun, 1] = 40;
	global.gunsGridStatus[GUN_TYPES.sniper, 0] = 50;
	global.gunsGridStatus[GUN_TYPES.sniper, 1] = 5;
	global.gunsGridStatus[GUN_TYPES.thunder, 0] = 70;
	global.gunsGridStatus[GUN_TYPES.thunder, 1] = 3;
}