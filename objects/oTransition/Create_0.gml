/// @description desc

heightHalf = global.guiHeight * 0.5;

enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = TRANS_MODE.INTRO;

transMode = TRANS_MODE.INTRO;
percent = 1;
target = room;