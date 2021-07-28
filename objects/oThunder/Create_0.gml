/// @description desc

alarm[0] = irandom_range(15, 35);

trailParts = 90;

arrayPosX[0] = x;
arrayPosY[0] = y;
glowArrayAngle[0] = 270;

createThunderDamager = true;

for (var i = 1; i < trailParts; i++)
{
	var diversion = irandom_range(0, 30);
	var dir = irandom_range(270-diversion, 270+diversion);
	var length = random_range(1, 20);
	var leX = lengthdir_x(length, dir);
	var leY = lengthdir_y(length, dir);
	
	arrayPosX[i] = arrayPosX[i - 1] + leX;
	arrayPosY[i] = arrayPosY[i - 1] + leY;
	glowArrayAngle[i] = dir;
}

color = c_purple;

lineScale = choose(1, 2);