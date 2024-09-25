function controlsSetup()
{
	bufferTime = 5;
	
	jumpkeyBuffered = 0;
	jumpKeyBufferTimer = 0;
}

function get_Controls()
{
	//DirectionInput
	rightKey = keyboard_check(ord("D")) + gamepad_button_check(0, gp_padr);
		rightKey = clamp (rightKey, 0, 1);
	
	leftKey = keyboard_check(ord("A")) + gamepad_button_check(0, gp_padl);
		leftKey = clamp(leftKey, 0, 1);
	
	//ActionInputs
	jumpKeyPressed = keyboard_check_pressed(vk_space) + gamepad_button_check_pressed(0, gp_face1);
		jumpKeyPressed = clamp(jumpKeyPressed, 0, 1);
		
	jumpKey = keyboard_check(vk_space) + gamepad_button_check(0, gp_face1);
		jumpKey = clamp(jumpKey, 0, 1);

	runKey = keyboard_check(ord("W")) + gamepad_button_check(0, gp_face3);
		runkey = clamp(runKey, 0, 1);
	//Jump Key Buffering
	if jumpKeyPressed
	{
		jumpKeyBufferTimer = bufferTime;
	}	
	
	if jumpKeyBufferTimer > 0 
	{
		jumpkeyBuffered = 1;
		jumpKeyBufferTimer--;
	}
	else
	{
		jumpkeyBuffered = 0;
	}
}