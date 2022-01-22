/// @description Insert description here
// You can write your code in this editor

ownAmmo = GetGunAmmoOnGrid();

// Updating image angle and postion
if (instance_exists(oFrog) && global.hasGun)
{
	x = oFrog.x;
	y = oFrog.y - 6;
	
	if (!global.plRoll)
	{
		if (oFrog.controller == 0)
		{
			image_angle = point_direction(x, y, mouse_x, mouse_y);
		}
		else
		{
			var controllerh = gamepad_axis_value(0, gp_axisrh);
			var controllerv = gamepad_axis_value(0, gp_axisrv);
			if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2)
			{
				controllerAngle = point_direction(0, 0, controllerh, controllerv);
			}
			image_angle = controllerAngle;
		}
	}
}

if (global.plRoll)
{
	image_angle -= (global.plRollDir * 10);
}

if (image_angle > 90) && (image_angle < 270) image_yscale = -1;
else image_yscale = 1;