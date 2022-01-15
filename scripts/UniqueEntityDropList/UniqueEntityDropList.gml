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
		
		if (percent <= 40) _uniqueEntityDropList = [oLoader]; //40%
		if (percent > 40 && percent <= 70) _uniqueEntityDropList = [oLife]; //30%
		if (percent > 70 && percent <= 80) _uniqueEntityDropList = [oAddLifeItem]; //10%
		if (percent > 80 && percent <= 85) _uniqueEntityDropList = [oBackPack]; //5%
		
	}
	
	return _uniqueEntityDropList;
}