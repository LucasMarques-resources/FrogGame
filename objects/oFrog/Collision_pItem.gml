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
				global.ammo += other.ammo;
				global.ammoAdd = other.ammo;
				oControl.ammoBeingAdded += other.ammo;
				oControl.ammoBeingAddedCrea = true;
				oControl.xItem = other.x;
				oControl.yItem = other.y;
				global.ammoAdded = true;
				
				instance_destroy(other);
			}
		
		break;
	}
}