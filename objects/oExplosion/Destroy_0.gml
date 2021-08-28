/// @description desc
if (global.plDied)
{
	//show_message("DESTROY EXPLOSION OTRANSITOIN CREATION");
	instance_create_layer(0, 0, "Instances", oTransition);
	Transition(TRANS_MODE.RESTART);
}