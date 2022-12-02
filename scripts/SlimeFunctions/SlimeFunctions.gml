function SlimeChase(){
	sprite_index = sprMove;
	
	if (instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed)
		{
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		}
		else
		{
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		}
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		//collide & move
		EnemyTileCollision();
	}
	
	//check if close enough to attack
	if (instance_exists(target)) && (point_distance(x, y, target.x, target.y) <= enemyAttackRadius)
	{
		state = ENEMYSTATE.ATTACK;
		sprite_index = spr_slime_attack;
		image_index = 0;
		image_speed = 1.0;
		
		//target 8px past player
		xTo += lengthdir_x(8, dir);
		yTo += lengthdir_y(dir, 8);
	}
}

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeAttack(){
	xTo = target.x;
	yTo = target.y;
	
	//how fast to move
	var _spd = 3.0;
	
	//dont move while preparing to jump
	if (image_index < 2) _spd = 0;
	
	//freeze animation
	if (floor(image_index) == 3) || (floor(image_index) == 5) image_speed = 0;
	
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	//begin landing
	if (_distanceToGo < 4) && (image_index < 5) image_speed = 1.0;
	
	//move 
	if (_distanceToGo > _spd)
	{
	
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_spd, dir);
		vSpeed = lengthdir_y(_spd, dir); 
		if (hSpeed !=0) image_xscale = sign(hSpeed);
		
		//commit to move and stop if hit wall
		if (EnemyTileCollision() == true)
		{
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		if (floor(image_index) == 5)
		{
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeHurt(){
	
	spr_index = spr_slime_hurt;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed)
	{
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(enemySpeed, dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		if (hSpeed != 0) image_xscale = -sign(hSpeed);
		
		
		if (EnemyTileCollision())
		{
			xTo = x;
			yTo = y;
		}
		else 
		{
			x = xTo;
			y = yTo;
			if (statePrevious != ENEMYSTATE.ATTACK) state = statePrevious; else state = ENEMYSTATE.CHASE;
		}
	}
	
}

function SlimeWander(){
	sprite_index = sprMove;
	
	//at destination or given up
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed)
	{
		hSpeed = 0;
		vSpeed = 0;
		//end move animation
		if (image_index < 1)
		{
			image_speed = 0.0;
			image_index = 0;
		}
		
		//set new target destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	}
	else //move toward new destination
	{
		timePassed++;
		image_speed = 1.0;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_speedThisFrame, dir);
		vSpeed = lengthdir_y(_speedThisFrame, dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//collide & move
		EnemyTileCollision();
		
	}
	
	//check for aggro
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(obj_player)) && (point_distance(x, y, obj_player.x, obj_player.y) <= enemyAggroRadius)
		{
			state = ENEMYSTATE.CHASE;
			target = obj_player;
			
		}
	}
}

function SlimeDie()
{
	global.EXP++;
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed)
	{
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(enemySpeed, dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		if (hSpeed != 0) image_xscale = -sign(hSpeed);
		
		// collide and move
		EnemyTileCollision();
		
	}
	else
	{
		x = xTo;
		y = yTo;
	}
	
	if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number)
	{
		instance_destroy();
	}
}
