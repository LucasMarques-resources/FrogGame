/// @description desc

// Moving platform collision
var _movingPlatform = instance_place(x, y + max(1, velv), oPlatformMoving);
if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) {
	// Pixel-perfect collisions
	if (velv > 0) {
		while (!place_meeting(x, y + sign(velv), oPlatformMoving)) {
			y += sign(velv);
		}
	
		velv = 0;
	}
	
	// Add velocity
	var hcol = instance_place(x + _movingPlatform.moveX, y, pCollider);
	if (!hcol) x += _movingPlatform.moveX;
	y += _movingPlatform.moveY;
}

#region Collisions

// Horizontal
var hCol = instance_place(x + velh, y, pCollider);
if (hCol)
{
	if (hCol.normalCollider)
	{
		repeat (abs(velh) + 1) {
			if (place_meeting(x + sign(velh), y, pCollider))
				break;
			x += sign(velh);
		}
		velh = 0;
	}
}

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
var vCol = instance_place(x, y + velv, pCollider);
if (vCol)
{
	if (vCol.normalCollider)
	{
		repeat (abs(velv) + 1) {
			if (place_meeting(x, y + sign(velv), pCollider))
				break;
			y += sign(velv);
		}
		velv = 0;
	}
}

// Vertical Collision
VerticalCollision(pBox, false, 0, 0);

y += velv;

#endregion