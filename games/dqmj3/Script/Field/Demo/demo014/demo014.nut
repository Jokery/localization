//=============================================
//
//		demo014[�m�`�������̗���]
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
	local task_cam, task_player, task_nochoman;
	local msg_key00, msg_key01;

// ���t���O�ݒ�
	local bit_scout = GetEventFlg_("BFG_NOT_SUCCESS_SCOUT");		// BIT_1019 ����X�J�E�g���s�t���O

// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_nochoman = ReadNpc_("n043");		// �m�`������
	// �G�t�F�N�g
	LoadEffect_("ef712_01_emo_notice01")			// �C�t��01

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetDir_(player, 160);
	SetFace_(player, "Face_eyes_close");
	// �m�`���[��
	local nochoman = ArrangePointNpc_(model_nochoman, "npc_nochoman000");
	SetDir_(nochoman, -20);

// ����풓���[�V�����Ǎ�
	// ��l��
	local Player_look_down_L = ReadMotion_(player, "Player_look_down_L");	// �m�`���[��������
	// �m�`���[��
	local n000_feel_down = ReadMotion_(nochoman, "n000_feel_down");			// �ʏ��b����������
	local n000_feel_down_L = ReadMotion_(nochoman, "n000_feel_down_L");		// ��������LOOP
	local n000_think02_L = ReadMotion_(nochoman, "n000_think02_L");			// �l����i�r�g�݁jL
	local n000_arm_folde = ReadMotion_(nochoman, "n000_arm_folde");			// �l����i�r�g�݁j���r�g��
	local n000_arm_folde_L = ReadMotion_(nochoman, "n000_arm_folde_L");		// �r�g��L
	local n000_talk_joy_L = ReadMotion_(nochoman, "n000_talk_joy_L");		// �y����Ԃ悤�ȓ���
	local n001_scary_L = ReadMotion_(nochoman, "n001_scary_L");				// �L�肨�т���
	
// ���������[�V�����ݒ�
	SetMotion_(player, Player_look_down_L, BLEND_N);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	//��������������������������������������
	//���J�b�g1
	//��������������������������������������
	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(nochoman, MOT_TALK, BLEND_M);
	WaitMotion(nochoman);
	SetMotion_(nochoman, MOT_TALKLOOP, BLEND_M);
	
	// ������ɃX�J�E�g�����ꍇ
	if( bit_scout ) {
		msg_key00 = "DEMO_014_MSG_010";		// �u�������@�݂̂��݂� ������������I
		msg_key01 = "DEMO_014_MSG_020";		// �u�������c�c�I�C���@�Ƃ�ł��Ȃ���ނ�
	}
	// ����X�J�E�g�����ꍇ
	else {
		msg_key00 = "DEMO_014_MSG_030";		// �u����������I�@�܂����@�����Ȃ��Ă�
		msg_key01 = "DEMO_014_MSG_040";		// �u����́@�Ƃ�ł��Ȃ���ނ�
	}
	
	//===============================================
	// *�m�`���[��
	// ����P
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_(msg_key00);
	KeyInputWait_();
	
	SetMotion_(nochoman, n000_think02_L, BLEND_L);		// �l����i�r�g�݁jL
	//-----------------------------------------------
	// ��
	// ����Q
	//-----------------------------------------------
	ShowMsg_(msg_key01);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	Wait_(10);
	
	//��������������������������������������
	//���J�b�g�Q
	//��������������������������������������
	SetVisible(player, false);									//��l����\��
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	
	SetMotion_(nochoman, n000_arm_folde, BLEND_M);		// �l����i�r�g�݁j���r�g��
	WaitMotion(nochoman);
	SetMotion_(nochoman, n000_arm_folde_L, BLEND_M);	// �r�g��L
	
	//===============================================
	// *�m�`���[��
	// �u�I�C�������m�`���[���Ɂ@���̃`�J�����@�݂��Ă͂���Ȃ�������H
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_014_MSG_050");
	KeyInputWait_();

	//-----------------------------------------------
	//�u�I�C�������́@��̋@�B����������Ȃ���
	//�@���a�ɕ�炵�Ă����@�푰����������B
	//-----------------------------------------------
	ShowMsg_("DEMO_014_MSG_060");
	KeyInputWait_();
	
	SetMotion_(nochoman, n000_feel_down, BLEND_M);									// ��������
	task_nochoman = Task_ChangeMotion_(nochoman, n000_feel_down_L, BLEND_M);		// ��������LOOP
	
	//-----------------------------------------------
	//�u�Ȃ̂Ɂ@��H���{�[�V���b�N���Ė�����
	//�@�I�C�������́@�E�b�h�p�[�N�ɗ��āc�c
	//-----------------------------------------------
	ShowMsg_("DEMO_014_MSG_070");
	KeyInputWait_();

	//-----------------------------------------------
	//�u�I�C���������@�������
	//�@�����̗v�ǂɁ@�����߂��񂾂���B
	//-----------------------------------------------
	ShowMsg_("DEMO_014_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//===============================================
	
	WaitTask(task_cam);
	SetVisible(player, true);									//��l����\��

	//��������������������������������������
	//���J�b�g�R
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	//*�m�`������
	//�u�Ȃ�Ƃ��@�I�C���́@�����炪��
	//�@�����邱�Ƃ��@�ł��������傪�c�c
	OpenMsgWnd_();
	ShowMsg_("DEMO_014_MSG_090");
	KeyInputWait_();
	
	//�u�܂��@�I�C���̒��Ԃ�����
	//�@���炢�̗v�ǂɁ@�߂܂��Ă�񂾂�����B
	ShowMsg_("DEMO_014_MSG_100");
	KeyInputWait_();

	MotionTalk(nochoman);
	
	//-----------------------------------------------
	// ��
	// �u�I�C���݂�Ȃ������Ă�肽������
	//-----------------------------------------------
	ShowMsg_("DEMO_014_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g�S
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
		
	//===============================================
	// *�m�`���[��
	// �u�����炻�̂��߂ɂ��O�̗͂�
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_014_MSG_120");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u���̋C�ɂȂ�����@���̐�ɂ���
	//-----------------------------------------------
	ShowMsg_("DEMO_014_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(player, "player001");
	SetPointPos_(nochoman, "npc_nochoman001");
	
	SetMotion_(nochoman, MOT_WALK, BLEND_L);

	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g�T
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	task_nochoman = Task_RotateToPos_(nochoman, Vec3(550, 0, -621.0), 11.5);
	WaitTask(task_nochoman);
	DeleteTask_(task_nochoman);

	task_nochoman = Task_AnimeMove_(nochoman, "anm_nochoman001");

	Wait_(20);
	
	DeleteTask_(task_nochoman);
	
	task_nochoman = Task_RotateToPos_(nochoman, GetPos_(player), 11.5);
	WaitTask(task_nochoman);
	DeleteTask_(task_nochoman);
	
	SetMotion_(nochoman, n000_talk_joy_L, BLEND_L);		// ���
	
	//===============================================
	// *�m�`���[��
	// �u�҂��Ă������`
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_014_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(nochoman, MOT_WALK, BLEND_L);
	
	task_nochoman = Task_RotateToPos_(nochoman, Vec3(550, 0, -621.0), 11.5);
	WaitTask(task_nochoman);
	DeleteTask_(task_nochoman);
	
	task_nochoman = Task_MoveForward_(nochoman, 1.2, false);
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g�U
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	Wait_(90);
	
	EndDemo(FADE_COLOR_BLACK);
}