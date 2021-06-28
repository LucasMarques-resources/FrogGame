/// @description Insert description here
// You can write your code in this editor

image_index = typeItem;
show_debug_message(itemOwnAmmo);

var radius = point_in_circle(oFrog.x, oFrog.y, x, y, 30);
var longRadius = point_in_circle(oFrog.x, oFrog.y, x, y, 40);

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
	{/*
		global.currentGun.velh = lengthdir_x(3, 45);
		global.currentGun.velv = lengthdir_y(3, 45);*/

		activate = false;
		textCrea = true;
		
		with (instance_create_layer(oGun.x, oGun.y - 20, "Instances", oGunItem))
		{
			velh = lengthdir_x(3, 45);
			velv = lengthdir_y(3, 45);
			
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
if (!longRadius)
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