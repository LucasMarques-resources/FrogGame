/// @description Insert description here
// You can write your code in this editor

destroy = false;
for (var i = 0; i < ds_list_size(global.itensSaveList); i++)
{
	if (global.itensSaveList[| i] == id)
	{
		destroy = true;
		instance_destroy();
	}
}

// Variables
velh = 0;
velv = 0;
grav = 0.3;
hitFrom = 0;
flash = 0;
colShootable = false;
beingDragged = false;
colWater = false;

textCrea = true;

timerCatch = room_speed;

drawOutLine = false;

uniformHandle = shader_get_uniform(shOutLine, "texturePixel");

// Default values
gravD = grav;