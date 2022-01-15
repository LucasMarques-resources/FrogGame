/// @description desc

for (var i = 0; i < ds_list_size(global.chestSaveList); i++)
{
	if (global.chestSaveList[| i] == id)
	{
		instance_destroy();
	}
}

velh = 0;
velv = 0;
grav = .3;

textCrea = true;
pressEtextObjId = noone;

image_speed = 0;

activateChest = false;
createChestItem = true;

drawOutLine = false;

uniformHandle = shader_get_uniform(shOutLine, "texturePixel");