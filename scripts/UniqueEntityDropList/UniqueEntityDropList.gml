// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UniqueEntityDropList()
{
	var _uniqueEntityDropList = 0;
	if (pShootable)
	{
		_uniqueEntityDropList = choose
		(
			[oLife],
			[oLife],
			[oLoader],
			[oLoader],
			[oLoader],
			-1,
			-1,
			-1,
			-1,
			-1,
			-1,
			-1,
			[oAddLifeItem],
			[oAddLifeItem]
		)
	}
	if (pBox)
	{
		_uniqueEntityDropList = choose
		(
			[oLife],
			[oLife],
			[oLoader],
			[oLoader],
			[oLoader],
			[oAddLifeItem],
			-1,
			-1,
			-1,
			-1
		)	
	}

	return _uniqueEntityDropList;
}