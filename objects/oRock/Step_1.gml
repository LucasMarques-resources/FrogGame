/// @description desc

var temp = place_meeting(x, y + 1, pCollider) || place_meeting(x, y + 1, pShootable);

if (((temp && temp != oRock) && !ground) && can)
{
	with (instance_create_layer(x, y, "Particles", oRockDamager)) oRockCreator = other.id;
	can = false;
}