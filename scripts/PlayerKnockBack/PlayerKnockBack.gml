// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerKnockBack()
{
	with (oFrog)
	{
		invulnerable = 70;
		
		if (other == pEnemy)
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
		
		}
		// Knock back player state
		if (!colWater)
		{
			state = PlStates.knockBack;
			
			var _knockBackDir = point_direction(x, y, other.x, other.y);
			
			if (_knockBackDir > 90 && _knockBackDir < 270) knockBackDir = 45;
			else knockBackDir = 135;
		}
		else
		{
			state = PlStates.knockBackWater;
			knockBackDir = point_direction(x, y, other.x, other.y) - 180;
		}
	}
}