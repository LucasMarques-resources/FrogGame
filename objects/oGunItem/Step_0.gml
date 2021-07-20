/// @description Insert description here
// You can write your code in this editor

image_index = typeItem;

var radius = point_distance(x, y, oFrog.x, oFrog.y);

var colWater = place_meeting(x, y, oWater);

if (colWater)
{
	grav = .1;
	
	velh = lerp(velh, 0, 0.15);
	velv = lerp(velv, 0, 0.15);
}
else grav = .3;

// Create text
if (radius < 25 && global.hasGun && velh == 0 && !instance_exists(oText))
{	
	if (textCrea)
	{
		with (instance_create_layer(x, y - 10, layer, oText))
		{
			other.textObj = self;
			itemCreator = other.id;
			normalText = true;
			textString = "PRESS E";
			length = string_length(textString);
		}
		textCrea = false;
	}	
}

// Destroy text object when player leaves radius
if (!(radius < 25))
{
	textCrea = true;
	if (textObj) textObj.itemCreator = noone;
	instance_destroy(textObj);
}


if (!global.hasGun && pickUpGun)
{
	with (instance_create_layer(oFrog.x, oFrog.y, "Gun", oGun))
	{
		typeGun = other.typeItem;
		global.currentGun = self;
		
		ownAmmo = other.itemOwnAmmo;
		
		global.ammo = ownAmmo;
	}
	if (!instance_exists(oAim)) instance_create_layer(mouse_x, mouse_y, "Top", oAim);
	instance_destroy();
	global.hasGun = true;
}

if (!colWater)
{
	if (velv != 0) velv += grav; // Floating
	else y = yStart + sin(get_timer() / 400000) * 3;
} else
{
	mask_index = sGunItemMask;
	velv += grav;
}