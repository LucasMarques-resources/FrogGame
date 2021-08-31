/// @description desc

// Move
x += moveX;
y += moveY;

// Check if it is at start position
if (goingToStart && point_distance(x, y, startX, startY) < currentSpeed)
{
	goingToStart = false;
	currentSpeed = 0;
	alarm[0] = waitTime;
}
// Check if it is at ending position
else if (!goingToStart && point_distance(x, y, endX, endY) < currentSpeed)
{
	goingToStart = true;
	currentSpeed = 0;
	alarm[0] = waitTime;
}