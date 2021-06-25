/// @description Insert description here
// You can write your code in this editor
if (yMove) y -= 0.2;
else textString = " +" + string(oControl.ammoBeingAdded);
alpha -= 0.02;

if (alpha <= 0)
{
	instance_destroy();
}