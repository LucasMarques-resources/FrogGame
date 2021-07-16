// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Raycast(size, obj, dir){
	/// @arg line_size
	/// @arg collision_object
	/// @arg line_direction
	/// @arg interaction_with_pShootable
	/// @arg damage
	/// @arg knock_back_value
	
	var xx = x + lengthdir_x(size, dir);
	var yy = y + lengthdir_y(size, dir);
		
	// Colliding with the some object
	var _other = collision_line(x, y, xx, yy, obj, 1, 1);
		
	draw_line_color(x, y, xx, yy, c_red, c_red);
	
	if (_other)
	{	
		return _other;
	}
	
	return false;
}