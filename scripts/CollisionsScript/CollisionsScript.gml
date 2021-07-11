// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HorizontalCollision(object, bouncing, bouncingValue){
	// Horizontal
	if (place_meeting(x + velh, y, object))
	{
		repeat (abs(velh) + 1) {
			if (place_meeting(x + sign(velh), y, object))
			    break;
			x += sign(velh);
		}
		if (bouncing) velh *= -bouncingValue;
		else velh = 0;
		
		return true;
	}
	else return false;
}

function VerticalCollision(object, bouncing, bouncingValue, bouncingH){
	// Vertical
	if (place_meeting(x, y + velv, object))
	{
		repeat (abs(velv) + 1) {
			if (place_meeting(x, y + sign(velv), object))
			    break;
			y += sign(velv);
		}
		if (bouncing)
		{
			velv *= -bouncingValue;
			if (bouncingH) velh = lerp(velh, 0, 0.7);
		}
		else velv = 0;
	}
}