//=============================================
//
//		demo415[���j���̐���_3]
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
	local task_cam, task_player, task_rukiya;
	local efc_player, efc_anger, efc_rukiya;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();			// ��l��
	local n_rukiya = ReadNpc_("n009");		//���L��

// ���z�u
	// ��l��
	SetPointPos_(player, "player");
	
	// ���L��
	local rukiya = ArrangePointNpc_(n_rukiya, "rukiya");

// ����풓���[�V�����Ǎ�
	local r_unn = ReadMotion_(rukiya, "n009_look_down_L");							// ���L�� ��������
	local p_unn = ReadMotion_(player, "Player_nod");								// ��l�� ����
	
	local task_kaiwa = Task_WalkAroundToPos(rukiya, GetPos_(player), 100.0);		// ��l���̕�������
	local task_kaiwa = Task_WalkAroundToPos(player, GetPos_(rukiya), 100.0);		// ��l���̕�������
	WaitTask(task_kaiwa);
	SetMotion_(player, MOT_WAIT, 1);
// ���G�t�F�N�g�ǂݍ���
	LoadEffect_("ef733_01_sym_shuchusen01");												// �W����

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");

	DeleteTask_(task_cam);	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetMotion_(rukiya, r_unn, 1);

	StartDemo(FADE_COLOR_BLACK);
	Wait_(30);

	SetMotion_(rukiya, MOT_WAIT, BLEND_L);
	Wait_(30);
	//===============================================
	// �����L��
	// �u���́@���傢�Ɨ򐨂����ǁ@������߂ĂȂ���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_415_MSG_010");
	Wait_(10);
	KeyInputWait_();
	//===============================================
	
	SetMotion_(rukiya, MOT_TALK, BLEND_M);
	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");
	SetFace_(rukiya, "Face_anger");
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_player = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);					// �W�����\��
	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_M);
	//===============================================
	// �����L��
	// �u�����I�@�܂��́@���̊č��ɂ���
	//-----------------------------------------------
	ShowMsg_("DEMO_415_MSG_020");
	Wait_(15);
	DeleteEffect_(efc_player);
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// �����L��
	// �u�u���C�N�����X�^�[�𐶂ݏo��
	//-----------------------------------------------
	ShowMsg_("DEMO_415_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointCameraEye_("002_cameye");
	SetPointCameraTarget_("002_camtgt");
	
	SetFace_(rukiya, "Face_default");
	//===============================================
	// �����L��
	// �u���j�̏����́@������������Ă�����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_415_MSG_040");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// �����L��
	// �u�ނ�́@���̐��E�ɏZ�ޒ��Ԃ�����ˁB
	//-----------------------------------------------
	ShowMsg_("DEMO_415_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rukiya, MOT_WAIT, BLEND_L);
	
	SetMotion_(player, p_unn, BLEND_XL)
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_XL)
		Wait_(30);
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");
	
	SetMotion_(rukiya, MOT_TALK, BLEND_M);
	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_M);

	//===============================================
	// �����L��
	//�u�S�ɂ́@�J�M���@�������Ă��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_415_MSG_060");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// �����L��
	// �u�낤��̃J�M�Ȃ�@���̐�ɂ���
	//-----------------------------------------------
	ShowMsg_("DEMO_415_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rukiya, MOT_WAIT, BLEND_L);
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
