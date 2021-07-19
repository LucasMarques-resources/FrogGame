/// @description Insert description here
// You can write your code in this editor
var colWater = place_meeting(x, y, oWater);

switch (particleType)
{
	case TYPES_PARTICLE.normal:
	
	break;
	
	case TYPES_PARTICLE.fire:
		
		part_emitter_region(partSystem, partEmitter, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
		
		part_emitter_burst(partSystem, partEmitter, partType, 1);
		
		if (colWater) instance_destroy();
	
	break;
}

if (colWater)
{
	grav = .1;
	bouncingValue = .4;

	velh = lerp(velh, 0, 0.1);
	velv = lerp(velv, 0, 0.1);
}
else
{
	grav = gravD;
	bouncingValue = bouncingValueD;
	angleRotate = angleRotateD;
}

if (scaleDown)
{
	inv = false;
	image_xscale -= 0.008;
	image_yscale = image_xscale;
	
	if (image_xscale <= 0.5) instance_destroy();
}
else
{
	invulnerableTimer--;
	
	if (invulnerableTimer <= 0)
	{
		invulnerable = max(invulnerable - 1, 0);
		if (invulnerable <= 0) instance_destroy();
	}
}

velv += grav;
if (rotate)
	image_angle += angleRotate;

// Vertical
if (place_meeting(x, y + velv, pCollider))
{
	repeat (abs(velv) + 1) {
	    if (place_meeting(x, y + sign(velv), pCollider))
	        break;
	    y += sign(velv);
	}
	velv *= -bouncingValue;
	velh = lerp(velh, 0, 0.7);
	if (inv)
	{
		invulnerableTimer = 0;
		inv = false;
	}
	rotate = false;
}

// Horizontal Collision WALL
HorizontalCollision(pCollider, true, bouncingValue);

if (collideBoxes)
{
	// Vertical Collision BOX
	if (place_meeting(x, y + velv, pBox))
	{
		repeat (abs(velv) + 1) {
		    if (place_meeting(x, y + sign(velv), pBox))
		        break;
		    y += sign(velv);
		}
		velv *= -bouncingValue;
		velh = lerp(velh, 0, 0.7);
		if (inv)
		{
			invulnerableTimer = 0;
			inv = false;
		}
		rotate = false;
	}

	// Horizontal Collision BOX
	HorizontalCollision(pBox, true, bouncingValue);
}

y += velv;
x += velh;