/// @description Insert description here
// You can write your code in this editor

event_inherited();

// Dragging boxes
if (place_meeting(x + velh, y, pBox))
{
	repeat (abs(velh) + 1) {
	    if (place_meeting(x + sign(velh), y, pBox))
	        break;
	    x += sign(velh);
	}
	with (instance_place(x + velh, y, pBox)) velh = sign(other.velh);
	velh = 0;
}
