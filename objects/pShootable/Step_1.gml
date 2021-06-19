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
	while (!place_meeting(x + sign(velh), y, oWall))
	{
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
		while (!place_meeting(x, y + sign(velv), oWall))
		{
			y += sign(velv);
		}
		velv = 0;
	}
}
#endregion

#region COLLISION WITH FROG
if (!enemy)
{
	//Horizontal Collision
	if (place_meeting(x + velh, y, oFrog))
	{
		while (!place_meeting(x + sign(velh), y, oFrog))
		{
			x += sign(velh);
		}
		velh = 0;
	}
	
	// Vertical Collision
	if (place_meeting(x, y + velv, oFrog))
	{
		while (!place_meeting(x, y + sign(velv), oFrog))
		{
			y += sign(velv);
		}
		velv = 0;
	}
}
#endregion

// Stop knock back
if (velh != 0)
{
	velh = lerp(velh, 0, 0.1);
	velv = lerp(velv, 0, 0.1);
}

x += velh;
y += velv;