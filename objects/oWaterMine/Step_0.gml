/// @description desc
event_inherited();

y = yStart + sin(get_timer() / 500000) * 3;

if (instance_exists(oFrog))
{
	if (point_distance(x, y, oFrog.x, oFrog.y) < radius)
	{
		activated = true;
	}
	var p = instance_place(x, y, pShootable);
	if (place_meeting(x, y, oFrog) || (p && p.destructible)) && activateCol
	{
		timerToExplode = 10;
		activated = true;
		activateCol = false;
	}
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