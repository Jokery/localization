//=============================================
//
//		demo615[���i�[�e�̍���_1(�c�[)]
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
	local task_cam, task_player, task_rena;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();											// ��l��
	local model_rena = ReadNpc_("n007");									// ���i�[�e

	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");									// �u�I�v

// ���z�u
	SetPointPos_(player, "player000");										// ��l��
	SetStepSe_(player, SILENT_STEP_SE);	// �����𖳉��ɂ���
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");			// ���i�[�e

// ����풓���[�V�����Ǎ�
	//��l��
	local player_sleep2_L = ReadMotion_(player, "Player_sleep2_L");			// �Q��
	local player_sleep2_awake = ReadMotion_(player, "Player_sleep2_awake");	// �Q�遨�㔼�g���N����
	local player_one_knee = ReadMotion_(player, "Player_one_knee");			// �㔼�g���N���������G
	local player_up01_L = ReadMotion_(player, "Player_up01_L");				// �㔼�g���N����L
	local player_turn_L = ReadMotion_(player, "Player_turn_L");				// �U��Ԃ�
	local player_nod = ReadMotion_(player, "Player_nod");					// ���ȂÂ�
	local player_surprise = ReadMotion_(player, "Player_surprise");			// ����
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");		// ����L

	//���i�[�e
	local rena_sit = ReadMotion_(rena, "n007_sit_L");						// ���Ⴊ��
	local rena_stand = ReadMotion_(rena, "n007_stand01");					// ����
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");				// ���i�[�e������ҋ@
	local rena_talk = ReadMotion_(rena, "n007_talk01");						// ��b�J�n�i������ɂ��Ă�j
	local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");					// ��bL�i������ɂ��Ă�j
	local rena_look_down = ReadMotion_(rena, "n007_look_down_L");			// ���ނ��ҋ@

// ���������[�V����
	SetMotion_(player, player_sleep2_L, BLEND_N); 							// ��@�Q��
	SetFace_(player, "Face_loop_close");
	SetMotion_(rena, rena_sit, BLEND_N); 									// ���i�@���Ⴊ��

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//��������������������������������������
	//���J�b�g1 ��@�ڊo��
	//��������������������������������������

	Wait_(50);
	SetFace_(player, "Face_eyes_close");									// �ڃp�`
	Wait_(30);

	//===============================================
	// �����i�[�e
	// �u�C�������̂ˁ@<name_player/>�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);
	SetFace_(player, "Face_default");										// �ʏ�


	//��������������������������������������
	//���J�b�g2 ��@�N����
	//��������������������������������������

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetMotionSpeed_(player, 2);
	SetMotion_(player, player_sleep2_awake, BLEND_L);						// ��@�N���遨����
	Wait_(80);
	SetMotionSpeed_(player, 1.0);
	WaitMotion(player);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(20);
	SetMotion_(player, player_up01_L, BLEND_XL);
	Wait_(15);
	SetMotion_(player, player_one_knee, BLEND_XL);
	Wait_(10);

	SetMotion_(player, MOT_WAIT, BLEND_L);									// ��ҋ@
	Wait_(10);
	SetMotion_(rena, rena_stand, BLEND_XL);									// ���i����
	task_rena = Task_RotateToDir_(rena, 20, 3.0);							// ��]

	WaitMotion(rena);
	DeleteTask_(task_rena);
	SetMotion_(rena, MOT_WAIT, BLEND_M);									// ���i�ҋ@
	Wait_(30);
	SetMotion_(player, MOT_WALK, BLEND_M);									// ��@����
	task_player = Task_MoveForward_(player, 0.8, false);
	Wait_(10);
	PlaySE_("SE_FLD_015");													//��SE:����
	Wait_(15);

	//===============================================
	// �����i�[�e
	// �u�҂��āc�c�I�@���Ȃ��Ɂc�c
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_020");
	SetMotion_(rena, rena_look_down, BLEND_XL);								// ���i�@���ނ��ҋ@
	SetFace_(rena, "Face_loop_close");										// �ڕ�
	SetMotion_(player, MOT_WAIT, BLEND_L);									// ��@�ҋ@
	DeleteTask_(task_player);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(player, player_turn_L, BLEND_XL);							// ��@�U�����
	task_player = Task_RotateToDir_(player, 50, 3.0);						// ��]
	Wait_(15);
	DeleteTask_(task_player);

	SetFace_(rena, "Face_default");											// �ڊJ��
	SetMotion_(rena, MOT_WALK, BLEND_M);									// ���i����
	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_015", 15);
	task_rena = Task_MoveForward_(rena, 1.0, false);
	Wait_(18);
	DeleteTaskStepSe(rena, task_rena_step);
	SetMotion_(rena, MOT_WAIT, BLEND_L);									// ���i�ҋ@
	DeleteTask_(task_rena);
	Wait_(15);
	
	SetFace_(rena, "Face_eyes_close");	
	
	SetMotion_(rena, rena_talk, BLEND_L);									// ���i�b��
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);

	//===============================================
	// �����i�[�e
	// �u���Ȃ��Ɂ@�b���Ă��������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_XL);									// ���i�ҋ@
	Wait_(20);
	SetPointPos_(player, "player001");										// ��l���ړ�
	SetPointPos_(rena, "npc_renerte001");									// ���i�ړ�
	SetMotion_(player, MOT_WAIT, BLEND_N);									// ��@�ҋ@


	//��������������������������������������
	//���J�b�g3 ���i�̌��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	SetMotion_(player, MOT_WALK, BLEND_M);									// ��@��������
	task_player = Task_RotateToPos_(player, GetPos_(rena), 5.7);			// ��]
	Wait_(8);
	PlaySE_("SE_FLD_015");													//��SE:����
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);									// ��@�ҋ@
	Wait_(20);

	SetMotion_(rena, rena_talk, BLEND_L);									// ���i�b��
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);

	PlayBgm_("BGM_009");

	//===============================================
	// �����i�[�e
	// �u���Đl�Ԃ����ɂ�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_040");
	KeyInputWait_();
	//===============================================
	// �����i�[�e
	// �u���̐��ł́@�}�f�̌����c�c�}�f�����C�g��
	//-----------------------------------------------
	ShowMsg_("DEMO_615_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(10);


	//��������������������������������������
	//���J�b�g4 ���i�@�Y�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetMotion_(rena, rena_look_down, BLEND_XL);								// ���i�@���ނ��ҋ@

	//===============================================
	// �����i�[�e
	// �u�ł��@����Ƃ��c�c�傫�Ȑ푈�ɂ����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_060");
	KeyInputWait_();
	//===============================================
	// �����i�[�e
	// �u�����Ł@�l�Ԃ����́@�̋����̂�
	//-----------------------------------------------
	ShowMsg_("DEMO_615_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(10);
	SetPointPos_(rena, "npc_renerte001");									// ���i�ړ�


	//��������������������������������������
	//���J�b�g5 ��˃��i�փJ������荞��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_015", 12);
	SetMotion_(rena, MOT_WALK, BLEND_M);									// ���i����
	task_rena = Task_RotateToDir_(rena, -55, 5.7);	// ��]
	WaitTask(task_rena);
	task_rena = Task_MoveForward_(rena, 0.8, false);
	Wait_(20);
	SetMotion_(rena, MOT_WAIT, BLEND_L);									// ���i�ҋ@
	DeleteTaskStepSe(rena, task_rena_step);
	DeleteTask_(task_rena);
	Wait_(15);
	SetMotion_(player, MOT_WALK, BLEND_M);									// ��@��������
	task_player = Task_RotateToPos_(player, GetPos_(rena), 2.0);			// ��]
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);									// ��@�ҋ@
	Wait_(15);

	//===============================================
	// �����i�[�e
	// �u�����ǁc�c�v��́@���s�����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_080");
	KeyInputWait_();
	//===============================================

	SetMotion_(rena, rena_look_up_L, BLEND_XL);								// ���i��ҋ@
	Wait_(10);

	//===============================================
	// �����i�[�e
	// �u������鑕�u�ł���@�}�U�[��
	//-----------------------------------------------
	ShowMsg_("DEMO_615_MSG_090");
	KeyInputWait_();
	//===============================================
	// �����i�[�e
	// �u�K���r���X�c�c�J���}�b�\���m�̈��ӂ�
	//-----------------------------------------------
	ShowMsg_("DEMO_615_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	SetMotion_(rena, MOT_WALK, BLEND_M);									// ���i���]
	task_rena = Task_RotateToPos_(rena, GetPos_(player), 5.7);				// ��]
	WaitTask(task_rena);
	SetMotion_(rena, MOT_WAIT, BLEND_M);									// ���i�ҋ@
	Wait_(15);

	SetMotion_(rena, rena_talk, BLEND_L);									// ���i�b��
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);

	//===============================================
	// �����i�[�e
	// �u�ł��@�}�f�ɉ������ꂽ�}�U�[�́@�\������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_XL);									// ���i�ҋ@
	Wait_(30);
	SetPointPos_(rena, "npc_renerte001");									// ���i�ړ�
	SetFace_(rena, "Face_loop_close");										// �ڕ�
	SetMotionSpeed_(rena, 0.7);


	//��������������������������������������
	//���J�b�g6 ���i�@������PANUP
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	Wait_(80);
	SetMotion_(rena, rena_look_down, 20);									// ���i�@���ނ��ҋ@
	WaitTask(task_cam);
	Wait_(10);

	//===============================================
	// �����i�[�e
	// �u�����c�c���������@�}�U�[���򉻂��邽��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_120");
	SetFace_(rena, "Face_default");											// �ڊJ��
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	SetMotionSpeed_(rena, 1.0);
	SetVisible(rena, false);
	SetDirToObject_(player, rena);	// player = -125��

	//��������������������������������������
	//���J�b�g7 ��l��UP
	//��������������������������������������

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetMotion_(player, player_surprise, BLEND_M);		// ��@����
	Wait_(2);
	SurpriseDispSetOffset(player, Vec3(1.0, 1.0, 0.0), 0.55);
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);		// ��@����L
	Wait_(45);

	SetVisible(rena, true);
	SetMotion_(player, MOT_WAIT, BLEND_L);

	//��������������������������������������
	//���J�b�g8 ��]�J�����������
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	SetMotion_(rena, rena_talk, BLEND_XL);									// ���i�b��
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);	

	//===============================================
	// �����i�[�e
	// �u�K���r���X�́@���@�}�U�[�̃`�J����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_130");
	KeyInputWait_();
	//===============================================
	// �����i�[�e
	// �u�����Ȃ����Ƃ��@�����@�ǂ��Ȃ邩�킩��Ȃ��B
	//-----------------------------------------------
	ShowMsg_("DEMO_615_MSG_140");
	KeyInputWait_();
	//===============================================

	SetMotion_(rena, rena_look_down, BLEND_XL);								// ���i�@���ނ��ҋ@

	//===============================================
	// �����i�[�e
	// �u����������΁@�}�U�[���򉻂����i�͂Ȃ��Ȃ�
	//-----------------------------------------------
	ShowMsg_("DEMO_615_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);


	//��������������������������������������
	//���J�b�g9 ��@�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	//===============================================
	// �����i�[�e
	// �u�����j�~�ł���̂́@���Ȃ������@���Ȃ���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(player, player_nod, BLEND_L);								// ��@���ȂÂ�
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(40);

	EndDemo(FADE_COLOR_BLACK);
}
