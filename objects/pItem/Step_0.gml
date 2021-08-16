/// @description Insert description here
// You can write your code in this editor

colWater = place_meeting(x, y, oWater);

// Water (values)
if (colWater)
{
	grav = .1;

	velh = lerp(velh, 0, 0.05);
	velv = lerp(velv, 0, 0.05);
}
else
{
	grav = gravD;
}

// Set beingDragged to false
with (oFrog)
{
	if (!place_meeting(x + velh, y, pBox))
	{
		other.beingDragged = false;
	}
}

velv += grav;

timerCatch--;

if ((object_index = oLoader && global.hasGun) && (object_index != oLife || (object_index = oLife && global.plHp < global.plTotalHp)))
{
	if (collision_rectangle(x - 15, y - 5, x + 15, y + 5, oFrog, false, true))
	{
		velh += lengthdir_x(0.2, point_direction(x, y, oFrog.x, oFrog.y));
	}
}

// Create text
if (point_distance(x, y, oFrog.x, oFrog.y) < 25 && global.hasGun && !instance_exists(oControl.pressEtextObj))
{
	if (textCrea)
	{
		with (instance_create_layer(x, y - 10, layer, oText))
		{
			oControl.pressEtextObj = id;
			objCreator = other.id;
			normalText = true;
			textString = "PRESS E";
			length = string_length(textString);
			xFollow = true;
		}
		textCrea = false;
	}	
}

// Destroy text object when player leaves radius
if (instance_exists(oControl.pressEtextObj))
{
	with (oControl.pressEtextObj.objCreator)
	{
		if (pItem)
		{
			if (!(point_distance(x, y, oFrog.x, oFrog.y) < 25))
			{
				textCrea = true;
				instance_destroy(oControl.pressEtextObj);
				oControl.pressEtextObj = noone;
			}
		}
	}
}

// Press E
if (instance_exists(oControl.pressEtextObj) && oControl.pressEtextObj.objCreator == id && keyboard_check_pressed(ord("E")))
{
	if (timerCatch <= 0)
	{
		with (oControl.pressEtextObj.objCreator)
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
							oControl.xItem = x;
							oControl.yItem = y;
							global.ammoAdded = true;
				
							instance_destroy();
						}
					}
		
				break;
			}
		}
	}
}