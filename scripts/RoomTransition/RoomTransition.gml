/// @arg Type
/// @arg TargetRoom

function RoomTransition(_Type, _TargetRoom){
	if (!instance_exists(obj_Transition))
	{
		with (instance_create_depth(0, 0, -9999, obj_Transition))
		{
			type = argument[0];
			target = argument[1];
		}
	}
	else show_debug_message("Trying to transition while transition is happening!");
}