InitGame();
instance_create_depth(0, 0, -99, oCamera);
if (!instance_exists(oControl)) instance_create_layer(0, 0, "Instances", oControl);