/// @description desc

if (!instance_exists(pEnemy))
{
	Transition(TRANS_MODE.NEXT);

	with (other) state = PlStates.stopped;
}