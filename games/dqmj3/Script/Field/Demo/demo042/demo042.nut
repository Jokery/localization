//=============================================
//
//		demo042[�G�[�X�ɂ�郊�A�N�^�[�C��]
//
//=============================================

function Update()
{

// ���ϐ���`
	local task_cam, task_player;
	local efc_player;
	local pos_player = Vec3(31.73264, 0.0, -111.72417);
	
// �����\�[�X�Ǎ�
	local player = GetPlayerId_();
	local model_ace = ReadNpc_("n002");			// �G�[�X
	
	LoadEffect_("ef712_10_emo_surprise01");		// �u�I�v
	LoadEffect_("ef732_09_light_reactor_c");	// ���A�N�^�[����
	
// ���z�u
	SetPointPos_(player, "player000");
	
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	SetDir_(ace, 20);
	
// ����풓���[�V�����Ǎ�
	local Player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");		// ��l����������������遨���A�N�^�[��G��
	local Player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// ��l�����A�N�^�[��G��L
	local Player_nod = ReadMotion_(player, "Player_nod");							// �ҋ@�����ȂÂ����ҋ@
	
	local n000_think = ReadMotion_(ace, "n000_think");
	local n000_think_L = ReadMotion_(ace, "n000_think_L");
	local n002_think_L = ReadMotion_(ace, "n002_think_L");
	local n002_arm_folde = ReadMotion_(ace, "n002_arm_folde");
	local n002_arm_folde_L = ReadMotion_(ace, "n002_arm_folde_L");
	local n002_talk_joy_L = ReadMotion_(ace, "n002_talk_joy_L");
	local n002_hand_up = ReadMotion_(ace, "n002_hand_up");
	local n002_hand_up_L = ReadMotion_(ace, "n002_hand_up_L");

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(ace, n002_hand_up, BLEND_L);
	WaitMotion(ace);
	SetMotion_(ace, n002_hand_up_L, BLEND_L);
	
	//=====================================
	//��b�J�n
	//=====================================
	OpenMsgWnd_();
	//�u����I�@�҂��Ă����I
	//�@�I���̖��́@�G�[�X�I�@��낵�������I
	ShowMsg_("DEMO_042_MSG_010");
	KeyInputWait_();
	
	SetMotion_(ace, MOT_TALK, BLEND_L);
	
	SetTalkName_("NAME_TAG_ACE");
	//�u�b�́@�������Ă����B�L���O�~�o�̂���
	//�@�I���[�́@���炢�̗v�ǂց@�s���񂾂�H
	ShowMsg_("DEMO_042_MSG_020");
	
	Wait_(18);
	
	SetMotion_(ace, MOT_TALKLOOP, BLEND_L);
	
	KeyInputWait_();
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotion_(ace, n002_hand_up, BLEND_L);
	WaitMotion(ace);
	SetMotion_(ace, n002_hand_up_L, BLEND_L);
	//�u�����������ƂȂ�@�I���[�̃��A�N�^�[��
	//�@�I���ƒʐM�ł���悤�Ɂ@���Ă�邺�B
	ShowMsg_("DEMO_042_MSG_030");
	KeyInputWait_();
	//�u�I���́@��������@�ʐM�Ł@�I���[��
	//�@�T�|�[�g����B�����@������n���񂾂��B
	ShowMsg_("DEMO_042_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(ace, MOT_WAIT, BLEND_L);
	
	//=====================================
	//�t�F�[�h�A�E�g
	//=====================================
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	PlaySE_("SE_DEM_012");					//��SE�F�G�[�X�̃��A�N�^�[������

	Wait_(100);
	DeleteTask_(task_cam);
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	//=====================================
	//�t�F�[�h�C��
	//=====================================
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();

	SetMotion_(player, Player_touch_reactor, BLEND_L);
	SetFace_(player, "Face_left");
	SetMotion_(ace, n002_think_L, BLEND_M);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	//�u����Ł@�I���[�Ɓ@�ʐM�ł���͂��B
	//�@������Ɓ@�e�X�g���Ă݂悤���I
	ShowMsg_("DEMO_042_MSG_050");
	
	WaitMotion(player);
	SetMotion_(player, Player_touch_reactor_L, BLEND_M);
	
	KeyInputWait_();
	CloseMsgWnd_();

	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// ���A�N�^�[����
	PlaySE_("SE_DEM_019");																	// ��SE�F�R�l�N�e�B�u��M	
	Wait_(45);

	OpenConnective("connective_ace");
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		//�u��[���悵�B�����Ɓ@�ʐM�ł��Ă�ȁI
		//�@�������́@�I���I�@�����d�����邺�I
		ShowMsg_("DEMO_042_MSG_060");
		KeyInputWait_();
		CloseMsgWnd_();
	CloseConnective();
	
	Wait_(60);
	
	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	Wait_(10);
	
	SetMotion_(ace, n002_arm_folde, BLEND_L);
	WaitMotion(ace);
	SetMotion_(ace, n002_arm_folde_L, BLEND_L);
	
	OpenMsgWnd_();
	//�u��������@�X�e���X�{�b�N�X�Z���T�[��
	//�@���Ă���Ł@�ꏏ�Ɂ@�����Ă���������ȁB
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_042_MSG_070");
	KeyInputWait_();
	//�u�����Ȃ��󔠂��@�߂��ɂ�������
	//�@���A�N�^�[���@��������͂������B
	ShowMsg_("DEMO_042_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(10);
	
	//��������������������������������������
	//���J�b�g5
	//��������������������������������������
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	Wait_(10);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	SetMotion_(ace, n002_talk_joy_L, BLEND_L);
	
	// �u���ꂶ��@�W���b�N�̂Ƃ���Ɂ@�s���Ă���B
	//�@�����Ȃ�@��̑O�Ł@�I���[��҂��Ă邺�I
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_042_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	SetFace_(player, "Face_default");		
	SetMotion_(player, Player_nod, BLEND_L);		// �ҋ@�����ȂÂ����ҋ@
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	

	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
}