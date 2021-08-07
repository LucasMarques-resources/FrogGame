// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateBullet(_recoil, _screenShakeMag, _screenShakeFrames, plKnockBackX, plKnockBackY, angRandMin, angRandMax)
{
	var dir = point_direction(x, y, mouse_x, mouse_y);
	
	recoil = _recoil;
	ScreenShake(_screenShakeMag, _screenShakeFrames);
				
	with (instance_create_layer(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), "Bullets", oDust)) sprite_index = sMiniDust;
			
	with (instance_create_layer(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir) - 3, "Bullets", oBullet))
	{
		typeBullet = other.typeGun;
		DecreaseAmmoOnGrid();
		direction = other.image_angle + random_range(angRandMin, angRandMax);
		image_index = typeBullet;
		image_angle = direction;
	}
				
	firingDelay = global.gunsGridStatus[typeGun, 0];
	
	// Player gun kick
	with (oFrog)
	{
		gunKickX = lengthdir_x(plKnockBackX, other.image_angle - 180);
		gunKickY = lengthdir_y(plKnockBackY, other.image_angle - 180);
	}
}