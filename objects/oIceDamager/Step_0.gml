/// @description Insert description here
// You can write your code in this editor

if (instance_exists(followId))
{	
	with (followId)
	{
		image_xscale = other.followIdXscale;
		
		if (beingFireDamaged)
		{
			instance_destroy(fireDamagerId);
		}
		
		other.x = x;
		other.y = y;
		
		beingIceDamaged = true;
		
		/*if (enemy)
		{
			other.x = x;
			other.y = y;
		}
		else 
		{
			other.x = x + sprite_width / 2;
			other.y = y + sprite_height / 2;
		}*/
		image_speed = 0;
		state = STATES.waiting;
	}
	
} else instance_destroy();

destroyFireDamagerTimer--;

if (destroyFireDamagerTimer <= 0)
{
	with (followId)
	{
		image_speed = other.frozenImageSpeed;
	}
	instance_destroy();
}