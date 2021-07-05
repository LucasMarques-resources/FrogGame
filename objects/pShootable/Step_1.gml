/// @description Insert description here
// You can write your code in this editor

// Destroying
if (hp <= 0 && destructible)
{
	with (instance_create_layer(x, y, "Particles", oExplosion))
	{
		scale = other.scaleExplosion;
	}
	
	if (itemDropper)
	{
		entityDropList = uniqueEntityDropList;
	}
	
	ScreenShake(5, 6);
	instance_destroy();
}

#region COLLISIONS

//Horizontal Collision WALL
if (place_meeting(x + velh, y, oWall))
{
	repeat (abs(velh) + 1) {
      if (place_meeting(x + sign(velh), y, oWall))
         break;
      x += sign(velh);
	}
	if (!colBounce) velh = 0;
	else velh *= -.3;
}

//Horizontal Collision BOX
if (place_meeting(x + velh, y, pBox))
{
	repeat (abs(velh) + 1) {
      if (place_meeting(x + sign(velh), y, pBox))
         break;
      x += sign(velh);
    }
	if (!colBounce) velh = 0;
	else velh *= -.3;
}

// Horizontal Collision FROG
if (!enemy && colFrog)
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
}

x += velh;

// Vertical Collision WALL
if (place_meeting(x, y + velv, oWall))
{
	repeat (abs(velv) + 1) {
		if (place_meeting(x, y + sign(velv), oWall))
			break;
		y += sign(velv);
	}
	if (!colBounce) velv = 0;
	else velv *= -.3;
}

// Vertical Collision BOX
if (place_meeting(x, y + velv, pBox))
{
	repeat (abs(velv) + 1) {
	    if (place_meeting(x, y + sign(velv), pBox))
	        break;
	    y += sign(velv);
	}
	velv = 0;
}

// Vertical Collision FROG
if (!enemy && colFrog)
{
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

y += velv;