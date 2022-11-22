state = PlayerStateFree;
hitByAttack = -1;

collisionmap = layer_tilemap_get_id(layer_get_id("Collision"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedRoll = 4.0;
distanceRoll = 52;
distanceBonk = 40;
distanceBonkHeight = 12;
speedBonk = 1.5;
z = 0;

invulnerable = 0;

spriteRoll = spr_player_roll;
spriteRun = spr_player_run;
spriteIdle = spr_player;
localFrame = 0;


