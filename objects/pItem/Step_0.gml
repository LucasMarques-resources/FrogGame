/// @description Insert description here
// You can write your code in this editor

colWater = place_meeting(x, y, oWater);

// Water (values)
if (colWater)
{
	grav = .1;

	velh = lerp(velh, 0, 0.05);
	velv = lerp(velv, 0, 0.05);
}
else
{
	grav = gravD;
}

// Set beingDragged to false
with (oFrog)
{
	if (!place_meeting(x + velh, y, pBox))
	{
		other.beingDragged = false;
	}
}

velv += grav;

timerCatch--;

if ((object_index = oLoader && global.hasGun) && (object_index != oLife || (object_index = oLife && global.plHp < global.plTotalHp)))
{
	if (collision_rectangle(x - 15, y - 5, x + 15, y + 5, oFrog, false, true))
	{
		velh += lengthdir_x(0.2, point_direction(x, y, oFrog.x, oFrog.y));
	}
}
/*
var radius = point_distance(x, y, oFrog.x, oFrog.y);

// Create text
if (radius < 20 && global.hasGun && !instance_exists(oText))
{	
	if (textCrea)
	{
		with (instance_create_layer(x, y - 10, layer, oText))
		{
			other.textObj = self;
			itemCreator = other.id;
			normalText = true;
			textString = "PRESS E";
			length = string_length(textString);
		}
		textCrea = false;
	}	
}

// Destroy text object when player leaves radius
if (!(radius < 25))
{
	textCrea = true;
	if (textObj) textObj.itemCreator = noone;
	instance_destroy(textObj);
}
*/