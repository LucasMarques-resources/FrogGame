/// @description Insert description here
// You can write your code in this editor

event_inherited();

// Dragging boxes
if (place_meeting(x + velh, y, pBox))
{
	while (!place_meeting(x + sign(velh), y, pBox))
	{
		x += sign(velh);
	}
	with (instance_place(x + velh, y, pBox)) velh = sign(other.velh);
	velh = 0;
}