/// @description Insert description here
// You can write your code in this editor
if (instance_exists(followId))
{
	x = followId.x;
	y = followId.y;
} else instance_destroy();


/*
//var colId = instance_place(x, y, followId);
var colId = instance_place(x, y, pShootable);
if (colId)
{
	with (colId)
	{
		

	}
}
