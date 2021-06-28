/// @description Insert description here
// You can write your code in this editor

// Create gun
if (!global.hasGun)
{
	with (instance_create_layer(oFrog.x, oFrog.y, "Gun", oGun))
	{
		typeGun = other.typeItem;
		global.currentGun = self;
		
		ownAmmo = other.itemOwnAmmo;

		global.ammo = ownAmmo;
	}
	instance_create_layer(mouse_x, mouse_y, "Top", oAim);
	instance_destroy();
	global.hasGun = true;
}