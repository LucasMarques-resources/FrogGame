/// @description Insert description here
// You can write your code in this editor
draw_self();

if (flash > 0)
{
	flash--;
	image_speed = 0;
	shader_set(shFlashWhite);
	draw_self();
	shader_reset();
}
else image_speed = 1;