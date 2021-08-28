/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

textCrea = true;

itemOwnAmmo = 0;

pickUpGun = false;

velh = 0;
velv = 0;

yStart = y;

grav = .3;

drawOutLine = false;

uniformHandle = shader_get_uniform(shOutLine, "texturePixel");

destroy = false;

// Item initial ammo
for (var i = 1; i < GUN_TYPES.total; i++)
{
	if (typeItem == i)
	{
		itemOwnAmmo = global.gunsGridStatus[i, GUN_STATUS.maxAmmo];
	}
}

destroy = false;
for (var i = 0; i < ds_list_size(global.itensSaveList); i++)
{
	if (global.itensSaveList[| i] == id)
	{
		destroy = true;
		instance_destroy();
	}
}