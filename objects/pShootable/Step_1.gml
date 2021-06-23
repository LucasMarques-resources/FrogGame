/// @description Insert description here
// You can write your code in this editor

// Destroying
if (hp <= 0) 
{
	with (instance_create_layer(x, y, "Particles", oExplosion))
	{
		scale = other.scaleExplosion;
	}
	instance_destroy();
}

#region COLLISION WITH WALL
//Horizontal Collision
if (place_meeting(x + velh, y, oWall))
{
	repeat (abs(velh) + 1) {
      if (place_meeting(x + sign(velh), y, oWall))
         break;
      x += sign(velh);
	}
	if (!collision) velh = 0;
	else velh *= -.3;
}

// Vertical Collision
if (VknockBack)
{
	if (place_meeting(x, y + velv, oWall))
	{
		repeat (abs(velv) + 1) {
			if (place_meeting(x, y + sign(velv), oWall))
				break;
			y += sign(velv);
		}
		velv = 0;
	}
}
#endregion

#region COLLISION (HORIZONTAL) WITH BOXES
//Horizontal Collision
if (place_meeting(x + velh, y, pBox))
{	
	repeat (abs(velh) + 1) {
      if (place_meeting(x + sign(velh), y, pBox))
         break;
      x += sign(velh);
    }
	if (!collision) velh = 0;
	else velh *= -.3;
}
#endregion

#region COLLISION WITH FROG
if (!enemy)
{
	//Horizontal Collision
	if (place_meeting(x + velh, y, oFrog))
	{
		repeat (abs(velh) + 1) {
	      if (place_meeting(x + sign(velh), y, oFrog))
	         break;
	      x += sign(velh);
	    }
		velh = 0;
	}
	
	// Vertical Collision
	if (place_meeting(x, y + velv, oFrog))
	{
		repeat (abs(velv) + 1) {
	      if (place_meeting(x, y + sign(velv), oFrog))
	         break;
	      y += sign(velv);
	    }
		velv = 0;
	}
}
#endregion

// Stop knock back
if (velh != 0 && !oFrog.dragging)
{
	velh = lerp(velh, 0, 0.1);
	velv = lerp(velv, 0, 0.1);
}

x += velh;
y += velv;