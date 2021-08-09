/// @description Pick up items

if (other.timerCatch <= 0)
{
	// Switch by item types
	switch (other.object_index)
	{
		case oLife:
			
			if (global.plHp < global.plTotalHp && invulnerable = 0)
			{
				global.plHp++;
				global.lifeAdded = true;
				instance_destroy(other);
			}
		
		break;
		case oLoader:
			
			if (global.hasGun)
			{
				var _ammoToAdd = round((0.20 * global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.maxAmmo]));
				
				if ((global.currentGun.ownAmmo + _ammoToAdd) >= global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.maxAmmo])
				{
					_ammoToAdd = global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.maxAmmo] - global.currentGun.ownAmmo;
				}
				
				if (_ammoToAdd > 0)
				{
					global.currentGun.ownAmmo += _ammoToAdd;
					AddAmmoToGrid(global.currentGun.ownAmmo);
					global.ammoAdd = _ammoToAdd;
					oControl.ammoBeingAdded += _ammoToAdd;
					oControl.ammoBeingAddedCrea = true;
					oControl.xItem = other.x;
					oControl.yItem = other.y;
					global.ammoAdded = true;
				
					instance_destroy(other);
				}
			}
		
		break;
	}
}