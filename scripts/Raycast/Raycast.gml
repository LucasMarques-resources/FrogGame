// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Raycast(size, obj, dir, xxx, yyy){
	/// @arg line_size
	/// @arg collision_object
	/// @arg line_direction
	
	for (var i = 0; i < size; i++)
	{
		var xx = xxx + lengthdir_x(i, dir);
		var yy = yyy + lengthdir_y(i, dir);
		
		// Colliding with the some object
		var _other = collision_line(xxx, yyy, xx, yy, obj, 1, 1);
		var _coll = collision_line(xxx, yyy, xx, yy, pCollider, 1, 1);

		draw_line_color(x, x, xx, yy, c_red, c_red);
		
		if (_coll && !_coll.destructible) break;
		
		if (_other)
		{
			return _other;
			break;
		}
	}
	return false;
}