//=============================================
//
//		demo130[���̖��͔z�����u]
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
	local task_cam, task_player, task_ace;
	local efc_ace;

// ���t���O�ݒ�
	local bit_check_mix = GetEventFlg_("BFG_REACTER_POINT_021");		// Bit_1520 �z�����u�𒲂ׂ���

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_mixture = ReadGimmick_("o_A01_02");	// �z�����u
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_ace = ReadNpc_("n002");				// �G�[�X
	// �G�t�F�N�g
	LoadEffect_("ef712_01_emo_notice01");			// �C�Â�

// ���z�u
	// �z�����u
	local mixture = ArrangePointGimmick_("o_A01_02", model_mixture, "obj_mixture000");
	// ��l��
	SetPointPos_(player, "player000");
	// �G�[�X
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_nod = ReadMotion_(player, "Player_nod");				// �ҋ@�����ȂÂ����ҋ@
	local player_surprise = ReadMotion_(player, "Player_surprise");		// �ʏ�ҋ@������
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");	// ����L
	// �G�[�X
	local ace_operate_L = ReadMotion_(ace, "n002_operate_L");			// ���삷��L
	local ace_talk_joy_L = ReadMotion_(ace, "n002_talk_joy_L");			// ��b�@��������
	local ace_jump = ReadMotion_(ace, "n002_jump");						// �W�����v���ҋ@
	local ace_hand_up = ReadMotion_(ace, "n002_hand_up");				// ��b�����������
	local ace_hand_up_L = ReadMotion_(ace, "n002_hand_up_L");			// �����������L
	local ace_feel_down = ReadMotion_(ace, "n000_feel_down");			// ��������
	local ace_feel_down_L = ReadMotion_(ace, "n000_feel_down_L");		// ��������L
	local ace_impatience_L = ReadMotion_(ace, "n002_impatience_L");		// �ł�L

// ���������[�V�����ݒ�
	SetMotion_(mixture, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetMotion_(ace, ace_operate_L, BLEND_N);							// ���쒆

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 60F
	
	task_player = Task_MoveForward_(player, 1.0, false);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P����l���J�b�g�C���`�`�`�`�`�`�`�`�`�`�`�`�`
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	SetDirToObject_(player, ace);
	DeleteTask_(task_player);
	
	// ���J�b�g�Q����l���ƃG�[�X�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//===============================================
	// ���G�[�X
	// �u�ӂނӂށc�c�Ȃ�قǂȂ�قǁc�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_130_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ace, ace_jump, BLEND_N);		// �W�����v���ҋ@
	task_ace = Task_RotateToPos_(ace, GetPos_(player), 22.9);
	WaitTask(task_ace);
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	DeleteTask_(task_ace);
	
	//===============================================
	// ���G�[�X
	// �u���Ă��Ƃ͂��c�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_130_MSG_020");
	
	SetMotion_(player, player_surprise, BLEND_M);				// �ҋ@������
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);				// ����LOOP
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ace, MOT_TALKLOOP, BLEND_N);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetAlpha_(player, ALPHA_CLEAR);
	
	// ���J�b�g�R���G�[�X�Y�[���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
		
	//===============================================
	// ���G�[�X
	// �u��낱�ׁ@<name_player/>�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_130_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�S���z�����u�o�`�m�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// 120F
	
	// �y���A�N�^�[�Ŕz�����u�𒲂ׂĂ���ꍇ�z
	if(bit_check_mix)
	{
		//===============================================
		// ���G�[�X
		// �u�����́@�����X�^�[�}�X�^�[���@�g���Ă���
		// �i�y�[�W����Ȃ��j
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_130_MSG_040");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	}
	// �y���A�N�^�[�Ŕz�����u�𒲂ׂĂ��Ȃ��ꍇ�z
	else
	{
		//===============================================
		// ���G�[�X
		// �u�����́@�����X�^�[�}�X�^�[���@�g���Ă���
		// �i�y�[�W���肠��j
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_130_MSG_080");
		KeyInputWait_();
		
		//-----------------------------------------------
		// ��
		// �u���̑��u�́@�����Ɩ������@�z������
		//-----------------------------------------------
		ShowMsg_("DEMO_130_MSG_090");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		SetMotion_(ace, ace_talk_joy_L, BLEND_N);			// ��b�@��������
	}
	
	
	DeleteTask_(task_cam);
	
	// ���J�b�g�T���G�[�X�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	// �y���A�N�^�[�Ŕz�����u�𒲂ׂĂ���ꍇ�z
	if(bit_check_mix)
	{
		efc_ace = SetSelectBoneEffect_("ef712_01_emo_notice01", ace, ATTACH_EFFECT1);	// �C�Â�
		SetMotion_(ace, ace_impatience_L, BLEND_XL);		// �ł�L
		Wait_(20);
		
		//===============================================
		// ���G�[�X
		// �u�����@�m���Ă����āH
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_130_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		SetMotion_(ace, ace_feel_down, BLEND_M);		// ��������
		WaitMotion(ace);
		SetMotion_(ace, ace_feel_down_L, BLEND_M);		// ��������L
		
		//===============================================
		// ���G�[�X
		// �u���@�������c�c�m���Ă����c�c�B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_130_MSG_060");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		Wait_(10);
		SetMotion_(ace, MOT_TALKLOOP, BLEND_XL);
		Wait_(10);
		
		//===============================================
		// ���G�[�X
		// �u�c�c�Ƃ��������B
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_130_MSG_070");
		KeyInputWait_();
	}
	// �y���A�N�^�[�Ŕz�����u�𒲂ׂĂ��Ȃ��ꍇ�z
	else
	{
		//===============================================
		// ���G�[�X
		// �u���܂��g���΁@�I���[�̒��Ԃ�
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_130_MSG_100");
		KeyInputWait_();
		
		SetMotion_(ace, ace_hand_up, BLEND_M);						// ��b�����������
		WaitMotion(ace);
		SetMotion_(ace, ace_hand_up_L, BLEND_M);					// �����������L
	}
	
	//-----------------------------------------------
	// ��
	// �u���������@�������Ă݂悤���B
	//-----------------------------------------------
	ShowMsg_("DEMO_130_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetAlpha_(player, ALPHA_EXIST);
	SetMotion_(ace, MOT_TALKLOOP, BLEND_N);
	
	// ���J�b�g�U����l���ƃG�[�X�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");			// 200F
	
	//===============================================
	// ���G�[�X
	// �u�I���[�́@���̊ԂɁ@�L���O����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_130_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	Wait_(10);
	
	SetMotion_(player, player_nod, BLEND_L);		// �ҋ@�����ȂÂ����ҋ@
	Wait_(30);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	EndDemo(FADE_COLOR_BLACK);
}
