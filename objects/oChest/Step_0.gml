/// @description desc

if (activateChest)
{
	if (image_index >= image_number - 1) image_speed = 0;
	else image_speed = 1;
	
	if (image_index >= image_number - 1)
	{
		if (createChestItem)
		{
			with (instance_create_layer(x, y - 10, "Instances", oGunItem))
			{
				image_xscale = oFrog.image_xscale;
				if (image_xscale = 1) var dir = 45; else dir = 135;
								
				velh = lengthdir_x(3, dir);
				velv = lengthdir_y(3, dir);
				
				if (other.randomItem) typeItem = irandom_range(1, GUN_TYPES.total - 1);
				else typeItem = other.itemToSpawn;
				itemOwnAmmo = global.gunsGridStatus[typeItem, GUN_STATUS.maxAmmo];
			}
			ds_list_add(global.chestSaveList, id);
			createChestItem = false;
		}
	}
}

if (createChestItem)
{
	// Create text
	if (point_distance(x, y, oFrog.x, oFrog.y) < 25 && !instance_exists(oControl.pressEtextObj) && !global.plRoll)
	{
		if (textCrea)
		{
			with (instance_create_layer(x, y, layer, oText))
			{
				oControl.pressEtextObj = id;
				other.pressEtextObjId = id;
				objCreator = other.id;
				normalText = true;
				textString = "PRESS E";
				length = string_length(textString);
				followYtextMargin = 20;
				itemPressEobj = true;
			}
			textCrea = false;
		}
	}
}

// Destroy text object when player leaves radius
if (instance_exists(oControl.pressEtextObj))
{
	with (oControl.pressEtextObj.objCreator)
	{
		if (object_index = oChest)
		{
			if (!(point_distance(x, y, oFrog.x, oFrog.y) < 25))
			{
				textCrea = true;
				instance_destroy(oControl.pressEtextObj);
				oControl.pressEtextObj = noone;
				drawOutLine = false;
			}
		}
	}
}

velv += grav;