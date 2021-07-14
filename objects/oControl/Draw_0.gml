/// @description Insert description here
// You can write your code in this editor

if (global.drawGrid)
{
	for (var i = 0; i < room_width / 16; i++)
	{
		draw_line(i * 16, 0, i * 16, room_height);
	}
	for (var j = 0; j < room_height / 16; j++)
	{
		draw_line(0, j * 16, room_width, j * 16);
	}
}