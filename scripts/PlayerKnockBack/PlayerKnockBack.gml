// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerKnockBack()
{
	with (oFrog)
	{
		if (other.createDust)
		{
			// Hurt enemy when jumping above him
			other.hp--;
			other.tookHit = true;
				
			// Create mini explosion
			instance_create_layer(x, y - 10, "Particles", oDust);
			other.createDust = false;
		}
		// Knock back player state
		if (!colWater)
		{
			state = PlStates.knockBack;
			
			if (other.dirKnock > 90 && other.dirKnock < 270) knockBackDir = 135;
			else knockBackDir = 45;
		}
		else
		{
			state = PlStates.knockBackWater;
			knockBackDir = point_direction(x, y, other.x, other.y) - 180;
		}
	}
}