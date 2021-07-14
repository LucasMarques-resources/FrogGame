/// @description Insert description here
// You can write your code in this editor
var n = 360;
for (var i = 0; i < n; i++)
{
	var dir = i;
	
	Raycast(damagerRadius, oWall, dir, true, 5, 2);
	var c = Raycast(30, oWall, dir, false, 0, 0);
	if (c) with (c) hp -= hp;
	
}
instance_destroy();