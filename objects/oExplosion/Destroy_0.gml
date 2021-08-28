/// @description desc
if (global.plDied)
{
	instance_create_layer(0, 0, "Instances", oTransition);
	Transition(TRANS_MODE.RESTART);
}