/// @description Insert description here
// You can write your code in this editor
// Variables
velh = 0;
velv = 0;
grav = 0.3;
hitFrom = 0;
flash = 0;
colShootable = false;
beingDragged = false;
colWater = false;

textCrea = true;

timerCatch = room_speed;

uniformHandle = shader_get_uniform(shOutLine, "texturePixel");

// Default values
gravD = grav;