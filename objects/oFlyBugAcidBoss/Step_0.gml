/// @description desc

timerSpawn--;

if (timerSpawn > 0)
{
	velh = lengthdir_x(1, point_direction(xstart, ystart, xstart + xGo, ystart + yGo))
	velv = lengthdir_y(1, point_direction(xstart, ystart, xstart + xGo, ystart + yGo))
}

if (timerSpawn <= 0)
{
	event_inherited();
}