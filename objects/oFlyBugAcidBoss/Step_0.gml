/// @description desc

timerSpawn--;

if (timerSpawn > 0)
{
	x = lerp(x, xstart + xGo, 0.1);
	y = lerp(y, ystart + yGo, 0.1);
}

if (timerSpawn <= 0)
{
	event_inherited();
}