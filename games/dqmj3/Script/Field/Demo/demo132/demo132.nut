//=============================================
//
//		demo132[�`���[�}�b�n�Ƃ̍ĉ�]
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
	local task_cam, task_player, task_hunter;
	local efc_hunter;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_hunter = ReadNpc_("n006");			// �`���[�}�b�n
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �`���[�}�b�n
	local hunter = ArrangePointNpc_(model_hunter, "npc_hunter000");

// ����풓���[�V�����Ǎ�
	local hunter_run_L = ReadMotion_(hunter, "n001_run_L");					// ����L
	local hunter_talk_joy_L = ReadMotion_(hunter, "n000_talk_joy_L");		// ��b�i���������jL
	local hunter_hand_up = ReadMotion_(hunter, "n002_hand_up");
	local hunter_hand_up_L = ReadMotion_(hunter, "n002_hand_up_L");


	//��������������������������������������
	//���J�b�g1
	//��������������������������������������

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 60F

	task_player = Task_AnimeMoveSetMotion_(player, "anm_player000", MOT_WALK, MOT_WAIT);	// 60F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_player);
	Wait_(60);
	SetPointPos_(player, "player001");
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g2
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(15);
	efc_hunter = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", hunter, ATTACH_EFFECT1, Vec3(-2.0, -1.9, 0.0));
	PlaySE_("SE_DEM_053");
	Wait_(30);
	task_hunter = Task_AnimeMoveSetMotion_(hunter, "anm_hunter000", hunter_run_L, hunter_talk_joy_L);	// 25F
	WaitTask(task_hunter);

	//===============================================
	// ���`���[�}�b�n
	//�u�������@<name_player/>�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_132_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);


	//��������������������������������������
	//���J�b�g3
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	//===============================================
	// ���`���[�}�b�n
	//�u�������Ł@�O���[�g���C�_�[�Y�J�b�v���Ă���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_132_MSG_020");
	KeyInputWait_();
	//===============================================
	// ���`���[�}�b�n
	//�u�O���[�g���C�_�[�Y�J�b�v�ł́@�����X�^�[��
	//-----------------------------------------------
	ShowMsg_("DEMO_132_MSG_030");
	KeyInputWait_();
	//===============================================
	// ���`���[�}�b�n
	//�u���킵�������́@���ƂŃI�C���̂Ƃ����
	//-----------------------------------------------
	ShowMsg_("DEMO_132_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);


	//��������������������������������������
	//���J�b�g4
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	//===============================================
	// ���`���[�}�b�n
	//�u���ꂶ��@�҂��Ă������[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_132_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(hunter, hunter_hand_up, BLEND_M);
	WaitMotion(hunter);
	SetMotion_(hunter, hunter_hand_up_L, BLEND_M);
	Wait_(20);
	SetMotion_(hunter, MOT_WALK, BLEND_M);
	task_hunter = Task_RotateToDir_(hunter, 180, 8.55);
	WaitTask(task_hunter);
	task_hunter = Task_MoveForward_(hunter, 0.8, true);
	SetMotion_(hunter, hunter_run_L, BLEND_M);
	Wait_(80);

	EndDemo(FADE_COLOR_BLACK);
}
