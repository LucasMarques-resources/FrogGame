/// @description Insert description here
// You can write your code in this editor
textString = "TEST";
alpha = 1;
decreaseAlpha = true;
decreaseAlphaTimer = room_speed / 1.5;
yMove = true;
textTop = true;
color1 = c_white;
colorShadow = c_gray;

textShadow = true;

xx = x;
yy = y;
xFollow = false;

fontText = fntText;
depth = 100;

objCreator = noone;
gunItemPressEobj = false;
itemPressEobj = false;

normalText = false;

spd = 0.25;
letters = 0;
length = string_length(textString);
textCurrent = "";
w = 0;
h = 0;
border = 5;

createGunItem = false;

uniformHandle = shader_get_uniform(shOutLine, "texturePixel");