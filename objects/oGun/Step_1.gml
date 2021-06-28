/// @description Insert description here
// You can write your code in this editor
ownAmmo = global.ammo;
// Updating image angle and postion
if (!dropped)
{
	if (instance_exists(oFrog) && global.hasGun)
	{
		x = oFrog.x;
		y = oFrog.y - 4;
	
		image_angle = point_direction(x, y, mouse_x, mouse_y);
	}

	if (image_angle > 90) && (image_angle < 270) image_yscale = -1;
	else image_yscale = 1;
}
else
{
	// Horizontal Collision
	if (place_meeting(x + velh, y, oWall)) {
	   repeat (abs(velh) + 1) {
	      if (place_meeting(x + sign(velh), y, oWall))
	         break;
	      x += sign(velh);
	   }
	   velh = 0;
	}

	// Vertical Collision
	if (place_meeting(x, y + velv, oWall)) {
	   repeat (abs(velv) + 1) {
	      if (place_meeting(x, y + sign(velv), oWall))
	         break;
	      y += sign(velv);
	   }
	   velv = 0;
	   velh = 0;
       
	   with (instance_create_layer(x, y, "Instances", oGunItem))
	   {
		   itemOwnAmmo = other.ownAmmo;
		   typeItem = other.typeGun;
	   }
	   instance_destroy();
	}

	// Horizontal Collision
	if (place_meeting(x + velh, y, pBox)) {
	   repeat (abs(velh) + 1) {
	      if (place_meeting(x + sign(velh), y, pBox))
	         break;
	      x += sign(velh);
	   }
	   velh = 0;
	}

	// Vertical Collision
	if (place_meeting(x, y + velv, pBox)) {
	   repeat (abs(velv) + 1) {
	      if (place_meeting(x, y + sign(velv), pBox))
	         break;
	      y += sign(velv);
	   }
	   velv = 0;
	   velh = 0;
	   
	   with (instance_create_layer(x, y, "Instances", oGunItem))
	   {
		   itemOwnAmmo = other.ownAmmo;
		   typeItem = other.typeGun;
	   }
	   instance_destroy();
	}
}