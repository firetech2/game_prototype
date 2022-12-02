/// @desc initialize & globals
randomize();
global.gamePaused = false;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.playerHealthMax = 9.0;
global.playerHealth = 9.0;
global.EXP = 0;


global.iCamera = instance_create_layer(0, 0, layer, obj_camera);

room_goto(ROOM_START);


