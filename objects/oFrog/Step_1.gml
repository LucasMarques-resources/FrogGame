/// @description Insert description here
// You can write your code in this editor

var temp = place_meeting(x, y + 1, pCollider);
var _colSpike = place_meeting(x, y + 1, oSpikes);

if (temp && !ground)
{
	instance_create_layer(x, y, "Particles", oFallParticle);
}


if (_colSpike && !colSpike)
{
	global.plHp -= global.plHp;

	ScreenShake(5, 5);

	PlayerKnockBack();
}