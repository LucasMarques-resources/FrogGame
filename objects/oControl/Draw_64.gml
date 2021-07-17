/// @description Insert description here
// You can write your code in this editor

// Draw life top UI
draw_sprite_ext(
	sLifeTopUI,
	image_index,
	floor(2),
	floor(1),
	global.lifeTopXscale + (0.18 * addedLifes) + (0.01 * addedLifes),
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

draw_set_font(fntText);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

if (global.hasGun)
{
	// Draw gun
	draw_sprite_ext(sGunItem, global.currentGun.typeGun, 10, 23, 1, 1, 0, c_white, 1);

	// Draw ammo
	draw_text(25, 23, global.ammo);
	
	if (global.ammo < 10)
	{
		skipDraw--;
	
		// Low ammo message
		if (global.ammo > 0)
		{
			if (abs(skipDraw) mod 11 < 4)
			{
				// Skip draw
			}
			else
			{
				draw_text(35, 23, "low ammo");
			}
		} // No ammo message
		if (global.ammo <= 0)
		{
			timerNoAmmo--;
		
			if (draw && timerNoAmmo <= 0)
			{
				with (instance_create_layer(25, 23, "Instances", oText))
				{
					textTop = true;
					textString = "no ammo";
				}
				timerNoAmmo = timeNoAmmo;
				draw = false;
			}
		}
	}
}

// Draw ammo added on top
if (global.ammoAdded && ammoBeingAddedCrea && ammoBeingAddedCreaRepeat)
{
	objAmmoBeingAdded = instance_create_layer(25, 23, "Instances", oText);
	objAmmoBeingAdded.textTop = true;
	objAmmoBeingAdded.yMove = false;
	
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
	
	with (instance_create_layer(oFrog.x - 7, oFrog.y - 20, "Instances", oText))
	{
		textTop = false;
		fontText = fntMiniText;
		textString = string(global.ammoAdd) + " ammo";
	}
	global.ammoAdded = false;
}

// Draw lifes added
if (global.lifeAdded)
{
	with (instance_create_layer(oFrog.x - 7, oFrog.y - 20, "Instances", oText))
	{
		textTop = false;
		fontText = fntMiniText;
		textString = "1 LIFE";
	}
	global.lifeAdded = false;
}

draw_set_font(-1);

// Draw DEBUG mode state
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text_transformed(global.gameWidth, 0, string(global.debugMode), 0.5, 0.5, 0);
draw_text_transformed(global.gameWidth, 10, string(instance_count), 0.5, 0.5, 0);

draw_set_halign(-1);
draw_set_valign(-1);