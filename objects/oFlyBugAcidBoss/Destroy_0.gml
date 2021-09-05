/// @description desc

var _angle = choose(135, 120, 30, 140, 60, 45);
with (instance_create_layer(x, y - 5, "Items", oLoader))
{
	direction = _angle;
	velh += lengthdir_x(irandom_range(1, 5), _angle);
	velv += lengthdir_y(irandom_range(1, 5), _angle);
}

ScreenShake(5, 5);