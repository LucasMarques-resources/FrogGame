/// @description Insert description here
// You can write your code in this editor

// Destroying
if (hp <= 0 && destructible)
{
	with (instance_create_layer(x, y, "Particles", oExplosion))
	{
		scale = other.scaleExplosion;
	}
	
	if (itemDropper)
	{
		entityDropList = uniqueEntityDropList;
	}
	
	ScreenShake(5, 6);
	instance_destroy();
}

#region COLLISIONS

// Horizontal Collision pCOLLIDER
HorizontalCollision(pCollider, colBounce, .3);

// Horizontal Collision BOX
if (colBox) HorizontalCollision(pBox, colBounce, .3);

// Horizontal Collision FROG
if (!enemy && colFrog) HorizontalCollision(oFrog, false, 0);

x += velh;

// Vertical Collision pCOLLIDER
VerticalCollision(pCollider, colBounceV, .3, false);

// Vertical Collision BOX
if (colBox) VerticalCollision(pBox, false, .0, false);

// Vertical Collision FROG
if (!enemy && colFrog) VerticalCollision(oFrog, false, .0, false);

y += velv;

#endregion