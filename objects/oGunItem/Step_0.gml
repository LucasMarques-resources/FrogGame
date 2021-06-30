/// @description Insert description here
// You can write your code in this editor

image_index = typeItem;

var radius = point_in_circle(oFrog.x, oFrog.y, x, y, 25);

if (radius && global.hasGun && velh == 0)
{
	//with (oFrog) other.radiusId = collision_circle(x, y, 30, other, false, true);
	
	activate = true;
	if (textCrea)
	{
		with (instance_create_layer(x, y - 10, layer, oText))
		{
			other.textObj = self;
			normalText = true;
			textString = "PRESS E";
			length = string_length(textString);
		}
		textCrea = false;
	}
			
	if (keyboard_check_pressed(ord("E")))
	{
		activate = false;
		textCrea = true;
		
		with (instance_create_layer(oGun.x, oGun.y - 10, "Instances", oGunItem))
		{
			image_xscale = oFrog.image_xscale;
			if (image_xscale = 1) var dir = 45; else dir = 135;
			
			velh = lengthdir_x(3, dir);
			velv = lengthdir_y(3, dir);
			
			itemOwnAmmo = oGun.ownAmmo;
			typeItem = oGun.typeGun;
		}
		instance_destroy(oGun);

		global.currentGun = noone;
		global.hasGun = false;
		instance_destroy(textObj);
		pickUpGun = true;
	}	
}
if (!radius)
{
	activate = false;
	textCrea = true;
	instance_destroy(textObj);
}

// Create gun
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


if (velv != 0) velv += grav; // Floating
else y = yStart + sin(get_timer() / 400000) * 3;

x += velh;
y += velv;