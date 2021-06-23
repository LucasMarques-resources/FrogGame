/// @description Insert description here
// You can write your code in this editor

var temp = place_meeting(x, y + 1, oWall);

if (temp && !ground)
{
	instance_create_layer(x, y, "Particles", oFallParticle);
}

#region Collisions

// Horizontal Collision
if (place_meeting(x + velh, y, oWall)) {
   repeat (abs(velh) + 1) {
      if (place_meeting(x + sign(velh), y, oWall))
         break;
      x += sign(velh);
   }
   velh = 0;
}

//Horizontal Collision
if (place_meeting(x + velh, y, pBox))
{
	dragging = true;
	repeat (abs(velh) + 1) {
      if (place_meeting(x + sign(velh), y, pBox))
         break;
      x += sign(velh);
	}
	with (instance_place(x + velh, y, pBox)) velh = sign(other.velh);
	velh = 0;
}
else dragging = false;

x += velh;

// Vertical Collision
if (place_meeting(x, y + velv, oWall)) {
   repeat (abs(velv) + 1) {
      if (place_meeting(x, y + sign(velv), oWall))
         break;
      y += sign(velv);
   }
   velv = 0;
}

// Vertical Collision
if (place_meeting(x, y + velv, pBox))
{
   repeat (abs(velv) + 1) {
      if (place_meeting(x, y + sign(velv), pBox))
         break;
      y += sign(velv);
   }
	velv = 0;
}

y += velv;

#endregion
