/// @description Insert description here
// You can write your code in this editor

damagerRadius = 30;

autoTiling = false;
wallsToAutoTiling = ds_list_create();

explosionDirection = 0;

raycastCheck = false;
wallsDir = 0;

with (oControl)
{
	raycastWallsChecked = ds_list_create();
}