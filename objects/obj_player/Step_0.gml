//get player input
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
keyAttack = keyboard_check(vk_space);
keyRoll = keyboard_check_pressed(vk_shift);

inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0) ||(keyDown - keyUp != 0);

if (!global.gamePaused)
{
	script_execute(state);
	invulnerable = max(invulnerable - 1, 0);
	
}


depth = -bbox_bottom;

if(global.EXP = 1){
	global.EXP = 0;
	rndNUM = irandom_range(1,3);
	switch(rndNUM){
		case 1:
		global.playerHealth++
		break;
		case 2:
		speedWalk = speedWalk + 0.02;
		break;
		case 3:
		global.damage++;
		break;
	}

}

