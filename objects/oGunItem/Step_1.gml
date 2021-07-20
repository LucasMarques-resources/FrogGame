/// @description Insert description here
// You can write your code in this editor

// Horizontal Collision WALL
if (place_meeting(x + velh, y, pCollider)) {
	repeat (abs(velh) + 1) {
	    if (place_meeting(x + sign(velh), y, pCollider))
	        break;
	    x += sign(velh);
	}
	if (velv != 0) yStart = y;
	velh = 0;
}

// Horizontal Collision BOX
if (place_meeting(x + velh, y, pBox)) {
	repeat (abs(velh) + 1) {
	    if (place_meeting(x + sign(velh), y, pBox))
	        break;
	    x += sign(velh);
	}
	if (velv != 0) yStart = y;
	velh = 0;
}

x += velh;

// Vertical Collision WALL
if (place_meeting(x, y + velv, pCollider)) {
	repeat (abs(velv) + 1) {
	    if (place_meeting(x, y + sign(velv), pCollider))
	        break;
	    y += sign(velv);
	}
	if (velv != 0) yStart = y;
	velv = 0;
	velh = 0;
}

// Vertical Collision BOX
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

y += velv;