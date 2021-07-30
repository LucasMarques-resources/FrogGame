/// @description desc

var temp = place_meeting(x, y + 1, pCollider) || place_meeting(x, y + 1, pShootable);

if (((temp && temp != oRock) && !ground) && can)
{
	instance_create_layer(x, y, "Particles", oRockDamager);
	can = false;
}