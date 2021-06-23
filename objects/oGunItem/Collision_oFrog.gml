/// @description Insert description here
// You can write your code in this editor
global.hasGun = true;
instance_create_layer(other.x, other.y, "Gun", oGun);
instance_create_layer(mouse_x, mouse_y, "Top", oAim);
instance_destroy();