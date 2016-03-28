//=============================================
//
//		demo423[�A���Z�X�̍Ō�_1]
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
	local task_cam, task_player;
	local efc_player;
	local rete_on1 = [0.3, 0.6, 0.4, 0.3, 0.5, 0.3, 0.6, 0.4, 0.3, 0.5, 0.4, 0.3, 0.7];
	local rete_on2 = [1, 1, 15, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1];
	local rete_off1 = [0.35, 0.6, 0.5, 0.4, 0.6, 0.4, 0.5, 0.4, 0.6, 0.35, 0.4, 0.35, 0.0];
	local rete_off2 = [1, 1, 15, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1];
	local flg00 = true;
	local efc_holography,efc_holography2;

	//=====================================
	//�v���C���[�ݒu
	//=====================================
	//ID�̎擾
	local player = GetPlayerId_();
	//�ݒu
	SetPointPos_(player, "player");
	SetMotion_(player, MOT_WAIT, BLEND_L);
	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(player, true);
	//�����̃��l
	SetAlpha_(player, 1.0);

	//=====================================
	//NPC�ݒu
	//=====================================
	//���\�[�X�̓ǂݍ���
	local npc_rena		 = ReadNpc_("n034");													// ���i�[�e
	local npc_rukiya	 = ReadNpc_("n035");													// ���L��
	//�ݒu
	local rena			 = ArrangePointNpc_(npc_rena,	 "rena");
	local rukiya		 = ArrangePointNpc_(npc_rukiya,	 "rukiya");

	//���l�̎蓮�ݒ�
	SetManualCalcAlpha_(rena, true);
	SetManualCalcAlpha_(rukiya, true);

	//�����̃��l
	SetAlpha_(rena, ALPHA_CLEAR);
	SetAlpha_(rukiya, ALPHA_CLEAR);

	SetMotion_(rena,	 MOT_WAIT, BLEND_M);									//���i�[�e�ҋ@
	SetMotion_(rukiya,	 MOT_WAIT, BLEND_M);									//���L���ҋ@

	//���i�[�e
	local r_sita = ReadMotion_(rena, "n007_look_down_L");				// ���i�[�e�@���ނ��ҋ@

	SetMotion_(rena, r_sita, BLEND_L);

	local model_main_screen = ReadGimmick_("o_S02_23");

	local main_screen = ArrangePointGimmick_("o_S02_23", model_main_screen, "monita");
	SetVisible(main_screen, false);
	//=====================================
	//�G�t�F�N�g�̓ǂݍ���
	//=====================================
	
	LoadEffect_("ef732_14_holography01");											// �z���O�����\���@�풓
	LoadEffect_("ef732_15_holography01");											// �z���O�����\���@�o��
	LoadEffect_("ef732_16_holography01");											// �z���O�����\���@����
	LoadEffect_("ef712_10_emo_surprise01");											//�u�I�v�G�t�F�N�g
	LoadEffect_("ef732_18_r_holography01");											// ���L���p�풓�G�t�F�N�g

// ���J�����ݒ�
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	
	Wait_(20);
	PlaySE_("SE_FLD_135");																			// ���A�N�^�[������
	Wait_(10);

	//===============================================
	// �����L���̃��A�N�^�[
	// �u���A�N�^�[�ւ́@�A�N�Z�X���m�F�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA_REACTOR");
	ShowMsg_("DEMO_423_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetAlpha_(main_screen, 0);
	SetVisible(main_screen, true);
	Wait_(3);
	PlaySE_("SE_DEM_055");
	SetAlpha_(main_screen, 0.5);
	Wait_(3);
	SetAlpha_(main_screen, 1);
	Wait_(60);

	SetPointCameraEye_("002_cameye");
	SetPointCameraTarget_("002_camtgt");
	
	PlaySE_("SE_DEM_047");																			//���i�[�e�����

	efc_holography = SetBoneEffect_("ef732_15_holography01", rena);
	for (local i = 0; i< rete_off1.len(); i ++){													//���i�[�e�_��
		SetAlpha_(rena, rete_on1[i]);
		Wait_(rete_on2[i]);
	}
	SetAlpha_(rena, 1);																			//���i�[�e���l
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_14_holography01", rena);

	Wait_(15);
	
	//===============================================
	// *���i�[�e
	// �u���S�̑�č��́@�}�U�[�̉��l�ł���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_423_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SurpriseDisp(player);
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(rena), 10.0);
	SetMotion_(player, MOT_WALK, BLEND_M);
	WaitTask(task_kaiwa);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(30);
	SetVisible(player,			 false);							//��\���ɂ���
	SetPointCameraEye_("003_cameye");
	SetPointCameraTarget_("003_camtgt");
	
	SetMotion_(rena, MOT_TALK, BLEND_L);

	//===============================================
	// *���i�[�e
	// �u�������Ɂ@���u�ł���ꏊ�ł͂Ȃ��c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_423_MSG_030");
	WaitMotion(rena);
	SetMotion_(rena, MOT_TALKLOOP, BLEND_L);
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *���i�[�e
	// ���u�l�������āB����l���̖��O����
	//-----------------------------------------------
	ShowMsg_("DEMO_423_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	local task = Task_RotateToDir_(player, 0, 410);	// 100�x�܂ŁA1�t���[��1�x����]

	SetMotion_(rena, MOT_WAIT, BLEND_M);
	
	task_player	 = Task_AnimeMove_(rukiya, "rukiya_anm");
	task_cam	 = Task_AnimeMoveCamera_("004_cameye", "004_camtgt");
	SetVisible(player, true);
	efc_holography2 = SetBoneEffect_("ef732_15_holography01", rukiya);
	for (local i = 0; i< rete_off1.len(); i ++){													//���L���_��
		SetAlpha_(rukiya, rete_on1[i]);
		Wait_(rete_on2[i]);
	}
	SetAlpha_(rukiya, 1);																			//���L�����l
	DeleteEffect_(efc_holography2);
	efc_holography2 = SetBoneEffect_("ef732_18_r_holography01", rukiya);

	Wait_(15);
	
	
	WaitTask(task_player);
	SetMotion_(rukiya, MOT_TALK, BLEND_M);
	//===============================================
	// �����L��
	// �u���񂽂́@�{���ɐS�z�����ˁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_423_MSG_050");
	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_M);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rukiya, MOT_WAIT, BLEND_M);

	SetMotion_(rena, MOT_TALK, BLEND_M);
	//===============================================
	// *���i�[�e
	// �u���Ȃ��̔\�͂��@�M���͂��Ă���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_423_MSG_060");
	WaitMotion(rena);
	SetMotion_(rena, MOT_TALKLOOP, BLEND_M);
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *���i�[�e
	// �u��΂Ɂ@����l���̖��O���́@��������B
	//-----------------------------------------------
	ShowMsg_("DEMO_423_MSG_070");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *���i�[�e
	// �u������c�c������Ȃ��Ń��L���B
	//-----------------------------------------------
	ShowMsg_("DEMO_423_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, r_sita, BLEND_XL);
	Wait_(60);
	
	PlaySE_("SE_DEM_048");															//���i�[�e������

	SetVisible(rena, false);
	SetVisible(rukiya, false);
	local efc_rena		 = SetBoneEffect_("ef732_16_holography01", rena);
	local efc_rukiya	 = SetBoneEffect_("ef732_16_holography01", rukiya);
	DeleteEffect_(efc_holography);
	DeleteEffect_(efc_holography2);

	WaitTask(task_cam);
	Wait_(60);
		
	SetVisible(player, false);
	task_cam	 = Task_AnimeMoveCamera_("005_anmeye", "005_anmtgt");
	WaitTask(task_cam);
	
	PlaySE_("SE_DEM_049");															//���j�^�[�Ƀm�C�Y������

	SetMotion_(main_screen, MOT_GIMMICK_1, BLEND_N);	
	Wait_(60);
	
	EndDemo(FADE_COLOR_WHITE);
}
