/// @description desc

velh = 0;
velv = 0;
grav = .3;

collided = false;
createThunder = true;

backToPlayerDelay = room_speed * 2;
backToPlayerDelayD = backToPlayerDelay;

collision = true;
giveDamage = true;

tridentGunGridPos = 0;

velh = lengthdir_x(4, point_direction(x, y, mouse_x, mouse_y));
velv = lengthdir_y(7, point_direction(x, y, mouse_x, mouse_y));