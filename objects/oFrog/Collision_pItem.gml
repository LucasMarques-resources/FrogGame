/// @description Insert description here
// You can write your code in this editor

// Switch by item types
switch (other.object_index)
{
	case oLife:
	
		global.plHp++;
		
	break;
	case oLoader:
	
		global.ammo += other.ammo;
		global.ammoAdded = true;
		
	break;
}

instance_destroy(other);