//Tutorial used Peyton Burnham on YT

//Custom Functions for Player
function setOnGround(_val = true)
{
	if _val == true
	{
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
	}
	else
	{
		onGround = false;
		coyoteHangTimer = 0;
	}
}

//controls setup
controlsSetup();

//Sprite
maskSpr = sPlayerIdleBig;
idleSpr = sPlayerIdleBig;
walkSpr = sPlayerWalkBig;
runSpr = sPlayerRunBig;
jumpSpr = sPlayerJumpBig;
crouchSpr = sPlayerCrouchBig;
//Moving
face = 1;
moveDir = 0;
runType = 0;

moveSpd[0] = 3;
moveSpd[1] = 6;
xspd = 0;
yspd = 0;

//Jumping

grav = .275;

termVel = 4;

jspd[0] = -6.15;
jspd[1] = -4.15;

jumpMax = 2;

jumpCount = 0;

jumpHoldTimer = 0;

jumpHoldFrames[0] = 18;
jumpHoldFrames[1] = 10;

onGround = false;

//Coyote Time
//Hangtime
coyoteHangFrames = 3;
coyoteHangTimer = 0;

//Jumptime
coyoteJumpFrames = 5;
coyoteJumpTimer = 0;
