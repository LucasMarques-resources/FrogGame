/// @description Insert description here
// You can write your code in this editor

if (!normalText)
{
	if (yMove) yy -= 0.2;
	else textString = " +" + string(oControl.ammoBeingAdded);
	if (decreaseAlpha) alpha -= 0.02;
	else
	{
		decreaseAlphaTimer--;
		
		if (decreaseAlphaTimer <= 0)
		{
			alpha -= 0.03;
		}
	}

	if (alpha <= 0)
	{
		instance_destroy();
	}
}
else
{
	letters += spd;
	textCurrent = string_copy(textString, 1, floor(letters));

	draw_set_font(fntMiniText);
	if (h == 0) h = string_height(textString);
	w = string_width(textCurrent);
}

if (itemCreator != noone)
{
	with (itemCreator)
	{
		if (keyboard_check_pressed(ord("E")))
		{
			textCrea = true;
			
			for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
			{
				// If there is empty space
				if (global.gunsGrid[# i, 1] != GUN_TYPES.none) createGunItem = true;
				else createGunItem = false;
			}
			
			if (createGunItem)
			{
				with (instance_create_layer(oGun.x, oGun.y - 10, "Instances", oGunItem))
				{
					image_xscale = oFrog.image_xscale;
					if (image_xscale = 1) var dir = 45; else dir = 135;
			
					velh = lengthdir_x(3, dir);
					velv = lengthdir_y(3, dir);
			
					itemOwnAmmo = oGun.ownAmmo;
					typeItem = oGun.typeGun;
				}
			}

			instance_destroy(oGun);

			global.hasGun = false;
			other.itemCreator = noone;
			instance_destroy(other);
		
			if (!global.hasGun)
			{
				with (instance_create_layer(oFrog.x, oFrog.y, "Gun", oGun))
				{
					typeGun = other.typeItem;
					
					ownAmmo = other.itemOwnAmmo;
					
					AddGunToGrid(id, ownAmmo);
					
					global.currentGun = self;
				}
				if (!instance_exists(oAim)) instance_create_layer(mouse_x, mouse_y, "Top", oAim);
				instance_destroy();
				global.hasGun = true;
			}
		}
	}
}