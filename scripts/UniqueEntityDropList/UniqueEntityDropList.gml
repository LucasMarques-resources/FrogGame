// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UniqueEntityDropList()
{
	randomize();
	
	var _uniqueEntityDropList = 0;
	
	if (pShootable)
	{
		var percent = irandom_range(0, 100);
		show_debug_message(percent);
		
		if (percent <= 20) _uniqueEntityDropList = [oLoader]; //30%
		if (percent > 20 && percent <= 30) _uniqueEntityDropList = [oLife]; //20%
		if (percent > 30 && percent <= 40) _uniqueEntityDropList = [oAddLifeItem]; //10%
		if (percent > 40 && percent <= 43) _uniqueEntityDropList = [oBackPack]; //3%
		
	}
	
	return _uniqueEntityDropList;
}