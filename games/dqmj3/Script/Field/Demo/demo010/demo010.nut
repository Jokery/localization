//=============================================
//
//		demo010[�`���[�g���A���퓬���̂Q�J�n�O]
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
	local task_cam;
	local efc_player;

// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_nochoman = ReadNpc_("n043");		// �m�`������
	// �G�t�F�N�g
	LoadEffect_("ef742_01_div_mag_hoimi");			// �񕜃G�t�F�N�g
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetDir_(player, 160);
	// �m�`���[��
	local nochoman = ArrangePointNpc_(model_nochoman, "npc_nochoman000");
	SetDir_(nochoman, -20);
	//�\��̐ݒ�
	SetFace_(player, "Face_eyes_close");
	
// ����풓���[�V�����Ǎ�
	// �m�`���[��
	local n000_think_L = ReadMotion_(nochoman, "n000_think_L");			//�l����i�E�����jL
	local n000_talk_joy_L = ReadMotion_(nochoman, "n000_talk_joy_L");	//��b�i���������jL
	local n000_think02_L = ReadMotion_(nochoman, "n000_think02_L");		//��b�i���������jL
	local n002_hand_up = ReadMotion_(nochoman, "n002_hand_up");			//��b�����������i�G�[�X�̃��[�V�����̗��p�j
	local n002_hand_up_L = ReadMotion_(nochoman, "n002_hand_up_L");		//���������L�i�G�[�X�̃��[�V�����̗��p�j

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetMotion_(nochoman, n000_talk_joy_L, BLEND_N);		// �m�`���[���@��낱��	
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// *�m�`���[��
	// �u�ӂ������`�I�@������������I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_010_MSG_010");
	KeyInputWait_();
	SetMotion_(nochoman, n000_think_L, BLEND_L);		// �m�`���[���@�l���Ă���
	
	//-----------------------------------------------
	// ��
	// �u�ł��@�����X�^�[�}�X�^�[�̃`�J�����Ă̂�
	//-----------------------------------------------
	ShowMsg_("DEMO_010_MSG_020");
	KeyInputWait_();
	
	SetMotion_(nochoman, MOT_TALKLOOP, BLEND_M);
	//-----------------------------------------------
	// ��
	// �u�o������������@�X�J�E�g����
	//-----------------------------------------------
	ShowMsg_("DEMO_010_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();

	Wait_(10);
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	DeleteTask_(task_cam);

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetMotion_(nochoman, n000_think02_L, BLEND_L);

	Wait_(10);

	//-----------------------------------------------
	// ��
	// �u�������@�퓬���Ɂ@�X�J�E�g��I���
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_010_MSG_040");
	KeyInputWait_();
	
	SetMotion_(nochoman, MOT_TALKLOOP, BLEND_M);
	//-----------------------------------------------
	// ��
	// �u��������Ɓ@���Ԃ��@�������̋�����
	//-----------------------------------------------
	ShowMsg_("DEMO_010_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();

	Wait_(10);

	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	DeleteTask_(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	SetMotion_(nochoman, n000_talk_joy_L, BLEND_M);		// �m�`���[���@�y�������ɉ�b
	
	//-----------------------------------------------
	// ��
	// �u���肪�������@�݂Ƃ߂�΃X�J�E�g�����B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_010_MSG_060");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u���܂������Ȃ��Ł@�����{�点���������
	//-----------------------------------------------
	ShowMsg_("DEMO_010_MSG_070");
	KeyInputWait_();
	
	SetMotion_(nochoman, n002_hand_up, BLEND_M);
	WaitMotion(nochoman);
	SetMotion_(nochoman, n002_hand_up_L, BLEND_M);
	//-----------------------------------------------
	// ��
	// �u�Ƃ������@���C�悭�@���̂��厖������I
	//-----------------------------------------------
	ShowMsg_("DEMO_010_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
		
	SetMotion_(nochoman, MOT_WAIT, BLEND_L);			// �m�`���[���@�ҋ@�ɖ߂�
	
	Wait_(20);
	
	//===============================================
	//�V�X�e�����b�Z�[�W�u�S�񕜂���
	//-----------------------------------------------	
	PlaySE_("SE_SHA_003");								//��SE
	efc_player = SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);		// �񕜃G�t�F�N�g

	OpenMsgWnd_();
	ShowMsg_("DEMO_010_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}