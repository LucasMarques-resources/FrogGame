/// @description Insert description here
// You can write your code in this editor

global.mySystem = part_system_create();

global.myParticle = part_type_create();

part_type_sprite(global.myParticle, sParticle, false, false, false);
part_type_life(global.myParticle, room_speed / 6, room_speed / 5);
part_type_size(global.myParticle, 0.6, 0.8, 0, 0);
part_type_orientation(global.myParticle, 0, 359, 0, 20, 1);
//part_type_color_rgb(global.myParticle, 109, 74, 117, 84, 141, 98);
part_type_color_mix(global.myParticle, c_red, c_yellow)
part_type_blend(global.myParticle, true);
part_type_direction(global.myParticle, 70, 100, 1, 1);
part_type_speed(global.myParticle, 0.5, 1, .01, .01);
part_type_alpha3(global.myParticle, 1, 0.5, 0);