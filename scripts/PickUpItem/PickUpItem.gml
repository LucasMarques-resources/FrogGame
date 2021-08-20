// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PickUpItem()
{
	// Press E
	if (objCreator != noone)
	{	
		with (objCreator)
		{
			if (keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(0, gp_face3))
			{
				// Switch by item types
				switch (object_index)
				{
					case oLife:
			
						if (global.plHp < global.plTotalHp && oFrog.invulnerable = 0)
						{
							global.plHp++;
							global.lifeAdded = true;
							
							instance_destroy();
							
							other.objCreator = noone;
							instance_destroy(other);
						}
		
					break;
					case oLoader:
			
						if (global.hasGun && !global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.infiniteAmmo])
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
								oControl.xItem = x;
								oControl.yItem = y;
								global.ammoAdded = true;
							
								instance_destroy();
								
								other.objCreator = noone;
								instance_destroy(other);
							}
						}
						
					break;
					case oAddLifeItem:
						
						global.addLife = true;
						global.newlifeAdded = true;
						
						instance_destroy();
								
						other.objCreator = noone;
						instance_destroy(other);
						
					break;
					case oBackPack:
						
						global.gunsSlots++;
						global.gunSlotAdded = true;
						ds_grid_resize(global.gunsGrid, global.gunsSlots, ds_grid_height(global.gunsGrid));
						
						instance_destroy();
								
						other.objCreator = noone;
						instance_destroy(other);
						
					break;
				}
			}
		}
	}
}