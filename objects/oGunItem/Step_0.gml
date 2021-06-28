/// @description Insert description here
// You can write your code in this editor
image_index = typeItem;
show_debug_message(itemOwnAmmo);

var radius = point_in_circle(oFrog.x, oFrog.y, x, y, 30);
var longRadius = point_in_circle(oFrog.x, oFrog.y, x, y, 40);


if (radius && global.hasGun)
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
		global.currentGun.dropped = true;
		global.currentGun.velh = lengthdir_x(3, 45);
		global.currentGun.velv = lengthdir_y(3, 45);

		activate = false;
		textCrea = true;

		global.currentGun = noone;
		global.hasGun = false;
		instance_destroy(textObj);

	}
}
if (!longRadius)
{
	activate = false;
	textCrea = true;
	instance_destroy(textObj);
}

// Floating
y = ystart + sin(get_timer() / 400000) * 3;