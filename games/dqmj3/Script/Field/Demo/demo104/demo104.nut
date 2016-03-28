//=============================================
//
//		demo104[�d���̕���_2(�T�u�d��A)]
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
	local efc00_acc, efc01_srp;
	local task_cam, task_cam2, task_player;
	local gimmick_motion;
	local msg_key00;

// ���t���O�ݒ�
	local bit_battery02 = GetEventFlg_("BFG_BATTERY_SECOND");		// Bit_1045 �~�d��A�N��

	if (bit_battery02) {
		gimmick_motion = MOT_GIMMICK_1;		// ��
		msg_key00 = "DEMO_104_MSG_030"		// �u�悵�悵�B�����P�́@�T�u�d�����������ȁB
	}
	else {
		gimmick_motion = MOT_GIMMICK_0;		// ��
		msg_key00 = "DEMO_104_MSG_010"		// �u�������@�T�u�d������
	}

// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	// �M�~�b�N
	local model_storage = ReadGimmick_("o_A02_01");	// �~�d��
	local model_light_R = ReadGimmick_("o_A02_04");	// ���C�g�i�E�j
	local model_light_L = ReadGimmick_("o_A02_05");	// ���C�g�i���j
	local model_door = ReadGimmick_("o_A02_00");	// �d�q�h�A
	local model_monitor = ReadGimmick_("o_A02_02");	// ���C�����j�^�[
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[����

// ���z�u
	// �~�d��P�i���j
	local storage00 = ArrangePointGimmick_("o_A02_01", model_storage, "obj_storage000");
	// ���C�g�i�E�j
	local light00 = ArrangePointGimmick_("o_A02_04", model_light_R, "obj_lightR000");
	SetMotion_(light00, gimmick_motion, BLEND_N);
	// ���C�g�i���j
	local light01 = ArrangePointGimmick_("o_A02_05", model_light_L, "obj_lightL000");
	SetMotion_(light01, MOT_GIMMICK_0, BLEND_N);
	SetAlpha_(light01, ALPHA_CLEAR);
	// ���C�g�i���j�\��
	local light_spare = ArrangePointGimmick_("o_A02_05", model_light_L, "obj_lightL000");
	SetMotion_(light_spare, MOT_GIMMICK_0, BLEND_N);
	// �d�q�h�A�P�i�����j
	local door00 = ArrangePointGimmick_("o_A02_00", model_door, "obj_door000");
	// �d�q�h�A�Q�i�E���j
	local door01 = ArrangePointGimmick_("o_A02_00", model_door, "obj_door100");
	// ���C�����j�^�[
	local monitor = ArrangePointGimmick_("o_A02_02", model_monitor, "obj_monitor000");
	SetMotion_(monitor, MOT_GIMMICK_3, BLEND_N);			// ���j�^(�~�d��E�_��)
	
	// ��l��
	SetPointPos_(player, "player000");

// ����풓���[�V�����Ǎ�
	// ��l��
	local panel = ReadMotion_(player, "Player_panel02");				// ��l���p�l������
	local reactor = ReadMotion_(player, "Player_touch_reactor");		// ��������������遨���A�N�^�[��G��
	local reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// ���A�N�^�[��G��L
	local player_stand = ReadMotion_(player, "Player_stand01");			// ���A�N�^�[��G�遨�ҋ@�ɖ߂�	

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SurpriseDisp(player);
	Wait_(15);
	
	local light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	//���A�N�^�[����
	OpenConnectiveWithMotion("connective_ace", player, reactor, reactor_L);
	
	//===============================================
	// ���G�[�X
	// ���򃁃b�Z�[�W
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_(msg_key00);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	CloseConnective();
	Wait_(30);
	
	SetMotion_(player, player_stand, BLEND_L);			//���A�N�^�[�G�遨�ҋ@
	Wait_(25);
	
	// �p�l��ON��SE
	SetMotion_(player, panel, BLEND_L);					//��l���p�l������
	Wait_(5);
	PlaySE_("SE_DEM_033");								// �~�d��N����	
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);	

	Wait_(23);
	
	StartEarthQuake_(15, 3, 0.5);

	Wait_(42);
	
	SetMotion_(storage00, MOT_GIMMICK_1, BLEND_M);		// �d��ON
	Wait_(30);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
		DeleteTask_(task_cam);
		task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 120F
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	Wait_(30);
	
	SetMotion_(light01, MOT_GIMMICK_1, BLEND_M);		// �ԁ���
	for (local i=1; i<=10; i++) {
		SetAlpha_(light01, ALPHA_CLEAR + (i * 0.1));
		SetAlpha_(light_spare, ALPHA_EXIST - (i * 0.1));
		Wait_(1);
	}
	SetMotion_(light01, MOT_GIMMICK_1, BLEND_N);
	
	Wait_(30);
	
	if (bit_battery02) {
		//====================================
		//���N���X�t�F�[�h
		//====================================
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
		WaitFade_();
		DeleteTask_(task_cam);
		task_cam2 = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 90F
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
		PlaySE_("SE_DEM_039");
		SetMotion_(door00, MOT_GIMMICK_1, BLEND_M);		// �h�A�P�J��
		Wait_(30);
		SetMotion_(door01, MOT_GIMMICK_1, BLEND_M);		// �h�A�Q�J��
		
		Wait_(59);
		
		SetMotion_(door00, MOT_GIMMICK_2, BLEND_M);		// �h�A�P�J���
		Wait_(30);
		SetMotion_(door01, MOT_GIMMICK_2, BLEND_M);		// �h�A�Q�J���
		
		Wait_(15);
		
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
		WaitFade_();
		DeleteTask_(task_cam2);
		task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 90F
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
		Wait_(30);
		
		PlaySE_("SE_FLD_233");	// ���A�N�^�[��ײ�ށi���͌��ʕ\���j
		SetMotion_(monitor, MOT_GIMMICK_4, BLEND_M);		// ���j�^���_��
		
		WaitTask(task_cam);
	}
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	DeleteTask_(task_cam);
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	Wait_(30);
	
	OpenConnectiveWithMotion("connective_ace", player, reactor, reactor_L);
	
	if (bit_battery02) {
		//===============================================
		// ���G�[�X
		// �u�c�c�悵�B����ő��v���B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_104_MSG_040");
		KeyInputWait_();
		
		//-----------------------------------------------
		// ��
		// �u�悵�I�@���x�͐��䎺�ɖ߂�񂾂��B
		//-----------------------------------------------
		ShowMsg_("DEMO_104_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	}
	else {
		//===============================================
		// ���G�[�X
		// �u�I�b�P�[�����I
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_104_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	}
	
	CloseConnective();
	Wait_(30);
	
	SetMotion_(player, player_stand, BLEND_L);			//���A�N�^�[�G�遨�ҋ@
	
	EndDemo(FADE_COLOR_BLACK);
}
