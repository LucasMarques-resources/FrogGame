/// @description Insert description here
// You can write your code in this editor

if (!global.plDied)
{
	#region LIFES UI
	// Draw life top UI
	draw_sprite_ext(
		sLifeTopUI,
		image_index,
		floor(2),
		floor(1),
		1 + (0.18 * addedLifes) + (0.01 * addedLifes),
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	)

	// Draw destroyed life
	for (var i = 0; i < global.plTotalHp; i++)
	{
		draw_sprite(sLifeUI, 1, 9 + 12 * i, 7);
	}

	// Draw on top of destroyed life the normal life
	for (var i = 0; i < global.plHp; i++)
	{
		draw_sprite(sLifeUI, 0, 9 + 12 * i, 7);
	}
	#endregion

	#region GUNS UI
	draw_set_font(fntText);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);

	var xTop = 5;
	var yTop = 36;

	if (global.hasGun)
	{	
		// Draw gun
		for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
		{
			if (global.gunsGrid[# i, 0] != GUN_TYPES.none)
			{
				if (createGunItemUI)
				{
					instance_create_layer(0, 0, "Instances", oGunItemUI);
					createGunItemUI = false;
				}
			}
		}
	
		draw_set_font(fntMiniText);
	
		// Current gun name
		draw_text_color(xTop + 1, yTop + 1, string(global.gunsName[? global.currentGun.typeGun]) + ": ", c_black, c_black, c_black, c_black, 1);
		draw_text(xTop, yTop, string(global.gunsName[? global.currentGun.typeGun]) + ": ");
	
		var gunNameWidth = string_width(string(global.gunsName[? global.currentGun.typeGun]));
	
		draw_set_font(fntText);
	
		// Draw current game ammo
		if (!global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.infiniteAmmo])
		{
			draw_text_color(xTop + gunNameWidth + 1, yTop + 2, " " + string(global.currentGun.ownAmmo) + "/" + string(global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.maxAmmo]), c_black, c_black, c_black, c_black, 1);
			draw_text(xTop + gunNameWidth, yTop + 1, " " + string(global.currentGun.ownAmmo) + "/" + string(global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.maxAmmo]));
		}
		else // Draw infinite symbol
		{
			draw_sprite(sInfiniteSymbol, 0, xTop + gunNameWidth + 5, yTop + 1);
		}
	
		draw_set_font(fntMiniText);
	
		if ((!global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.infiniteAmmo]) && global.currentGun.ownAmmo < 10)
		{
			skipDraw--;
		
			var ammoMessagesX = 45;
		
			// Low ammo message
			if (global.currentGun.ownAmmo > 0)
			{
				if (abs(skipDraw) mod 11 < 4){ /*Skip draw*/ }
				else
				{
					draw_text_color(xTop + 1, ammoMessagesX + 1, "low ammo", c_black, c_black, c_black, c_black, 1);
					draw_text_color(xTop, ammoMessagesX, "low ammo", c_red, c_red, c_red, c_red, 1);
				}
			}
			// No ammo message
			if (global.currentGun.ownAmmo <= 0)
			{
				if (abs(skipDraw) mod 11 < 4){ /*Skip draw*/ }
				else
				{
					draw_text_color(xTop + 1, ammoMessagesX + 1, "EMPTY", c_black, c_black, c_black, c_black, 1);
					draw_text_color(xTop, ammoMessagesX, "EMPTY", c_red, c_red, c_red, c_red, 1);
				}
			
				timerNoAmmo--;

				if (draw && timerNoAmmo <= 0)
				{
					with (instance_create_layer(oFrog.x - 10, oFrog.y - 10, "Instances", oText))
					{
						textTop = false;
						fontText = fntMiniText;
						color1 = c_red;
						textString = "EMPTY";
					}
					timerNoAmmo = timeNoAmmo;
					draw = false;
				}
			}
		}
		draw_set_font(fntText);
	}

	// Draw ammo added on top
	if (global.ammoAdded && ammoBeingAddedCrea && ammoBeingAddedCreaRepeat)
	{
		objAmmoBeingAdded = instance_create_layer(0, 0, "Instances", oText);
		with (objAmmoBeingAdded)
		{
			var ammoAddedWidth = string_width(string(global.currentGun.ownAmmo));
			var gunMaxAmmoWidth = string_width("/" + string(global.gunsGridStatus[global.currentGun.typeGun, GUN_STATUS.maxAmmo]));
			draw_set_font(fntMiniText);
			xx = string_width(global.gunsName[? global.currentGun.typeGun]) + ammoAddedWidth + gunMaxAmmoWidth + 7;
			yy = 35 + 1;
			textTop = true;
			fontText = fntText;
			textShadow = true;
			colorShadow = c_black;
			decreaseAlpha = false;
			decreaseAlphaTimer = room_speed / 3;
			yMove = false;
		}
	
		ammoBeingAddedCreaRepeat = false;
		ammoBeingAddedCrea = false;
	}
	// Reset ammo added
	if (!instance_exists(objAmmoBeingAdded)) ammoBeingAdded = 0;

	// Draw ammo added on item position
	if (global.ammoAdded)
	{	
		// Reset alpha
		if (objAmmoBeingAdded) objAmmoBeingAdded.alpha = 1;
	
		with (instance_create_layer(oFrog.x - 7, oFrog.y - 15, "Instances", oText))
		{
			textTop = false;
			fontText = fntMiniText;
			textString = string(global.ammoAdd) + " ammo";
			decreaseAlpha = false;
		}
		global.ammoAdded = false;
	}

	// Draw lifes added
	if (global.lifeAdded || global.newlifeAdded)
	{
		with (instance_create_layer(oFrog.x - 7, oFrog.y - 20, "Instances", oText))
		{
			textTop = false;
			fontText = fntMiniText;
			decreaseAlpha = false;
			if (global.lifeAdded) textString = "1 LIFE";
			else if (global.newlifeAdded) textString = "+1 SLOT"
		}
		global.lifeAdded = false;
		global.newlifeAdded = false;
	}

	// Draw gun slot added
	if (global.gunSlotAdded)
	{
		with (instance_create_layer(oFrog.x - 10, oFrog.y - 20, "Instances", oText))
		{
			textTop = false;
			fontText = fntMiniText;
			decreaseAlpha = false;
			textString = "+1 GUN SLOT";
		}
	
		global.gunSlotAdded = false;
	}

	// Draw guns grid
	if (global.drawGunsGrid)
	{
		for (var i = 0; i < ds_grid_width(global.gunsGrid); i++)
		{
			var sep = string_height("ab");
			var val = 10;
	
			for (var j = 0; j < ds_grid_height(global.gunsGrid); j++)
			{
				draw_text_ext(40 * i, 35 + (val * j) + val, global.gunsGrid[# i, j], sep, val);
			}
		}
	}
	draw_set_font(-1);
	#endregion
}

// Draw DEBUG mode state
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text_transformed(global.gameWidth, 0, string(global.debugMode), 0.5, 0.5, 0);
draw_text_transformed(global.gameWidth, 10, string(instance_count), 0.5, 0.5, 0);

draw_set_halign(-1);
draw_set_valign(-1);