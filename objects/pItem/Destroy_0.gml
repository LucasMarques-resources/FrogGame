/// @description Insert description here
// You can write your code in this editor
with (instance_create_layer(x, y, "Particles", oDust)) sprite_index = sMiniDust;

if (instance_exists(oControl.pressEtextObj) && oControl.pressEtextObj.objCreator == id)
{
	oControl.pressEtextObj.objCreator = noone;
	instance_destroy(oControl.pressEtextObj);
}