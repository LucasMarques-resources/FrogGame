// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Raycast(size, obj, dir, pShoot, damage, knockBackValue){
	/// @arg line_size
	/// @arg collision_object
	/// @arg line_direction
	/// @arg interaction_with_pShootable
	/// @arg damage
	/// @arg knock_back_value
	
	for (var i = 0; i < size; i++)
	{
		var xx =  x + lengthdir_x(i, dir);
		var yy =  y + lengthdir_y(i, dir);
		
		// Colliding with the some object
		var _other = collision_line(x, y, xx, yy, obj, 1, 1);
		// Colliding with pShootable just if pShoot is true
		if (pShoot) var shootableCol = collision_line(x, y, xx, yy, pShootable, 1, 1);
		
		draw_line_color(x, y, xx, yy, c_red, c_red);
		
		if (_other)
		{	
			return _other;
			break;
		}
		
		// Shootable collision
		if (pShoot)
		{
			with (shootableCol)
			{
				if (!item)
				{
					hp -= damage;
					colShootable = true;
					knockBack = knockBackValue;
					hitFrom = other.direction;
					if (oBox) createFireParticles = true;
				}
			}
		}
	}
	
	return false;
}