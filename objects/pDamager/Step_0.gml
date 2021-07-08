/// @description Insert description here
// You can write your code in this editor
// Collisions with raycast
var n = 360;
for (var i = 0; i < n; i++)
{
	var dir = i;
	
	Raycast(damagerRadius, oWall, dir, true, 5, 2);
}
instance_destroy();