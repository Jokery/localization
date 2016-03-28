//=============================================
//
//		demo009[�m�`�������Ƃ̏o�_1(���ԑO)]
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
	local task_cam, task_player, task_mons, task_nocho, task_window;
	local efc_cam, efc_player, efc_bush, efc_nocho00, efc_mons;
	local flg_mons = GetNumFlg_("NUM_CHANGE_FIRST_MONSTER");		// Num12
	local anmeye007, anmeye008;
	local anmtgt007, anmtgt008;
	local anm_priz002;
	local motion_jump, motion_take;
	local mons_rot = Vec3(864.8573, 197.21187, -589.32306);
	local mons_scale = 0;			// �X�P�[���l
	local mons_outline = 0;			// �A�E�g���C��
	local mons_param = 0;			// �p�����[�^�h�c
	local mons_kind = 0;			// �푰�h�c
	local mons_res = 0;				// ���\�[�X��
	local mons_ride_size = 0;		// ���C�h���̃T�C�Y
	local heart_scale = 5.0;		// �f�t�H���g�l���Ə���������
	local frame_sum = 0;
	
	// �������ԃ����X�^�[�ݒ�
	switch(flg_mons)
	{
	// �u�v���Y�j�����v
	case PURIZUNYAN:		// Num12 = 0
		mons_scale = SCALE.PURIZUNYAN;
		mons_outline = SILHOUETTE_WIDTH.PURIZUNYAN;
		mons_param = 1203;
		mons_kind = 128;
		mons_res = "m040_00";
		mons_ride_size = SIZE_S;
		anm_priz002 = "anm_priz002_0";
		anmeye007 = "anmeye007_0";
		anmtgt007 = "anmtgt007_0";
		anmeye008 = "anmeye008_0";
		anmtgt008 = "anmtgt008_0";
		break;
	// �u�t�H���f���v
	case FONDHU:			// Num12 = 1
		mons_scale = SCALE.FONDHU;
		mons_outline = SILHOUETTE_WIDTH.FONDHU;
		mons_param = 1202;
		mons_kind = 392;
		mons_res = "m125_00";
		mons_ride_size = SIZE_M;
		anm_priz002 = "anm_priz002_1";
		anmeye007 = "anmeye007_1";
		anmtgt007 = "anmtgt007_1";
		anmeye008 = "anmeye008_1";
		anmtgt008 = "anmtgt008_1";
		break;
	// �u�h���L�[�v
	case DORAKI:			// Num12 = 2
		mons_scale = SCALE.DORAKI;
		mons_outline = SILHOUETTE_WIDTH.DORAKI;
		mons_param = 1201;
		mons_kind = 160;
		mons_res = "m052_00";
		mons_ride_size = SIZE_M;
		anm_priz002 = "anm_priz002_2";
		anmeye007 = "anmeye007_2";
		anmtgt007 = "anmtgt007_2";
		anmeye008 = "anmeye008_2";
		anmtgt008 = "anmtgt008_2";
		break;
	// �u�i�X�r�i�[���v
	case NASUBINARA:		// Num12 = 3
		mons_scale = SCALE.NASUBINARA;
		mons_outline = SILHOUETTE_WIDTH.NASUBINARA;
		mons_param = 1204;
		mons_kind = 214;
		mons_res = "m069_00";
		mons_ride_size = SIZE_S;
		anm_priz002 = "anm_priz002_3";
		anmeye007 = "anmeye007_3";
		anmtgt007 = "anmtgt007_3";
		anmeye008 = "anmeye008_3";
		anmtgt008 = "anmtgt008_3";
		break;
	default :
		DebugPrint("[Update] WARNING : �t���OID (" + flg_mons + ") ���s���ł�");
	}
	
// �����f���Ǎ�
	// �M�~�b�N
	local model_bush = ReadGimmick_("o_dem_02");	// �΂�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_n_man = ReadNpc_("n043");			// �m�`������
	local model_mons = ReadNpc_(mons_res);			// ���������X�^�[
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef712_18_emo_heart01");			// �n�[�g01
	LoadEffect_("ef712_01_emo_notice01");			// �C�Â�
	LoadEffect_("ef712_13_emo_sweat01");			// ��
	LoadEffect_("ef800_01_leaf_n");					// �t����(�K�T�S�\)
	LoadEffect_("ef800_02_leaf_s");					// �t����(�m�`���[���o����)
	LoadEffect_("ef800_03_grass");					// �t����(�n��)
	LoadEffect_("ef733_01_sym_shuchusen01");		// �W����(����)

// ���z�u
	// �΂�
	local bush00 = ArrangePointGimmick_("o_dem_02", model_bush, "obj_bush000");
	
	// ��l��
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_surprised");
	// �m�`���[��
	local nocho00 = ArrangePointNpc_(model_n_man, "npc_nocho000");
	SetAlpha_(nocho00, ALPHA_CLEAR);
	// ���������X�^�[
	local mons = ArrangePointNpc_(model_mons, "npc_nocho000");
	SetScaleSilhouette(mons, mons_scale, mons_outline);
	SetAlpha_(mons, ALPHA_CLEAR);

// ����풓���[�V�����Ǎ�
	// ��l��
	local pl_surprise = ReadMotion_(player, "Player_surprise");			// ����
	local pl_zusa01 = ReadMotion_(player, "Player_zusa01");				// �Y�T�[�i�����j
	local pl_up01 = ReadMotion_(player, "Player_up01");					// �|�ꁨ�㔼�g���N����
	local pl_up01_L = ReadMotion_(player, "Player_up01_L");				// �㔼�g���N����L
	local pl_one_knee = ReadMotion_(player, "Player_one_knee");			// �㔼�g���N���������G
	local pl_sit_guard = ReadMotion_(player, "Player_sit_guard");		// ���G�����G�K�[�h
	local pl_sit_guard_L = ReadMotion_(player, "Player_sit_guard_L");	// ���G�K�[�hL
	local pl_one_knee01 = ReadMotion_(player, "Player_one_knee01");		// ���G�K�[�h�����G�i�獶�����j
	local pl_one_knee01_L = ReadMotion_(player, "Player_one_knee01_L");	// ���G�i�獶�����jL
	local pl_look_left_L = ReadMotion_(player, "Player_look_left_L");	// ���������������L
	
	// �m�`���[��
	local nch_surprise = ReadMotion_(nocho00, "n000_surprise");			// �ʏ�ҋ@������
	local nch_surprise_L = ReadMotion_(nocho00, "n000_surprise_L");		// ����L
	local nch_think02 = ReadMotion_(nocho00, "n000_think02");			// �������l����i�r�g�݁j
	local nch_think02_L = ReadMotion_(nocho00, "n000_think02_L");		// �l����i�r�g�݁jL
	local nch_arm_folde = ReadMotion_(nocho00, "n000_arm_folde");		// �l����i�r�g�݁j���r�g��
	local nch_arm_folde_L = ReadMotion_(nocho00, "n000_arm_folde_L");	// �r�g��L
	local nch_run_L = ReadMotion_(nocho00, "n001_run_L");				// ����L
	local nch_feel_down = ReadMotion_(nocho00, "n000_feel_down");		// �ʏ��b����������
	local nch_feel_down_L = ReadMotion_(nocho00, "n000_feel_down_L");	// ��������L
	local nch_roll = ReadMotion_(nocho00, "n000_roll");					// �]���遨�N���オ��
	local nch_up_L = ReadMotion_(nocho00, "n000_up_L");					// �N���オ��L�i����j
	local nch_sit = ReadMotion_(nocho00, "n000_sit_surprise");			// �N���オ��i����j�������i����j
	local nch_sit_L = ReadMotion_(nocho00, "n000_sit_surprise_L");		// �����i����jL
	local nch_impatience_L = ReadMotion_(nocho00, "n000_impatience_L");	// �ł�L
	local nch_right_L = ReadMotion_(nocho00, "n000_stand_right_L");		// �E����L
	
// �����[�V�����ݒ�
	switch(flg_mons)
	{
	// �u�v���Y�j�����v
	case PURIZUNYAN:		// Num12 = 0
		motion_jump = ReadMotion_(mons, "m040_00_jump");				// ��яo��
		motion_take = MOT_LIFE_SPECIAL_1;								// �Ȃ�L
		break;
	// �u�t�H���f���v
	case FONDHU:			// Num12 = 1
		motion_jump = ReadMotion_(mons, "m125_00_jump");				// ��яo��
		motion_take = ReadMotion_(mons, "m125_00_take_L");				// �Ȃ�L
		break;
	// �u�h���L�[�v
	case DORAKI:			// Num12 = 2
		motion_jump = MOT_RUN;											// ��яo��
		motion_take = ReadMotion_(mons, "m052_00_take_L");				// �Ȃ�L
		break;
	// �u�i�X�r�[���v
	case NASUBINARA:		// Num12 = 3
		motion_jump = ReadMotion_(mons, "m069_00_jump");				// ��яo��
		motion_take = ReadMotion_(mons, "m069_00_take_L");				// �Ȃ�L
		break;
	default :
		DebugPrint("[Update] WARNING : �t���OID (" + flg_mons + ") ���s���ł�");
	}

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P���m�`���[���̔ߖ`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetMotion_(bush00, MOT_GIMMICK_1, BLEND_M);						// �K�T�S�\ON
	SetPointWorldEffect_("ef800_01_leaf_n", "obj_bush000");
	PlaySE_("SE_DEM_002");											// ���FSE�u�K�T�K�T�c�v
	Wait_(15);
	
	SurpriseDisp(player);
	
	Wait_(30);
	
	// ���̃J�b�g�̏����E�E
	SetMotion_(player, MOT_WALK, BLEND_M);
	SetMotionSpeed_(player, 0.7);
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g�Q���΂݂ɋ߂Â��`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F
	
	task_player = Task_AnimeMove_(player, "anm_player000");			// 120F
	WaitTask(task_player);
	
	// �E�E�E�E�E�E�E�E�E�E
	DeleteTask_(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_S);
	SetAlpha_(player, ALPHA_CLEAR);
	SetPointPos_(player, "player002");
	
	DeleteTask_(task_cam);
	SetMotion_(bush00, MOT_GIMMICK_0, BLEND_M);							// �K�T�S�\OFF
	// �E�E�E�E�E�E�E�E�E�E
	
	// �~�J�b�g�R���p�~
	
	// ���J�b�g�S���΂݃Y�[���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001_2", "anmtgt001_2");		// 120F
	SetMotionSpeed_(player, 1.0);
	
	uMoveBush(bush00, 10);
	uMoveBush(bush00, 20);
	uMoveBush(bush00, 35);
	
	WaitTask(task_cam);
	
	//===============================================
	// *�m�`���[��
	// �u�ǂ��Ă���[�I�@���ԂȂ�����[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// �E�E�E�E�E�E�E�E�E�E
	DeleteTask_(task_cam);
	SetMotion_(bush00, MOT_GIMMICK_0, BLEND_M);								// �K�T�S�\OFF
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g�T���m�`���[����яo���`�`�`�`�`�`�`�`�`�`�`�`�`
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);			// �W����
	efc_nocho00 = SetSelectBoneEffect_("ef712_13_emo_sweat01", nocho00, ATTACH_EFFECT1);		// ��
	
	RideOn_(nocho00, mons, mons_kind, mons_ride_size);
	SetMotion_(mons, motion_jump, BLEND_M);
	task_mons = Task_AnimeMove_(mons, "anm_nocho000");		// 45F
	SetAlpha_(nocho00, ALPHA_EXIST);
	SetAlpha_(mons, ALPHA_EXIST);
	
	SetMotion_(bush00, MOT_GIMMICK_1, BLEND_M);				// �K�T�S�\ON
	SetPointWorldEffect_("ef800_01_leaf_s", "obj_bush000");
	PlaySE_("SE_DEM_003");									// ���FSE�u�K�T�b�I�v
	Wait_(17);
	
	// �E�E�E�E�E�E�E�E�E�E
	SetMotion_(bush00, MOT_GIMMICK_0, BLEND_M);				// �K�T�S�\OFF
	DeleteTask_(task_mons);
	task_mons = Task_AnimeMove_(mons, "anm_nocho001");		// 5F
	SetMotion_(mons, MOT_WAIT, BLEND_N);
	SetMotion_(mons, motion_jump, BLEND_N);					// �W�����v���[�V�����Đ�������
	
	SetAlpha_(player, ALPHA_EXIST);
	SetMotion_(player, pl_surprise, BLEND_M);				// ����
	SetFace_(player, "Face_surprised");
	// �E�E�E�E�E�E�E�E�E�E
	
	// �J�b�g�؂�ւ��`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye005_2");
	SetPointCameraTarget_("camtgt005_2");
	Wait_(10);
	
	// �E�E�E�E�E�E�E�E�E�E
	SetFace_(player, "Face_eyes_close");
	DeleteTask_(task_mons);
	RideOff_(nocho00, mons);
	SetAlpha_(mons, ALPHA_CLEAR);
	SetMotion_(mons, MOT_WAIT, BLEND_N);
	SetAlpha_(nocho00, ALPHA_CLEAR);
	SetPointPos_(nocho00, "npc_nocho001");
	DeleteEffect_(efc_nocho00);
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g�U��������l���Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 5F
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 8);
	WaitFade_();
	
	DeleteTask_(task_cam);
	DeleteEffect_(efc_cam);
	
	PlaySE_("SE_DEM_004");								// ���FSE�u�h�V���b�I�v
	Wait_(30);
	
	// �E�E�E�E�E�E�E�E�E�E
	SetMotion_(nocho00, nch_feel_down_L, BLEND_S);
	SetAlpha_(nocho00, ALPHA_EXIST);
	
	SetPointPos_(player, "player003");
	SetMotion_(player, pl_zusa01, BLEND_M);				// �Y�T�[�i�����j
	efc_player = SetSelectBoneEffect_("ef800_03_grass", player, ATTACH_GLOBAL);
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g�V�|�O����l���Y�T�[�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	PlaySE_("SE_DEM_008");								// ���FSE��l���Ԃ����Ă�����
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	//-----
	
	WaitMotion(player);
	
	// �E�E�E�E�E�E�E�E�E�E
	SetMotion_(nocho00, nch_roll, BLEND_N);		// �]���遨�N���オ��
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g�V�|�P���m�`���[�������Ă�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");
	PlaySE_("SE_DEM_009");								// ���FSE�m�`���Ԃ����Ă�����
	
	Wait_(15);
	efc_nocho00 = SetSelectBoneEffect_("ef800_03_grass", nocho00, ATTACH_GLOBAL);
	WaitMotion(nocho00);
	SetMotion_(nocho00, nch_up_L, BLEND_M);		// �N���オ��L�i����j
	
	//===============================================
	// *�m�`���[��
	// �u���������c�c�Ђǂ��ڂɁ@����������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(nocho00, nch_sit, BLEND_M);		// �N���オ��i����j�������i����j
	local efc = SurpriseDispSetOffset(nocho00, Vec3(3, -2.0, -5), 0.6);
	WaitMotion(nocho00);
	SetMotion_(nocho00, nch_sit_L, BLEND_M);	// �����i����jL
	Wait_(15);
	
	// �E�E�E�E�E�E�E�E�E�E
	SetDir_(player, 10);
	SetMotion_(player, pl_up01, BLEND_N);							// �|�ꁨ�㔼�g���N����
	task_player = Task_ChangeMotion_(player, pl_up01_L, BLEND_M);	// �㔼�g���N����LOOP
	SetPointPos_(nocho00, "npc_nocho004");
	task_nocho = Task_AnimeMove_(nocho00, "anm_nocho004");			// 15F
	efc_nocho00 = SetSelectBoneEffect_("ef712_13_emo_sweat01", nocho00, ATTACH_EFFECT1);		// ��
	SetMotion_(nocho00, nch_run_L, BLEND_N);						// ����LOOP
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g�V�|�Q���m�`���[���J�����C���`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	WaitTask(task_nocho);
	DeleteTask_(task_nocho);
	SetMotion_(nocho00, nch_impatience_L, BLEND_L);
	
	//===============================================
	// *�m�`���[��
	// �u����͂�@��������������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// �E�E�E�E�E�E�E�E�E�E
	DeleteTask_(task_player);
	SetAlpha_(player, ALPHA_CLEAR);
	SetMotion_(nocho00, MOT_WAIT, BLEND_N);
	DeleteEffect_(efc_nocho00);
	SetPointPos_(mons, "npc_priz004");
	SetAlpha_(mons, ALPHA_EXIST);
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g�V�|�R���m�`���[���o�`�m�Q�t�o�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_(anmeye008, anmtgt008);		// 120F
	WaitTask(task_cam);
	MotionTalk(nocho00);
	
	//===============================================
	// *�m�`���[��
	// �u�I�C���́@�m�`���[�����̂��̂�����B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_040");
	KeyInputWait_();
	
	SetMotion_(nocho00, nch_right_L, BLEND_L);					// �E����LOOP
	
	//-----------------------------------------------
	// ��
	// �u�����ā@�����ɂ���͖̂�ǃ����X�^�[��
	//-----------------------------------------------
	SetExchangeMonsterKindName_(mons_kind);		// �����X�^�[�푰���ɒu��
	ShowMsg_("DEMO_009_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(mons, MOT_RUN, BLEND_M);
	task_mons = Task_MoveForward_(mons, 2.0, false);
	
	Wait_(10);
	SetMotion_(nocho00, MOT_WAIT, BLEND_M);
	Wait_(4);
	efc_nocho00 = SetSelectBoneEffect_("ef712_01_emo_notice01", nocho00, ATTACH_EFFECT1);	// �C�Â�
	SetMotion_(nocho00, nch_surprise, BLEND_M);												// ����
	WaitMotion(nocho00);
	
	// �E�E�E�E�E�E�E�E�E�E
	SetMotion_(nocho00, MOT_WAIT, BLEND_N);
	SetAlpha_(nocho00, ALPHA_CLEAR);
	DeleteTask_(task_mons);
	SetPointPos_(mons, "npc_priz005");
	SetMotion_(mons, MOT_RUN, BLEND_N);
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g�V�|�S�������X�^�[�U�����O�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye009");
	SetPointCameraTarget_("camtgt009");
	
	//===============================================
	// *�m�`���[��
	// �u�u�����I�@����@���O���I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// �E�E�E�E�E�E�E�E�E�E
	DeleteTask_(task_mons);
	DeleteTask_(task_nocho);
	PlaySE_("SE_DEM_011");								// ���FSE�����X�^�[������
	
	SetPointPos_(nocho00, "npc_nocho003");
	SetAlpha_(nocho00, ALPHA_CLEAR);
	SetStepSe_(mons, SILENT_STEP_SE);
	SetMotion_(mons, MOT_ATTACK, BLEND_M);
	task_mons = Task_AnimeMove_(mons, "anm_priz001");		// 30F
	
	DeleteTask_(task_cam);
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g�X�������X�^�[�U���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");			// 30F
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
	Wait_(25);
	
	// �E�E�E�E�E�E�E�E�E�E
	DeleteTask_(task_cam);
	
	DeleteTask_(task_mons);
	SetAlpha_(mons, ALPHA_CLEAR);
	SetMotion_(mons, MOT_WAIT, BLEND_N);
	
	SetAlpha_(player, ALPHA_EXIST);
	SetDir_(player, 45);
	SetFace_(player, "Face_grimace");
	SetMotion_(player, pl_sit_guard, BLEND_M);		// ���G�����G�K�[�h
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g10����l���Y�[���������X�^�[�����`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 30F
	WaitTask(task_cam);
	DeleteEffect_(efc_cam);
	
	WaitMotion(player);
	SetMotion_(player, pl_sit_guard_L, BLEND_M);		// ���G�K�[�hLOOP
	Wait_(30);
	SetAlpha_(mons, ALPHA_EXIST);
	SetMotion_(mons, MOT_WALK, BLEND_M);
	task_mons = Task_AnimeMove_(mons, anm_priz002);		// 30F
	Wait_(30);
	DeleteTask_(task_cam);
	
	// �Y�[���A�E�g�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 150F
	
	SetFace_(player, "Face_surprised");
	SetMotion_(player, pl_one_knee01, BLEND_M);		// ���G�K�[�h�����G�i�獶�����j
	
	ResetStepSe_(mons);
	DeleteTask_(task_mons);
	task_mons = Task_RotateToPos_(mons, mons_rot, ROTATE_DEMO_DEF);
	
	SetMotion_(mons, motion_take, BLEND_L);				// ����
	efc_mons = SetSelectBoneEffect_("ef712_18_emo_heart01", mons, ATTACH_EFFECT2);	// �n�[�g
	SetEffectScale_(efc_mons, heart_scale);
	PlaySE_("SE_DEM_005");		// �u�ڂ���c�v
	
	WaitMotion(player);
	SetMotion_(player, pl_one_knee01_L, BLEND_M);		// ���G�i�獶�����jL
	WaitTask(task_cam);
	Wait_(30);
	
	// �E�E�E�E�E�E�E�E�E�E
	SetFace_(player, "Face_eyes_close");
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(mons, ALPHA_CLEAR);
	SetAlpha_(nocho00, ALPHA_EXIST);
	DeleteTask_(task_mons);
	DeleteTask_(task_cam);
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g11���m�`���[���A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");		// 300F
	
	SetMotion_(nocho00, nch_surprise, BLEND_M);		// �ʏ�ҋ@������
	efc_nocho00 = SetSelectBoneEffect_("ef712_01_emo_notice01", nocho00, ATTACH_EFFECT2);	// �C�Â�
	WaitMotion(nocho00);
	SetMotion_(nocho00, nch_surprise_L, BLEND_M);		// ����L
	
	//===============================================
	// *�m�`���[��
	// �u�����H�@�Ȃ�Ł@�I�C��������Ă�
	//-----------------------------------------------
	SetExchangeMonsterKindName_(mons_kind);		// �����X�^�[�푰���ɒu��
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_070");
	KeyInputWait_();
	
	SetMotion_(nocho00, nch_think02, BLEND_M);				// �������l����i�r�g�݁j
	WaitMotion(nocho00);
	SetMotion_(nocho00, nch_think02_L, BLEND_M);			// �l����i�r�g�݁jLOOP
	
	//-----------------------------------------------
	// ��
	// �u���������΁@�m�`���[�����̃L���O����
	//-----------------------------------------------
	ShowMsg_("DEMO_009_MSG_080");
	KeyInputWait_();
	
	SetMotion_(nocho00, nch_arm_folde, BLEND_M);			// �l����i�r�g�݁j���r�g��
	WaitMotion(nocho00);
	SetMotion_(nocho00, nch_arm_folde_L, BLEND_M);			// �r�g��LOOP
	
	//-----------------------------------------------
	// ��
	// �u����������������@�`�J��������
	//-----------------------------------------------
	ShowMsg_("DEMO_009_MSG_090");
	KeyInputWait_();

	//-----------------------------------------------
	// �܂����@���O��
	//-----------------------------------------------
	ShowMsg_("DEMO_009_MSG_100");
	KeyInputWait_();
	
	CloseMsgWnd_();
	//===============================================
	
	// �E�E�E�E�E�E�E�E�E�E
	DeleteTask_(task_cam);
	DeleteEffect_(efc_mons);
	
	SetAlpha_(player, ALPHA_CLEAR);
	
	SetAlpha_(mons, ALPHA_EXIST);
	SetMotion_(mons, MOT_WAIT, BLEND_N);
	SetPointPos_(mons, "npc_priz001");
	// �E�E�E�E�E�E�E�E�E�E
	
	// ���J�b�g15�������X�^�[�A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_(anmeye007, anmtgt007);
	WaitTask(task_cam);
	
	//===============================================
	// *�m�`���[��
	// �u���O�̂��Ƃ��@�C�ɓ������悤�����@���Ԃɂ�����ǂ�������H
	//-----------------------------------------------
	SetExchangeMonsterKindName_(mons_kind);		// �����X�^�[�푰���ɒu��
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ���V�X�e�����b�Z�[�W
	// �������X�^�[�푰�������@���Ԃɂ��܂����H
	//-----------------------------------------------
	SetExchangeMonsterKindName_(mons_kind);		// �����X�^�[�푰���ɒu��
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	while(true)
	{
		// �y�͂��̏ꍇ�F�P�z
		if (GetQueryResult_() == QUERY2_0) {
			PlayMe_("ME_010");			// �d�v�A�C�e������
			
			//===============================================
			// ���V�X�e�����b�Z�[�W
			// �������X�^�[�푰�������@���ԂɂȂ����I
			//-----------------------------------------------
			SetExchangeMonsterKindName_(mons_kind);		// �����X�^�[�푰���ɒu��
			OpenMsgWnd_();
			ShowMsg_("DEMO_009_MSG_140");
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
			
			break;
		}
		// �y�������̏ꍇ�F�P�z
		else {
			//===============================================
			// *�m�`���[��
			// �u�܂��܂��@�������킸�ɁB
			//-----------------------------------------------
			OpenMsgWnd_();
			ShowMsg_("DEMO_009_MSG_130");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
		}
	}
	
	EndDemo(FADE_COLOR_BLACK);
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�΂݃��[�V�����؂�ւ�
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMoveBush(obj, frame)
{
	Wait_(15);
	SetMotion_(obj, MOT_GIMMICK_1, BLEND_M);		// �K�T�S�\ON
	SetPointWorldEffect_("ef800_01_leaf_n", "obj_bush000");
	PlaySE_("SE_DEM_002");	// �u�K�T�K�T�c�v
	Wait_(frame);
	SetMotion_(obj, MOT_GIMMICK_0, BLEND_M);		// �K�T�S�\OFF
}
