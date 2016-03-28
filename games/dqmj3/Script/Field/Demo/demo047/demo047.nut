//=============================================
//
//		demo047[�ړ����u�̋N��]
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
	local efc_smoke03, efc_spr00, efc_transfer;
	local task_cam, task_player, task_npc01, task_npc02, task_npc03, task_ace, task_king;
	
// �����f���Ǎ�
	// �M�~�b�N
	local model_tenso = ReadGimmick_("o_dem_00");	// �]�����u
	local model_throne = ReadGimmick_("o_com_05");	// �ʍ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_nocho = ReadNpc_("n000");			// ��ʃm�`���[��
	local model_jack = ReadNpc_("n001");			// �W���b�N
	local model_ace = ReadNpc_("n002");				// �G�[�X
	local model_king = ReadNpc_("n003");			// �L���O
	local model_queen = ReadNpc_("n005");			// �N�C�[��
	local model_rin = ReadNpc_("n043");				// �m�`������

	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef732_01_tec_device_travel01");
	LoadEffect_("ef732_02_tec_device_travel02");
	LoadEffect_("ef732_03_tec_device_travel03");
// ���z�u
	// �]�����u
	local tenso = ArrangePointGimmick_("o_dem_00", model_tenso, "obj_tenso000");
	SetDir_(tenso, -30);
	// �ʍ�
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");
	SetDir_(throne, 90);

	// ��l��
	SetPointPos_(player, "player000");
	// �W���b�N
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// �G�[�X
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	// �L���O
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// �N�C�[��
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");
	
	// ������P
	local mob1 = ArrangePointNpc_(model_rin, "npc_mob1");
	// �m�`������
	local mob2 = ArrangePointNpc_(model_nocho, "npc_mob2");
	// ������R
	local mob3 = ArrangePointNpc_(model_nocho, "npc_mob3");
	// ������S
	local mob4 = ArrangePointNpc_(model_nocho, "npc_mob4");

// ����풓���[�V�����Ǎ�
	// �G�[�X
	local ace_operate = ReadMotion_(ace, "n002_operate_L");				// ���쒆L
	local ace_rejoice_L = ReadMotion_(ace, "n000_rejoice_L");			// �W�����v�i��сjL
	local ace_talk_joy_L = ReadMotion_(ace, "n002_talk_joy_L");			// ��b�@��������L
	local ace_runL = ReadMotion_(ace, "n001_run_L");					// ����L
	local ac_jump = ReadMotion_(ace, "n002_jump");						// �W�����v
	local ac_hand_up = ReadMotion_(ace, "n002_hand_up");				// ��b�����������
	local ac_hand_up_L = ReadMotion_(ace, "n002_hand_up_L");			// �����������L
	local ac_stand01 = ReadMotion_(ace, "n002_stand01");				// ��b���W�����v���ҋ@
	local ac_float = ReadMotion_(ace, "n002_float");					// �ҋ@������
	local ac_float_L = ReadMotion_(ace, "n002_float_L");				// �ҋ@������L
	// �L���O
	local king_look_jack = ReadMotion_(king, "n003_look_jack");			// ������Ɍ�����
	local king_look_jack_L = ReadMotion_(king, "n003_look_jack_L");		// ������Ɍ�����L
	local king_look_left = ReadMotion_(king, "n003_look_bldg");			// ������
	local king_look_left_L = ReadMotion_(king, "n003_look_bldg_L");		// ������L
	local stick_king = ReadMotion_(king, "n003_stick_up");				// �ҋ@����f��
	local stickL_king = ReadMotion_(king, "n003_stick_up_L");			// ��f��L
	local king_float = ReadMotion_(king, "n003_float");					// �ҋ@������
	local king_float_L = ReadMotion_(king, "n003_float_L");				// �ҋ@������L

// ���������[�V�����ݒ�
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	Wait_(60);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	SetMotion_(king, king_look_jack, BLEND_M);							// ������Ɍ�����
	Wait_(30);
	task_king = Task_ChangeMotion_(king, king_look_jack_L, BLEND_M);	// ������Ɍ�����L
	
	//===============================================
	// ���L���O
	// �u�����@<name_player/>�@���Ă��ꂽ���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_047_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(mob1, ALPHA_CLEAR);
	SetAlpha_(mob2, ALPHA_CLEAR);
	SetAlpha_(mob3, ALPHA_CLEAR);
	SetAlpha_(mob4, ALPHA_CLEAR);
	SetAlpha_(jack, ALPHA_CLEAR);
	SetAlpha_(king, ALPHA_CLEAR);
	SetAlpha_(queen, ALPHA_CLEAR);
	
	SetMotion_(king, MOT_WAIT, BLEND_N);
	
	// ���J�b�g�Q�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 120F
	WaitTask(task_cam);
	
	//===============================================
	// ���L���O
	// �u���ԑ�n�́@�˂����ƂȂ�@�ڑ����u���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_047_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetAlpha_(king, ALPHA_EXIST);
	DeleteTask_(task_cam);
	
	// ���J�b�g�R�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(king, king_look_jack_L, BLEND_XL);			// ������Ɍ�����LOOP
	Wait_(10);
	
	//===============================================
	// ���L���O
	// �u�����@�G�[�X��@�����̏o�Ԃł��邼�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_047_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_N);
	SetDir_(ace, -125);
	
	// ���J�b�g�S�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(ace, ac_hand_up, BLEND_M);					// ��b�����������
	WaitMotion(ace);
	SetMotion_(ace, ac_hand_up_L, BLEND_M);					// �����������L
	
	//===============================================
	// ���G�[�X
	// �u�킩���Ă邺�[���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_047_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_ace = Task_RotateToDir_(ace, -65, ROTATE_DEMO_DEF);
	SetMotion_(ace, MOT_WALK, BLEND_M);
	WaitTask(task_ace);
	
	SetMotion_(ace, ace_runL, BLEND_M);						// ����
	local step = Task_PlaySe_("SE_FLD_011", 7);
	Wait_(2);
	task_ace = Task_AnimeMoveNoFit_(ace, "anm_ace000");		// 45F
	Wait_(19);
	DeleteTask_(step);
	//-----
	FadeOutContinuitySE_("SE_FLD_011", 7, 15.0);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");
	
	SetAlpha_(king, ALPHA_CLEAR);
	DeleteTask_(task_king);
	
	SetMotion_(ace, ace_operate, BLEND_N);					// �p�l������
	WaitTask(task_ace);
	DeleteTask_(task_ace);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	WaitFade_();
	//-----
	
	Wait_(60);
	
	SurpriseDisp(ace);
	Wait_(45);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetPointPosNoFit_(ace, "npc_ace004");
	SetAlpha_(mob1, ALPHA_EXIST);
	SetAlpha_(mob2, ALPHA_EXIST);
	SetAlpha_(mob3, ALPHA_EXIST);
	SetAlpha_(ace, ALPHA_EXIST);
	SetAlpha_(jack, ALPHA_EXIST);
	SetAlpha_(king, ALPHA_EXIST);
	SetAlpha_(queen, ALPHA_EXIST);
	
	// �]�����uON
	// ���J�b�g�T�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");
	SetDir_(tenso, -60);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	//-----
	
	SetMotion_(tenso, MOT_GIMMICK_1, BLEND_N);
	PlaySE_("SE_DEM_022");
	Wait_(190);
	SetMotion_(tenso, MOT_GIMMICK_2, BLEND_N);
	Wait_(30);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
	WaitFade_();
	
	SetAlpha_(queen, ALPHA_CLEAR);
	
	// ���J�b�g�U�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");
	SetVisible(throne, false);													//�����̏���

	SetDir_(tenso, -30);
	SetStepSePan_(ace, false);
	SetMotion_(ace, MOT_WALK, BLEND_M);
	task_ace = Task_RotateToPos_(ace, Vec3(-520, 385, -1804), ROTATE_DEMO_DEF);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
	WaitFade_();
	//-----
	
	WaitTask(task_ace);
	DeleteTask_(task_ace);
	
	SetMotion_(ace, ace_rejoice_L, BLEND_M);
	local step = Task_PlaySe_("SE_FLD_011", 15);
	
	//===============================================
	// ���G�[�X
	// �u�L���O�[���I�@�����ł������I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_047_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//-----
	DeleteTask_(step);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetAlpha_(queen, ALPHA_EXIST);
	SetAlpha_(player, ALPHA_EXIST);
	SetPointPos_(player, "player001");
	SetPointPos_(ace, "npc_ace002");
	SetMotion_(ace, MOT_WAIT, BLEND_N);
	SetPointPos_(king, "npc_king001");
	SetPointPos_(mob1, "npc_nocho200");
	SetPointPos_(mob2, "npc_nocho000");
	SetPointPos_(mob3, "npc_nocho100");
	SetDir_(tenso, -60);
	
	// ���J�b�g�V�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	//-----
	
	WaitTask(task_cam);
	
	SetMotion_(king, king_look_jack_L, BLEND_XL);	// ������Ɍ�����LOOP
	Wait_(10);
	
	//===============================================
	// ���L���O
	// �u���ށI�@�ł������̂ł���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_047_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, stick_king, BLEND_M);			// ��f��
	WaitMotion(king);
	SetMotion_(king, stickL_king, BLEND_M);			// ��f��
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
	WaitFade_();
	
	SetDir_(king, -120);
	DeleteTask_(task_cam);
	task_king = Task_AnimeMoveNoFit_(king, "anm_player001");
	
	// ���J�b�g�W�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
	WaitFade_();
	//-----
	
	Wait_(10);
	local effectId2 = SetPointWorldEffect_("ef732_02_tec_device_travel02", "obj_tenso000");
	PlaySE_("SE_DEM_023");							//��SE�F��������

	Wait_(30);
	
	DeleteTask_(task_king);
	
	// ���J�b�g�X�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	task_king = Task_AnimeMoveNoFit_(king, "anm_player000");
	
	SetMotion_(king, king_float, BLEND_M);			// �ҋ@������
	WaitMotion(king);
	SetMotion_(king, king_float_L, BLEND_M);		// �ҋ@������L
	
	PlaySE_("SE_DEM_035");							//��SE�F�L���O���ˏo�I
	local effectId3 = SetSelectBoneEffectSetOffset_("ef732_03_tec_device_travel03", king, ATTACH_GLOBAL, Vec3(0.0, -13.0, 0.0));
	SetEffectScale_(effectId3, 3.0);
	Wait_(15);
	efc_transfer = SetPointWorldEffect_("ef732_01_tec_device_travel01", "obj_tenso000");
	Wait_(135);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetVisible(mob1, false);
	SetVisible(mob2, false);
	SetVisible(mob3, false);
	SetVisible(jack, false);
	SetVisible(king, false);
	SetVisible(queen, false);
	
	SetPointPos_(player, "player002");
	SetPointPos_(ace, "npc_ace003");
	
	DeleteTask_(task_cam);
	DeleteEffect_(effectId3);
	SetDir_(ace, 110);
	
	// ���J�b�g�P�O�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	//-----
	
	SetMotion_(ace, MOT_TALK, BLEND_M);
	WaitMotion(ace);
	SetMotion_(ace, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ���G�[�X
	// �u�悭�@����Ă��ꂽ���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_047_MSG_070");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�����͂����@���N���N�����I
	//-----------------------------------------------
	ShowMsg_("DEMO_047_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	task_ace = Task_AnimeMoveNoFit_(ace, "anm_player002");
	PlaySE_("SE_DEM_036");						//��SE�F�G�[�X���ˏo�I
	local effectId4 = SetSelectBoneEffect_("ef732_03_tec_device_travel03", ace, ATTACH_GLOBAL);

	SetMotion_(ace, ac_float, BLEND_M);			// �ҋ@������
	Wait_(15);
	
	efc_transfer = SetPointWorldEffect_("ef732_01_tec_device_travel01", "obj_tenso000");
	WaitMotion(ace);
	SetMotion_(ace, ac_float_L, BLEND_M);		// �ҋ@������L
	
	Wait_(30);
	SetAlpha_(player, ALPHA_CLEAR);
	WaitTask(task_cam);
	
	EndDemo(FADE_COLOR_BLACK);
}
