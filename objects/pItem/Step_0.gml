/// @description Insert description here
// You can write your code in this editor
event_inherited();

timerCatch--;

if (object_index != oLife || (object_index = oLife && global.plHp < global.plTotalHp))
{
	if (collision_rectangle(x - 15, y - 5, x + 15, y + 5, oFrog, false, true))
	{
		velh += lengthdir_x(0.2, point_direction(x, y, oFrog.x, oFrog.y));
	}
}