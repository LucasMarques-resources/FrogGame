// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UniqueEntityDropList()
{
	var _uniqueEntityDropList = 0;
	if (pShootable)
	{
		randomize();
		
		var percent = random_range(0, 100)
		
		if (percent <= 20) _uniqueEntityDropList = [oLife]; // 20%
		if (percent > 0 && percent <= 5) _uniqueEntityDropList = [oLife, oLoader]; // 5%
		if (percent > 5 && percent <= 25) _uniqueEntityDropList = [oLoader]; // 20%
		if (percent > 25 && percent <= 28) _uniqueEntityDropList = [oBackPack]; // 3%
		if (percent > 28 && percent <= 38) _uniqueEntityDropList = [oAddLifeItem]; // 10%
		if (percent > 38 && percent <= 100) _uniqueEntityDropList = -1; // 62%
		
		/*_uniqueEntityDropList = choose
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
		)*/
	}
	if (pBox)
	{
		randomize();
		
		var percent = random_range(0, 100);
		
		if (percent <= 20) _uniqueEntityDropList = [oLife]; // 20%
		if (percent > 0 && percent <= 5) _uniqueEntityDropList = [oLife, oLoader]; // 5%
		if (percent > 5 && percent <= 25) _uniqueEntityDropList = [oLoader]; // 20%
		if (percent > 25 && percent <= 28) _uniqueEntityDropList = [oBackPack]; // 3%
		if (percent > 28 && percent <= 38) _uniqueEntityDropList = [oAddLifeItem]; // 10%
		if (percent > 38 && percent <= 100) _uniqueEntityDropList = -1; // 62%
		
		/*_uniqueEntityDropList = choose
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
		)*/
	}

	return _uniqueEntityDropList;
}