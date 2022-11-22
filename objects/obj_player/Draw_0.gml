draw_sprite(spr_shadow, 0, x, y);


if (invulnerable != 0) && ((invulnerable mod 8 < 2) == 0)
{
	
}
else 
{	
	draw_sprite_ext(
		sprite_index,
		image_index, 
		floor(x), 
		floor(y - z), 
		image_xscale, 
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	)
	
	if (shader_current() != -1) shader_reset();
	

}


