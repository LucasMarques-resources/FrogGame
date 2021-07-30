/// @description desc

HorizontalCollision(pCollider, 0, .1);
HorizontalCollision(pShootable, 0, .1);
HorizontalCollision(oFrog, 0, 0);

x += velh;

VerticalCollision(pCollider, 0, .1, 0);
VerticalCollision(pShootable, 0, .1, 0);
VerticalCollision(oFrog, 0, 0, 0);

y += velv;