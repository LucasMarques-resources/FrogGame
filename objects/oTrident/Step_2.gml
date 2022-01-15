/// @description desc

if (collision)
{
	// Horizontal
	if (place_meeting(x + velh, y, pCollider) || place_meeting(x + velh, y, pBox))
	{
		collided = true;
		repeat (abs(velh) + 1) {
			if (place_meeting(x + sign(velh), y, pCollider) || place_meeting(x + sign(velh), y, pCollider))
				break;
			x += sign(velh);
		}
		velh = 0;
	}
}
	
x += velh;

if (collision)
{
	// Vertical
	if (place_meeting(x, y + velv, pCollider) || place_meeting(x, y + velv, pCollider))
	{
		collided = true;
		repeat (abs(velv) + 1) {
			if (place_meeting(x + sign(velh), y, pCollider) || place_meeting(x + sign(velh), y, pCollider))
				break;
			y += sign(velv);
		}
		velv = 0;
	}
}

y += velv;