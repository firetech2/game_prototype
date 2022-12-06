//attack just started
function PlayerStateAttack()
{
	
	if(sprite_index != spr_player_attack)
	{
		//steup animation
		sprite_index = spr_player_attack;
		localFrame = 0;
		image_index = 0;
		
		//clear hit list
		if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
		
		
	}
	
	CalcAttack();
	
	//update sprite
	playerAnimateSprite();
	
	if(animationEnd)
	{
		state = PlayerStateFree;
		animationEnd = false;
	}
}

function CalcAttack()
{
	//use attack hitbox and check for hits
	mask_index = spr_player_attack;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, obj_pEntity, hitByAttackNow, false);
	if(hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			//if this instance has not yet been hit by this attack, hit it
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				with (hitID)
				{
					image_blend = c_red;
					
					if (object_is_ancestor(object_index, obj_pEnemy))
					{
						HurtEnemy(id, global.damage, other.id, 10);
					}
					else if (entityHitScript != -1) script_execute(entityHitScript);
		
				}
			}
		}
	}
	
	ds_list_destroy(hitByAttackNow);
	mask_index = spr_player;
}

function HurtEnemy(_enemy, _damage, _source, _knockback)
{
	with (_enemy)
	{
		if (state != ENEMYSTATE.DIE)
		{
			enemyHP -= _damage;
			
			if (enemyHP <= 0)
			{
				state = ENEMYSTATE.DIE;
			}
			
			if (state != ENEMYSTATE.HURT) statePrevious = state;
			state = ENEMYSTATE.HURT;
		}
		
		image_index = 0;
		
		if (_knockback != 0)
		{
			var _knockDirection = point_direction(x, y, (_source).x, (_source).y);
			xTo = x - lengthdir_x(_knockback, _knockDirection);
			yTo = y - lengthdir_y(_knockback, _knockDirection);
		}
	}
}
