/// @description desc

if (!instance_exists(pEnemy) || global.debugMode)
{
	Transition(TRANS_MODE.NEXT);

	with (other) state = PlStates.stopped;
}