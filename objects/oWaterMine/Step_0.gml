/// @description desc
event_inherited();

y = yStart + sin(get_timer() / 500000) * 3;

if (instance_exists(oFrog))
{
	if (point_distance(x, y, oFrog.x, oFrog.y) < radius)
	{
		activated = true;
	}
	if (place_meeting(x, y, oFrog)) instance_destroy();
}

if (activated)
{
	timerToExplode--;
	
	image_speed += 0.2;
	
	if (timerToExplode <= 20)
	{
		image_xscale += 0.01;
		image_yscale = image_xscale;
	}
	if (timerToExplode <= 0)
	{
		instance_destroy();
	}
}