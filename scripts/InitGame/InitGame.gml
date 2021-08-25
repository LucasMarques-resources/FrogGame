// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InitGame(){
	global.gameWidth =		240;
	global.gameHeight =		144;
	global.zoom =			5;
	global.resolution =		1;
	
	global.guiWidth = display_get_gui_width();
	global.guiHeight = display_get_gui_height();
}