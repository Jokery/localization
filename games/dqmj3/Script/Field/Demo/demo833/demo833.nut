//=============================================
//
//		demo833 [�A���}�̒u���y�Y]
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
	local task_cam, task_player, task_rena, task_aroma;
	local task_aroma_step;
	local efc_player, efc_rena, efc_aroma, efc_cam;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_rena = ReadNpc_("n007");				// ���i�[�e
	local n_aroma = ReadNpc_("n018");					// �A���}
	//�M�~�b�N
	local model_o_A01_14 = ReadGimmick_("o_A01_14");	// ��
	local model_o_A01_15 = ReadGimmick_("o_A01_15");	// �Ԕ�
	//�G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");				// �u�I�v
	LoadEffect_("ef732_15_holography02");				// �z���O�����\���@�o��
	LoadEffect_("ef732_14_holography01");				// �z���O�����\���@�풓
	LoadEffect_("ef733_01_sym_shuchusen01");			// �W����

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetVisible(rena, false);
	// �A���}
	local aroma = ArrangePointNpc_(n_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	SetVisible(aroma, false);
	// �h�A
	local gmc_o_A01_14 = ArrangePointGimmick_("o_A01_14", model_o_A01_14, "obj_bluedoor");
	local gmc_o_A01_15 = ArrangePointGimmick_("o_A01_15", model_o_A01_15, "obj_reddoor");

// ����풓���[�V�����Ǎ�
	local player_guard_L = ReadMotion_(player, "Player_guard_L");				// ��l���@�g�\��L
	local player_look_around_L = ReadMotion_(player, "Player_look_around_L");	// ��l���@�L�����L����L
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");		// ��l���@�E�����ҋ@L
	local player_surprise = ReadMotion_(player, "Player_surprise");				// ��l���@����
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");			// ��l���@����L
	local rena_talk01 = ReadMotion_(rena, "n007_talk01");						// ���i�[�e�@��b�i������ɂ��Ă�j
	local rena_talk01_L = ReadMotion_(rena, "n007_talk01_L");					// ���i�[�e�@��bL�i������ɂ��Ă�j
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");				// ���i�[�e�@��������L
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");					// ���i�[�e�@������ҋ@L
	local rena_look_down_L = ReadMotion_(rena, "n007_look_down_L");				// ���i�[�e�@���ނ��ҋ@L
	local aroma_star_seed_L = ReadMotion_(aroma, "n018_star_seed_L");			// �A���}�@�X�^�[�V�[�h������L
	local aroma_look_down_L = ReadMotion_(aroma, "n018_look_down_L");			// �A���}�@�������ҋ@L

// ���t�F�[�h�F�ݒ�
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();

	SetFace_(player, "Face_loop_close");
	SetFace_(aroma, "Face_smile");
	SetMotion_(player, player_guard_L, BLEND_N);		// ��l���@�g�\��L
	
//����
	SetStepSe_(rena, "SE_FLD_016");


	//��������������������������������������
	//���J�b�g�P�@��l���@�g�\�����L�����L�����@��l������
	//��������������������������������������

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 120);

	Wait_(90);
	SetMotion_(player, MOT_WAIT, 34);					// ��l���@�ҋ@
	SetFace_(player, "Face_eyes_close");
	Wait_(35);
	SetMotion_(player, player_look_around_L, 22);		// ��l���@�L�����L����L
	Wait_(68);


	//��������������������������������������
	//���J�b�g�Q�@���Z�������
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	PlayBgm_("BGM_018");
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(30);


	//��������������������������������������
	//���J�b�g�R�@��l���ƃ��i�[�e�@���i�[�e��������l���E���������i�[�e��b�@��l�E�΂ߑO��
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetVisible(rena, true);
	SetMotion_(player, MOT_WAIT, BLEND_N);				// ��l���@�ҋ@
	SetMotion_(rena, MOT_WALK, BLEND_N);				// ���i�[�e�@����
	task_rena = Task_AnimeMove_(rena, "anm_rena000");
	Wait_(65);
	SetMotion_(player, player_look_right_L, 10);		// ��l���@�E�����ҋ@L
	Wait_(8);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);				// ���i�[�e�@�ҋ@
	WaitTask(task_rena);
	DeleteTask_(task_rena);
	Wait_(16);
	SetMotion_(rena, rena_talk01, 18);					// ���i�[�e�@��b�i������ɂ��Ă�j

	//===============================================
	//�����i�[�e
	//�u�Ȃ�Ȃ́c�c���̏ꏊ�́c�c�H
	//�@�i����̂悤�����ǁc�c�ǂ����ā@�����ɁH
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_833_MSG_010");
	WaitMotion(rena);
	SetMotion_(rena, rena_talk01_L, BLEND_M);			// ���i�[�e�@��bL�i������ɂ��Ă�j
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rena, MOT_WAIT, BLEND_XL);			
	Wait_(10);


	//��������������������������������������
	//���J�b�g�S�@���i�[�e�@���i�[�e��b�@�E�΂ߑO��
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetVisible(player, false);

	//===============================================
	//�����i�[�e
	//�u������@�A���}���c�c�H�@�ǂ���������Ȃ́H
	//�@�ޏ��炵���Ƃ����΁@�炵���̂����ǁc�c�B�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_833_MSG_020");
	KeyInputWait_();
	Wait_(16);
	SetMotion_(rena, rena_look_left_L, BLEND_XL);		// ���i�[�e�@��������L
	Wait_(10);
	//===============================================
	//�����i�[�e
	//�u<name_player/>�c�c���ׂĂ݂܂��傤�B
	//�@��������ł́@�l�q���@�悭�킩��Ȃ���B
	//-----------------------------------------------
	ShowMsg_("DEMO_833_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);

	//��������������������������������������
	//���J�b�g�T�@������@�Y�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetVisible(player, true);
	Wait_(30);

	//===============================================
	//�����i�[�e
	//�u���S�Ɂ@�o�g���p�̃X�e�[�W���@����݂����B
	//�@�������܂Ł@�s���Ă݂܂��傤�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_833_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(15);
	SetMotion_(player, MOT_WALK, BLEND_N);				// ��l���@����
	SetMotion_(rena, MOT_WALK, BLEND_N);				// ���i�[�e�@����
	task_player = Task_AnimeMove_(player, "anm_player001");
	task_rena = Task_AnimeMove_(rena, "anm_rena001");
	Wait_(1);


	//��������������������������������������
	//���J�b�g�U�@��l���ƃ��i�[�e�@��l���������i�[�e��b�@���΂ߑO��
	//��������������������������������������

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	Wait_(73);
	SetMotion_(player, MOT_WAIT, BLEND_XL);				// ��l���@�ҋ@
	SetMotion_(rena, MOT_WAIT, BLEND_XL);				// ���i�[�e�@�ҋ@
	WaitTask(task_rena);
	Wait_(15);
	SetMotion_(player, player_look_around_L, 20);		// ��l���@�L�����L����L
	SetMotion_(rena, rena_look_up_L, 21);				// ���i�[�e�@������ҋ@L

	//===============================================
	//�����i�[�e
	//�u���h�ȁ@�q�Ȃˁc�c���q����
	//�@��������@���ꂻ������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_833_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);

	//===============================================
	//���A���}�Q��
	//�u�悤�����I�@�����X�^�[�o�g���O�����v���ցI
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_833_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local efc_player = SurpriseDispSetOffset(player, Vec3(0.1, 1.9, 0.0), 0.525);
	local efc_rena = SurpriseDispSetOffset(rena, Vec3(0.9, -0.5, 0.0), 0.7);
	SetMotion_(player, MOT_WAIT, BLEND_M);				// ��l���@�ҋ@
	SetMotion_(rena, MOT_WAIT, BLEND_M);				// ���i�[�e�@�ҋ@
	Wait_(45);
	SetVisible(aroma, true);
	SetMotion_(aroma, MOT_WALK, BLEND_N);				// �A���}�@����
	task_aroma = Task_AnimeMove_(aroma, "anm_aroma000");
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	Wait_(1);
	DeleteTask_(task_player);
	DeleteTask_(task_rena);


	//��������������������������������������
	//���J�b�g�V�@�������o�X�g�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	Wait_(40);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);				// �A���}�@�ҋ@
	WaitTask(task_aroma);
	DeleteTask_(task_aroma);
	Wait_(10);
	DeleteTask_(task_aroma_step);
	
	PlaySE_("SE_DEM_068");
	efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma);							//�z���O�����o��
	SetAlpha_(aroma, ALPHA_HALF);
	Wait_(5);
	SetAlpha_(aroma, ALPHA_EXIST);

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(70);
	
	PlaySE_("SE_DEM_068");
	efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma);							//�z���O�����o��
	SetAlpha_(aroma, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(aroma, ALPHA_EXIST);
	Wait_(15);
	
	PlaySE_("SE_DEM_068");
	efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma);							//�z���O�����o��
	SetAlpha_(aroma, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(aroma, ALPHA_EXIST);
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(30);


	//��������������������������������������
	//���J�b�g�W�@�A���}�@��l���ƃ��i�[�e�@�Y�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	SetDir_(rena, 295);
	SetPointPos_(player, "player001");
	SetMotion_(player, player_surprise, BLEND_M);		// ��l���@����
	SetMotion_(rena, rena_talk01, BLEND_L);				// ���i�[�e�@��b�i������ɂ��Ă�j
	PlaySE_("SE_DEM_026");								// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// �W����
	Wait_(8);
	SetMotion_(player, player_surprise_L, BLEND_M);		// ��l���@����L

	//===============================================
	//�����i�[�e
	//�u���c�c�A���}�b�I�H
	//�@�ǂ����ā@�����Ɂc�c���������͂��ł́I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_833_MSG_070");
	Wait_(2);
	DeleteEffectEmitter_(efc_cam);
	WaitMotion(rena);
	SetMotion_(rena, rena_talk01_L, BLEND_M);			// ���i�[�e�@��bL�i������ɂ��Ă�j
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_XL);				// ���i�[�e�@�ҋ@
	Wait_(26);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g�X�@�R�l�@���Ձ�����
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	SetPointPos_(player, "player002");
	SetMotion_(aroma, MOT_WALK, BLEND_N);				// �A���}�@����
	task_aroma = Task_AnimeMove_(aroma, "anm_aroma001");
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	Wait_(56);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);				// �A���}�@�ҋ@
	Wait_(16);
	DeleteTask_(task_aroma_step);
	Wait_(16);
	DeleteTask_(task_aroma);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g�P�O�@�A���}�@�o�X�g�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	//===============================================
	//���A���}�Q��
	//�u�A�^�V�́@�A���}�{�l����Ȃ���B
	//�@���̃����X�^�[�i����̈ē����@�A���}�Q����I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_833_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	PlaySE_("SE_DEM_068");
	efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma);							//�z���O�����o��
	SetAlpha_(aroma, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(aroma, ALPHA_EXIST);
	Wait_(15);
	
	PlaySE_("SE_DEM_068");
	efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma);							//�z���O�����o��
	SetAlpha_(aroma, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(aroma, ALPHA_EXIST);
	Wait_(34);


	//��������������������������������������
	//���J�b�g�P�P�@���i�[�e�@�o�X�g�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	SetMotion_(rena, rena_look_down_L, BLEND_N);		// ���i�[�e�@���ނ��ҋ@L
	Wait_(30);

	//===============================================
	//�����i�[�e
	//�u�A���}�Q���c�c�������@�`�h�ˁH
	//�@�e���W�A�̂悤�ȁc�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_833_MSG_090");
	Wait_(12);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);				// ���i�[�e�@�ҋ@
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//��������������������������������������
	//���J�b�g�P�Q�@�A���}�@�o�X�g�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");

	SetMotion_(aroma, MOT_WAIT, BLEND_N);				// �A���}�@�ҋ@
	Wait_(5);
	SetMotion_(aroma, aroma_look_down_L, 16);			// �A���}�@�������ҋ@L
	Wait_(16);
	SetMotion_(aroma, MOT_WAIT, 12);					// �A���}�@�ҋ@
	Wait_(16);
	
	PlaySE_("SE_DEM_068");
	efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma);							//�z���O�����o��
	SetAlpha_(aroma, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(aroma, ALPHA_EXIST);
	Wait_(11);
	SetMotion_(aroma, MOT_TALK, BLEND_L);				// �A���}�@��b
	Wait_(8);

	//===============================================
	//���A���}�Q��
	//�u�����X�^�[�o�g���O�����v����
	//�@�A���^�Ɏc�����@�A���}����̒����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA_NO2");
	ShowMsg_("DEMO_833_MSG_100");
	WaitMotion(aroma);
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_L);			// �A���}�@��bL
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);


	//��������������������������������������
	//���J�b�g�P�R�@��l���ƃ��i�[�e�@�S(o߃��o)�ށ���̊���
	//��������������������������������������

	SetPointCameraEye_("cameye008");
	SetPointCameraTarget_("camtgt008");

	SetDir_(player, 330);
	SetDir_(rena, 345);
	SetMotion_(player, MOT_WAIT, BLEND_N);				// ��l���@�ҋ@

	//===============================================
	//���A���}�Q��
	//�u�ŋ��̃����X�^�[�}�X�^�[���@�ڎw����
	//�@���������Ă݂��Ȃ����@<name_player/>�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA_NO2");
	ShowMsg_("DEMO_833_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	PlayLoopSE_("SE_WIFI_001");
	WaitTask(task_cam);
	Wait_(30);
	StopLoopSE_(15);

	EndDemo(FADE_COLOR_WHITE);

}
