/// @description Insert description here
// You can write your code in this editor
var list = ds_list_create();
var num = collision_circle_list(x, y, damagerRadius, pShootable, false, true, list, false);
if (num > 0)
{
	for (var i = 0; i < num; i++)
	{
		with (list[| i])
		{
			if (!item)
			{
				hp -= 5;
				colShootable = true;
				knockBack = 2;
				hitFrom = other.direction;
				if (hp < 1) other.create = false;
					
				instance_destroy(other);
			}
		}
	}
}
ds_list_destroy(list);

instance_destroy();