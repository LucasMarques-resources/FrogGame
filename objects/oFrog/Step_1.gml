/// @description Insert description here
// You can write your code in this editor

var temp = place_meeting(x, y + 1, oWall);

if (temp && !ground)
{
	instance_create_layer(x, y, "Particles", oFallParticle);
}

#region Collisions

//Horizontal Collision
if (place_meeting(x + velh, y, oWall))
{
	while (!place_meeting(x + sign(velh), y, oWall))
	{
		x += sign(velh);
	}
	velh = 0;
}

// Vertical Collision
if (place_meeting(x, y + velv, oWall))
{
	while (!place_meeting(x, y + sign(velv), oWall))
	{
		y += sign(velv);
	}
	velv = 0;
}

//Horizontal Collision
if (place_meeting(x + velh, y, pBox))
{
	dragging = true;
	while (!place_meeting(x + sign(velh), y, pBox))
	{
		x += sign(velh);
	}
	pBox.velh = sign(velh);
	velh = 0;
}
else dragging = false;

// Vertical Collision
if (place_meeting(x, y + velv, pBox))
{
	while (!place_meeting(x, y + sign(velv), pBox))
	{
		y += sign(velv);
	}
	velv = 0;
}

#endregion

x += velh;
y += velv;