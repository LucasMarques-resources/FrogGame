/// @description Insert description here
// You can write your code in this editor
// Horizontal Collision
if (place_meeting(x + velh, y, oWall)) {
	repeat (abs(velh) + 1) {
	    if (place_meeting(x + sign(velh), y, oWall))
	        break;
	    x += sign(velh);
	}
	if (velv != 0) yStart = y;
	velh = 0;
}

// Vertical Collision
if (place_meeting(x, y + velv, oWall)) {
	repeat (abs(velv) + 1) {
	    if (place_meeting(x, y + sign(velv), oWall))
	        break;
	    y += sign(velv);
	}
	if (velv != 0) yStart = y;
	velv = 0;
	velh = 0;
}

// Horizontal Collision
if (place_meeting(x + velh, y, pBox)) {
	repeat (abs(velh) + 1) {
	    if (place_meeting(x + sign(velh), y, pBox))
	        break;
	    x += sign(velh);
	}
	if (velv != 0) yStart = y;
	velh = 0;
}

// Vertical Collision
if (place_meeting(x, y + velv, pBox)) {
	repeat (abs(velv) + 1) {
	    if (place_meeting(x, y + sign(velv), pBox))
	        break;
	    y += sign(velv);
	}
	if (velv != 0) yStart = y;
	velv = 0;
	velh = 0;
}