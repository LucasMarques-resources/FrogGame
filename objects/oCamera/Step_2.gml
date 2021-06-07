/// @description Insert description here
// You can write your code in this editor
if (instance_exists(target))
{
	viewX = room_width / 2;
	viewY = room_height / 2;
	
	// Screen sahke
	viewX += random_range(-shake_remain, shake_remain);
	viewY += random_range(-shake_remain, shake_remain);
	shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));
	
	vm = matrix_build_lookat(viewX, viewY, -10, viewX, viewY, 0, 0, 1, 0);
	camera_set_view_mat(camera, vm);
}