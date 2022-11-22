// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateBonk(){
	hSpeed = lengthdir_x(speedBonk, direction - 180);
	vSpeed = lengthdir_y(speedBonk, direction - 180);
	
	moveDistanceRemaining = max (0, moveDistanceRemaining - speedBonk);
	var _collided = PlayerCollision();
	
	sprite_index = spr_player_hurt;
	image_index = CARDINAL_DIR - 2;
	
	z = sin(((moveDistanceRemaining / distanceBonk) * pi)) * distanceBonkHeight;
	
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerStateFree;
	}
}