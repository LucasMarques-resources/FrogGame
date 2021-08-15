/// @description desc

#region Collisions

// Horizontal Collision WALL
HorizontalCollision(pCollider, false, 0);

// Horizontal Collision BOX
if (place_meeting(x + velh, y, pBox))
{
	repeat (abs(velh) + 1) {
      if (place_meeting(x + sign(velh), y, pBox))
         break;
      x += sign(velh);
	}
	with (instance_place(x + velh, y, pBox))
	{
		if (!beingIceDamaged)
		{
			velh = sign(other.velh);
			beingDragged = true;
		}
	}
	velh = 0;
}

x += velh;

// Vertical Collision
VerticalCollision(pCollider, false, 0, 0);

// Vertical Collision
VerticalCollision(pBox, false, 0, 0);

y += velv;

#endregion