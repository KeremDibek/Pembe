//Get Inputs
get_Controls();

//X Movement

moveDir = rightKey - leftKey;

//Get my face
if moveDir != 0 
{
	face = moveDir;
}
	
//Get x Speed
runType = runKey;
xspd = moveDir * moveSpd[runType];

//X Collision
var _sub_Pixel = .5;
if place_meeting(x + xspd, y, obj_wall)
{
	
	//First Check if there is a slopt to go up
	if !place_meeting(x + xspd, y - abs(xspd)-1, obj_wall)
	{
		while place_meeting(x + xspd, y, obj_wall)
		{
			y -= _sub_Pixel;
		}
	}
	//if there is no slope regular collision
	else
	{
		//Ceiling Slopes
		if !place_meeting(x + xspd, y, obj_wall)
		{
			while place_meeting(x + xspd, y, obj_wall)
			{
				y += _sub_Pixel;
			}
		}
		else
		{
				//Scoot up to Wall percisley(before setting x to 0 because speed is used to check collision)
				var _pixel_Check = _sub_Pixel * sign(xspd);
				while !place_meeting(x + _pixel_Check, y, obj_wall)
				{
		
				x += _pixel_Check;
				}	
				//Set X Speed to 0 to collide
				xspd = 0;
		}
		}
}


//Go Down Slopes
if yspd >= 0 && !place_meeting(x + xspd, y + 1, obj_wall) && place_meeting(x + xspd, y + abs(xspd) + 1, obj_wall)
{
	while !place_meeting(x + xspd, y + _sub_Pixel, obj_wall)
	{
		y += _sub_Pixel;
	}
}
//Move
x += xspd;


//Y Movement
//Gravity
if coyoteHangTimer > 0
{
	coyoteHangTimer--;
}
else
{
	//apply Gravity to the Player
	yspd += grav;
	//We´re no longer on the ground
	setOnGround(false);
}

//Reset Jumnpcount
if onGround
{
	jumpCount = 0;
	coyoteJumpTimer = coyoteJumpFrames;
}
else
{
	coyoteJumpTimer--;
	//if the player is in the air, makes sure they only get one jump
	if jumpCount == 0
	{
		jumpCount = 1;
	}
}
//Jump
if jumpkeyBuffered && jumpCount < jumpMax
{
	//Reset Buffer
	jumpkeyBuffered = false;
	jumpKeyBufferTimer = 0;
	
	//increase the number of performed jumps
	jumpCount++;
	
	//Set the jump Hold Timer
	jumpHoldTimer = jumpHoldFrames[jumpCount - 1];
	//No longer on the ground has to be declared
	setOnGround(false);
}

//Cut of fJump by realeasing the button
if !jumpKey
{
	jumpHoldTimer = 0;
}
//Jump based on the timer/holding the button
if jumpHoldTimer > 0
{
	//Constantly set the yspd to be jumping
	yspd = jspd[jumpCount - 1];
	//Count down the timer
	jumpHoldTimer--;
}
//Y Collision and Movement
//Cap falling Speed
if yspd > termVel
{
	yspd = termVel;
}

//Y Collision
var _sub_Pixel = .5;

//Upwards Y Collision(with Ceiling Slopes)
if yspd < 0 && place_meeting(x, y + yspd, obj_wall)
{
	//Jump into Sloped Ceilings
	var _slopeSlide = false;
	//Slide Up Left Slope
	if moveDir == 0 && !place_meeting(x - abs(yspd)-1, y + yspd, obj_wall)
	{
		while place_meeting(x, y + yspd, obj_wall)
		{
			x -= 1;
		}
		_slopeSlide =  true;
	}
	if moveDir == 0 && !place_meeting(x + abs(yspd)+1, y + yspd, obj_wall)
	{
		while place_meeting(x, y + yspd, obj_wall)
		{
			x += 1;
		}
		_slopeSlide =  true;
	}
	
	if !_slopeSlide
	{
		if place_meeting(x, y + yspd, obj_wall) 
		{
			//precise
			var _pixel_Check = _sub_Pixel * sign(yspd);
			while !place_meeting(x, y + _pixel_Check, obj_wall)
			{
				y += _pixel_Check;
			}
			//set ySpeed to 0 to collide
			yspd = 0;
		}
	}

}

//Normal Y Collision
if place_meeting(x, y + yspd, obj_wall) 
		{
			//precise
			var _pixel_Check = _sub_Pixel * sign(yspd);
			while !place_meeting(x, y + _pixel_Check, obj_wall)
			{
				y += _pixel_Check;
			}
			//set ySpeed to 0 to collide
			yspd = 0;
		}

//Downwards Y Collision
if yspd >= 0
{
if place_meeting(x, y + yspd, obj_wall) 
{
	//precise
	var _pixel_Check = _sub_Pixel * sign(yspd);
	while !place_meeting(x, y + _pixel_Check, obj_wall)
	{
		y += _pixel_Check;
	}
	//set ySpeed to 0 to collide
	yspd = 0;
}

//set if im on the ground
if place_meeting(x, y+1, obj_wall)
{
	setOnGround(true);
}
}

y += yspd;


//Sprite Control
//Walking
if abs(xspd) > 0 
{
	sprite_index = walkSpr;
}

if abs(xspd) >= moveSpd[1]
{
	sprite_index = runSpr;
}
//not Moving

if xspd == 0 
{
	sprite_index = idleSpr;
}

//In the air

if !onGround 
{
	sprite_index = jumpSpr;
}

//set the collision mask

mask_index = maskSpr;