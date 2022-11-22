// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//enemy sprites
sprMove = spr_slime;
sprAttack = spr_slime_attack;
sprDie = spr_slime_die;
sprHurt = spr_slime_hurt;


//enemy scripts
enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack;
enemyScript[ENEMYSTATE.HURT] = SlimeHurt;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;


