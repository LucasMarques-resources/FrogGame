/// @description Insert description here
// You can write your code in this editor
var amount = irandom_range(4, 6);

CreateParticles(x, y, amount, sGrassTileParticles, 100, 1, .2, .3, 2.5, true, false, room_speed / 1.8, 0, 0, 0, true);

if (doAutoTileWall)
{
	var _list = ds_list_create();
	var _num = collision_circle_list(x, y, 16, pCollider, false, true, _list, false);
	if (_num > 0)
	{
		for (var i = 0; i < _num; ++i)
		{
			// Add the walls's id to the list
			ds_list_add(oControl.raycastWallsChecked, _list[| i]);
		}
	}
	ds_list_destroy(_list);
	with (oControl) doAutoTile = true;
}