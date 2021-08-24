// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GunsStatusGrid()
{
	global.gunsGridStatus = ds_grid_create(GUN_TYPES.total - 1, 2);
	ds_grid_clear(global.gunsGridStatus, -1);

	global.gunsGridStatus[GUN_TYPES.none, GUN_STATUS.firingDelay] = 0;
	global.gunsGridStatus[GUN_TYPES.none, GUN_STATUS.maxAmmo] = 0;
	global.gunsGridStatus[GUN_TYPES.none, GUN_STATUS.gunName] = 0;
	global.gunsGridStatus[GUN_TYPES.none, GUN_STATUS.aim] = 0;
	
	global.gunsGridStatus[GUN_TYPES.revolver, GUN_STATUS.infiniteAmmo] = true;
	global.gunsGridStatus[GUN_TYPES.revolver, GUN_STATUS.firingDelay] = 20;
	global.gunsGridStatus[GUN_TYPES.revolver, GUN_STATUS.maxAmmo] = 1;
	global.gunsGridStatus[GUN_TYPES.revolver, GUN_STATUS.gunName] = "Revolver";
	global.gunsGridStatus[GUN_TYPES.revolver, GUN_STATUS.aim] = sAim;
	
	global.gunsGridStatus[GUN_TYPES.rifle, GUN_STATUS.firingDelay] = 10;
	global.gunsGridStatus[GUN_TYPES.rifle, GUN_STATUS.maxAmmo] = 100;
	global.gunsGridStatus[GUN_TYPES.rifle, GUN_STATUS.gunName] = "Rifle";
	global.gunsGridStatus[GUN_TYPES.rifle, GUN_STATUS.aim] = sAim;
	
	global.gunsGridStatus[GUN_TYPES.fire, GUN_STATUS.firingDelay] = 17;
	global.gunsGridStatus[GUN_TYPES.fire, GUN_STATUS.maxAmmo] = 30;
	global.gunsGridStatus[GUN_TYPES.fire, GUN_STATUS.gunName] = "Fire gun";
	global.gunsGridStatus[GUN_TYPES.fire, GUN_STATUS.aim] = sAim;
	
	global.gunsGridStatus[GUN_TYPES.shotgun, GUN_STATUS.firingDelay] = 20;
	global.gunsGridStatus[GUN_TYPES.shotgun, GUN_STATUS.maxAmmo] = 60;
	global.gunsGridStatus[GUN_TYPES.shotgun, GUN_STATUS.gunName] = "Shotgun";
	global.gunsGridStatus[GUN_TYPES.shotgun, GUN_STATUS.aim] = sAimShotgun;
	
	global.gunsGridStatus[GUN_TYPES.nadeLauncher, GUN_STATUS.firingDelay] = 40;
	global.gunsGridStatus[GUN_TYPES.nadeLauncher, GUN_STATUS.maxAmmo] = 6;
	global.gunsGridStatus[GUN_TYPES.nadeLauncher, GUN_STATUS.gunName] = "Grenade Launcher";
	global.gunsGridStatus[GUN_TYPES.nadeLauncher, GUN_STATUS.aim] = sAim;
	
	global.gunsGridStatus[GUN_TYPES.machineGun, GUN_STATUS.firingDelay] = 7;
	global.gunsGridStatus[GUN_TYPES.machineGun, GUN_STATUS.maxAmmo] = 300;
	global.gunsGridStatus[GUN_TYPES.machineGun, GUN_STATUS.gunName] = "Machine Gun";
	global.gunsGridStatus[GUN_TYPES.machineGun, GUN_STATUS.aim] = sAim;
	
	global.gunsGridStatus[GUN_TYPES.sniper, GUN_STATUS.firingDelay] = 50;
	global.gunsGridStatus[GUN_TYPES.sniper, GUN_STATUS.maxAmmo] = 10;
	global.gunsGridStatus[GUN_TYPES.sniper, GUN_STATUS.gunName] = "Sniper";
	global.gunsGridStatus[GUN_TYPES.sniper, GUN_STATUS.aim] = sAim;
	
	global.gunsGridStatus[GUN_TYPES.thunder, GUN_STATUS.firingDelay] = 70;
	global.gunsGridStatus[GUN_TYPES.thunder, GUN_STATUS.maxAmmo] = 3;
	global.gunsGridStatus[GUN_TYPES.thunder, GUN_STATUS.gunName] = "Thunder gun";
	global.gunsGridStatus[GUN_TYPES.thunder, GUN_STATUS.aim] = sAim;
	
	global.gunsGridStatus[GUN_TYPES.iceGun, GUN_STATUS.firingDelay] = 40;
	global.gunsGridStatus[GUN_TYPES.iceGun, GUN_STATUS.maxAmmo] = 5;
	global.gunsGridStatus[GUN_TYPES.iceGun, GUN_STATUS.gunName] = "Ice gun";
	global.gunsGridStatus[GUN_TYPES.iceGun, GUN_STATUS.aim] = sAim;
	
	global.gunsGridStatus[GUN_TYPES.drumGun, GUN_STATUS.firingDelay] = 5;
	global.gunsGridStatus[GUN_TYPES.drumGun, GUN_STATUS.maxAmmo] = 600;
	global.gunsGridStatus[GUN_TYPES.drumGun, GUN_STATUS.gunName] = "Drum Gun";
	global.gunsGridStatus[GUN_TYPES.drumGun, GUN_STATUS.aim] = sAim;
	
	global.gunsGridStatus[GUN_TYPES.trident, GUN_STATUS.infiniteAmmo] = true;
	global.gunsGridStatus[GUN_TYPES.trident, GUN_STATUS.firingDelay] = 5;
	global.gunsGridStatus[GUN_TYPES.trident, GUN_STATUS.maxAmmo] = 1;
	global.gunsGridStatus[GUN_TYPES.trident, GUN_STATUS.gunName] = "Trident";
	global.gunsGridStatus[GUN_TYPES.trident, GUN_STATUS.aim] = sAim;
}