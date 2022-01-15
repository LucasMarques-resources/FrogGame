/// @description desc

if (timerSpawn > 0)
{
    timerSpawn--;

    velh = lengthdir_x(1, point_direction(xstart, ystart,  xstart + xGo, ystart + yGo));
    velv = lengthdir_y(1, point_direction(xstart, ystart,  xstart + xGo, ystart + yGo));
}

if (!inheritedParent)
{
    if (timerSpawn <= 0)
    {
        colShootable = false;
        state = STATES.chase;
        inheritedParent = true;
    }
}

if (inheritedParent)
    event_inherited();