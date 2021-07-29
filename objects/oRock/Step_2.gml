/// @description desc

HorizontalCollision(pCollider, true, .1);
HorizontalCollision(pShootable, true, .1);
HorizontalCollision(oFrog, 0, 0);

x += velh;

VerticalCollision(pCollider, true, .1, 0);
VerticalCollision(pShootable, true, .1, 0);
VerticalCollision(oFrog, 0, 0, 0);

y += velv;