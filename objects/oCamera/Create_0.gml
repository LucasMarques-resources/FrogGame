/// @description Insert description here
// You can write your code in this editor
camera = camera_create();
vm = matrix_build_lookat(0, 0, -10, 0, 0, 0, 0, 1, 0);
pm = matrix_build_projection_ortho(global.gameWidth, global.gameHeight, 1.0, 3200);
viewX = 0;
viewY = 0;
target = oControl;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;