/// @description Insert description here
// You can write your code in this editor
damagerCrea = true;

if (entityDropList != -1)
{
	var xx = x;
	var yy = y;
	if (enemy)
	{
		xx = x;
		yy = y;
	}
	else
	{
		xx = x + sprite_width / 2;
		yy = y + sprite_height / 3;
	}
	DropItems(xx, yy, entityDropList);
}