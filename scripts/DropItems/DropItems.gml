// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DropItems(argument0, argument1, argument2){
	/// @arg x
	/// @arg y
	/// @arg [items] array of items to drop
	
	var _items = array_length_1d(argument2);
	
	for (var i = 0; i < _items; i++)
	{
		var _angle = choose(135, 120, 30, 140, 60, 45);
		with (instance_create_layer(argument0, argument1, "Items", argument2[i]))
		{
			direction = _angle;
			velh += lengthdir_x(4, _angle);
			velv += lengthdir_y(4, _angle);
		}
	}
}