//=============================================
//
//		demo301[�S�C�ʂƂ̑���]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
// ���ϐ���`
	local task_cam, task_player, task_momonja, task_henchman, task_west;
	local efc_cam, efc_player, efc_momonja;
	local effect_pos = Vec3(0.0, 3.0, 0.0);
	local rot_player00 = Vec3(-171.4474, 31.47983, 177.4337);		// 80��
	local rot_player01 = Vec3(-214.63692, 31.47983, 160.56419);		// 160��
	local rot_player02 = Vec3(-214.19415, 31.01984, 192.15332);		// -30��
	local rot_henchman = Vec3(-213.11865, 31.22486, 132.75562);		// 180��

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_ookzchi = ReadNpc_("m035_00");		// �������Â�
	local model_momonja = ReadNpc_("m041_02");		// ���C�W�����񂶂�
	local model_darkmmn = ReadNpc_("m083_04");		// �_�[�N���[����
	// �G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");		// �W����
	LoadEffect_("ef712_13_emo_sweat01");			// ��
	LoadEffect_("ef712_07_emo_anger01");			// �{��
	//�M�~�b�N
	local ice_wall = ReadGimmick_("o_I01_00");		// �X�̕�

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_eyes_close");
	// �g�[�h�[�q��
	local henchman = ArrangePointNpc_(model_ookzchi, "npc_henchman000");
	SetScaleSilhouette(henchman, SCALE.N, SILHOUETTE_WIDTH.S);
	SetAlpha_(henchman, ALPHA_CLEAR);
	SetStepSePan_(henchman, false);
	// �����񂶂�
	local momonja = ArrangePointNpc_(model_momonja, "npc_momonja000");
	SetScaleSilhouette(momonja, SCALE.N, SILHOUETTE_WIDTH.S);
	SetAlpha_(momonja, ALPHA_CLEAR);
	SetStepSePan_(momonja, false);
	// ���|�[���p�[�N�Z�l
	local west = ArrangePointNpc_(model_darkmmn, "npc_west000");
	SetScaleSilhouette(west, SCALE.N, SILHOUETTE_WIDTH.S);
	SetMotionSpeed_(west, 0.5);
	
	//�M�~�b�N
	local res_ice = ArrangePointGimmick_("o_I01_00", ice_wall, "obj_ice_wall000");	//�X�̕�

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");				// �������L
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");			// ��������L
	local player_surprise = ReadMotion_(player, "Player_surprise");					// ����
	// �����񂶂�
	local momonja_fall_stand_up = ReadMotion_(momonja, "m041_02_fall_stand_up");	// �]���遨����グ��

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 180F


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	// ���J�b�g�P���X�̖؂ƕX�̕ǁ`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	WaitTask(task_cam);

	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();


	// ���J�b�g�Q����l���J�����C���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	Wait_(10);
	task_player = Task_MoveForward_(player, 1.0, false);
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	//-----

	Wait_(100);
	DeleteTask_(task_player);
	task_player = Task_WalkAroundToPos(player, rot_player00, 5.0);
	Wait_(15);
	PlaySE_("SE_FLD_016");	// ����
	WaitTask(task_player);
	SetMotion_(player, player_look_up_L, BLEND_XL);		// �������L
	Wait_(15);
	PlaySE_("SE_FLD_016");	// ����
	Wait_(30);
	SetPointPos_(player, "player001");


	// ���J�b�g�R����l���ɃY�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	//===============================================
	// *�S�C�ʃ����X�^�[
	// �u�ǂ��ǂ��ǂ��`���I�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_301_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 30F
	PlaySE_("SE_DEM_026");												// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// �W����

	// �����񂶂ᑫ���ݒ�
	uPlayStepSE(3);
	uPlayStepSE(4);
	uPlayStepSE(4);
	uPlayStepSE(4);

	task_player = Task_RotateToPos_(player, rot_player01, 22.9);
	SetMotion_(player, player_surprise, BLEND_M);						// ����
	Wait_(12);

	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 8);
	WaitFade_();

	PlaySE_("SE_DEM_004");	// �u�h�V���b�I�v

	DeleteEffect_(efc_cam);
	DeleteTask_(task_player);
	DeleteTask_(task_cam);


	// ���J�b�g�S�������񂶂�]����`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(30);
	SetAlpha_(momonja, ALPHA_EXIST);
	SetMotion_(momonja, momonja_fall_stand_up, BLEND_N);					// �]���遨����グ��
	task_momonja = Task_ChangeMotion_(momonja, MOT_WAIT, BLEND_M);

	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	//-----

	uPlayStepSE(100);
	Wait_(15);

	//===============================================
	// *�S�C�ʃ����X�^�[
	// �u���������I�@���Ă����I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_301_MSG_020");
	KeyInputWait_();
	efc_momonja = SetSelectBoneEffectSetOffset_("ef712_07_emo_anger01", momonja, ATTACH_EFFECT1, effect_pos);	// �{��
	SetEffectScale_(efc_momonja, 3.0);
	//-----------------------------------------------
	// ��
	// �u���������傤�c�c�C��t������I�I
	//-----------------------------------------------
	ShowMsg_("DEMO_301_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_momonja);
	DeleteEffect_(efc_momonja);
	task_momonja = Task_AnimeMoveSetMotion_(momonja, "anm_momonja000", MOT_RUN, MOT_WAIT);
	efc_momonja = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", momonja, ATTACH_EFFECT1, effect_pos);	// ��
	SetEffectScale_(efc_momonja, 3.0);

	SetPointPos_(player, "player002");
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetFace_(player, "Face_eyes_close");


	// ���J�b�g�T�������񂶂ᓦ���Ă����`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	Wait_(2);
	PlaySE_("SE_FLD_031");	// ����
	Wait_(13);
	SetMotion_(player, player_look_left_L, BLEND_XL);		// ��������L

	WaitTask(task_momonja);

	// �g�[�h�[�q���o��
	SetAlpha_(henchman, ALPHA_EXIST);
	SetMotion_(henchman, MOT_RUN, BLEND_M);
	task_henchman = Task_MoveToPointSetSpeed_(henchman, "npc_henchman001", 1.0);
	Wait_(15);
	SetMotion_(player, MOT_WALK, BLEND_XL)
	Wait_(10);
	task_player = Task_RotateToPosSetMotion_(player, GetPos_(henchman), ROTATE_DEMO_DEF/3 ,MOT_WALK, MOT_WAIT);
	Wait_(15);
	WaitTask(task_henchman);
	SetMotion_(henchman, MOT_TALKLOOP, BLEND_L);

	//===============================================
	// *�g�[�h�[�̎q��
	// �u�������I�@�������܂����I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_301_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	// �g�[�h�[�q���ޏ�
	task_henchman = Task_WalkAroundToPos(henchman, rot_henchman, ROTATE_DEMO_DEF);
	WaitTask(task_henchman);
	task_henchman = Task_MoveToPointSetSpeed_(henchman, "npc_henchman000", 0.5);
	WaitTask(task_henchman);
	SetAlpha_(henchman, ALPHA_CLEAR);
	SetMotion_(henchman, MOT_WAIT, BLEND_N);
	Wait_(15);

	// ���|�[���p�[�N�Z�l�o��
	task_west = Task_RotateToDir_(west, 40, 1);
	WaitTask(task_west);
	DeleteTask_(task_west);
	task_west = Task_MoveToPointSetSpeed_(west, "npc_henchman001", 0.5);
	Wait_(45);

	// ���J�b�g�U�����p�[�N�Z�l�J�����C���`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 60F

	WaitTask(task_west);
	DeleteTask_(task_west);
	task_west = Task_RotateToPos_(west, GetPos_(player), ROTATE_DEMO_DEF/3);
	WaitTask(task_west);
	DeleteTask_(task_west);

	//===============================================
	// *���|�[���p�[�N�Z�l�c
	// �u���񂽁@���v���������H
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_301_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();


	// ���J�b�g�V�����p�[�N�Z�l�A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	Wait_(5);

	//-----------------------------------------------
	// �u���@���̐��|�[���p�[�N�́@�R�����ł�B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_301_MSG_060");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u���킵���b���@��������������
	//-----------------------------------------------
	ShowMsg_("DEMO_301_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();


	// ���J�b�g�W���e���̉��~���f���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 60F

	task_west = Task_RotateToDir_(west, 180, ROTATE_DEMO_DEF/2);
	Wait_(5);

	//-----------------------------------------------
	// �u�z���@�e���̉��~�́@����������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_301_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����񂶂ᑫ���ݒ�
//------------------------------------------------
//	����	: wait	�҂�����
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayStepSE(wait)
{
	Wait_(wait);
	PlaySE_("SE_FLD_031");	// ����
}
