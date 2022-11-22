/// @description room transition

if (instance_exists(obj_player)) && (position_meeting(obj_player.x, obj_player.y, id))
{
	if (!instance_exists(obj_Transition)) && (obj_player.state != playerStateDead)
	{
		global.targetRoom = targetRoom;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = obj_player.direction;
		with (obj_player) state = PlayerStateTransition;
		RoomTransition(TRANS_TYPE.SLIDE, targetRoom);
		instance_destroy();
	}
}
