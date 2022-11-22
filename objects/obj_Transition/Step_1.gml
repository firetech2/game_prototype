with (obj_player) state = PlayerStateTransition;

if (leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1)
	{
		room_goto(target);
		leading = IN;
	}
}
else 
{
	percent = max (0, percent - TRANSITION_SPEED);
	if (percent <= 0)
	{
		with (obj_player) state = PlayerStateFree;
		instance_destroy();
	}
	
}
