/// @description desc

#region COLLISIONS

// Horizontal Collision pCOLLIDER
HorizontalCollision(pCollider, 0, 0);

// Horizontal Collision BOX
HorizontalCollision(pBox, 0, 0);

x += velh;

// Vertical Collision pCOLLIDER
VerticalCollision(pCollider, 0, 0, 0);

// Vertical Collision BOX
VerticalCollision(pBox, 0, 0, 0);

y += velv;

#endregion