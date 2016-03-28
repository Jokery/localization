//=============================================
//
//		demo123[�z�����u�A���^�]]
//
//=============================================
function Update()
{
// ���ϐ���`
	local task_cam, task_player, task_ace;

// �����\�[�X�Ǎ�
	local model_mix = ReadGimmick_("o_A01_02");
	local model_lift = ReadGimmick_("o_A01_00");			// �G���x�[�^��
	local player = GetPlayerId_();
	local model_nocho = ReadNpc_("n043");		// �m�`������
	local model_jack = ReadNpc_("n001");		// �W���b�N
	local model_ace = ReadNpc_("n002");			// �G�[�X
	local model_king = ReadNpc_("n003");		// �L���O
	LoadEffect_("ef712_10_emo_surprise01");		// �u�I�v

// ���z�u
	//�G���x�[�^��
	local lift01 = ArrangeGimmick_("o_A01_00", model_lift, Vec3(230.0, 2.0, 0.0));
	SetDir_(lift01, -90);
	SetMotion_(lift01, MOT_GIMMICK_0, BLEND_M);	

	local lift02 = ArrangeGimmick_("o_A01_00", model_lift, Vec3(-230.153, 2.0, 0.0));
	SetDir_(lift02, 90);
	SetMotion_(lift02, MOT_GIMMICK_0, BLEND_M);


	local mix = ArrangePointGimmick_("o_A01_02", model_mix, "obj_mix000");
	SetMotion_(mix, MOT_GIMMICK_0, BLEND_N);
	SetPointPos_(player, "player000");
	SetDir_(player, 180);
	local nocho = ArrangePointNpc_(model_nocho, "npc_nocho000");
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	local king = ArrangePointNpc_(model_king, "npc_king000");

// ����풓���[�V�����Ǎ�
	local player_cage_look_L = ReadMotion_(player, "Player_cage_look_L");	// �P�[�W�̕�������
	local player_nod = ReadMotion_(player, "Player_nod");					// �ҋ@�����ȂÂ����ҋ@
	local ace_hand_up = ReadMotion_(ace, "n002_hand_up");					// ��b�����������
	local ace_hand_up_L = ReadMotion_(ace, "n002_hand_up_L");				// ���������L
	local ace_operate_L = ReadMotion_(ace, "n002_operate_L");				// ���삷��L
	local king_think = ReadMotion_(king, "n003_think");						// �L���O�ҋ@���l����
	local king_think_L = ReadMotion_(king, "n003_think_L");					// �L���O�l����
	local king_nod = ReadMotion_(king, "n003_nod");							// �L���O����
	local king_look_jack = ReadMotion_(king, "n003_look_jack");				// ���ȂÂ����W���b�N�̕�������
	local king_look_jack_L = ReadMotion_(king, "n003_look_jack_L");			// �W�����N�̕�������L
	local king_stick_up = ReadMotion_(king, "n003_stick_up");				// �L���O�ҋ@����f��
	local king_stick_up_L = ReadMotion_(king, "n003_stick_up_L");			// �L���O��f��
	local king_look_bldg = ReadMotion_(king, "n003_look_bldg");				// �L���O����������i�Z���^�[�r��������ő�p�j
	local king_look_bldg_L = ReadMotion_(king, "n003_look_bldg_L");			// �L���O����������L
	local king_surprise = ReadMotion_(king, "n003_surprise");				// �L���O����
	local king_surprise_L = ReadMotion_(king, "n003_surprise_L");			// �L���O����
	local king_talk = ReadMotion_(king, "n003_talk");						// �ҋ@����b
	local king_talk_L = ReadMotion_(king, "n003_talk_L");					// ��bL

// �������̃��[�V����
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 1.0);
	SetMotion_(ace, MOT_WAIT, BLEND_N);
	SetManualCalcAlpha_(ace, true);
	SetAlpha_(ace, 1.0);
	SetMotion_(king, MOT_WAIT, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);


	//��������������������������������������
	//���J�b�g1���z�����u���ӂ�����
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 400F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	Wait_(60);
	DeleteTask_(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	SurpriseDisp(ace);
	Wait_(30);
	SetMotion_(ace, MOT_WALK, BLEND_M);
	task_ace = Task_RotateToPos_(ace, GetPos_(player), ROTATE_DEMO_DEF);
	WaitTask(task_ace);
	DeleteTask_(task_ace);
	MotionTalk(ace);

	//===============================================
	// ���G�[�X
	// �u�ǂ����@��������݂�������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_123_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(ace, MOT_WALK, BLEND_M);
	task_ace = Task_RotateToPos_(ace, Vec3(-52.93951, 22.6533, -253.72496), ROTATE_DEMO_DEF);		// Dir = -140
	WaitTask(task_ace);
	SetMotion_(ace, ace_operate_L, BLEND_L);
	DeleteTask_(task_ace);
	Wait_(10);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g2���z�����u�Y�[��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 300F

	StartEarthQuake_(30, 3, 1);
	PlaySE_("SE_DEM_045");											//���u�N���̉�ʗh��	
	Wait_(30);
	SetMotion_(mix, MOT_GIMMICK_1, BLEND_M);
	Wait_(50);
	StartEarthQuake_(10, 5, 3);
	Wait_(129);
	SetMotion_(mix, MOT_GIMMICK_2, BLEND_M);
	Wait_(45);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g3���G�[�X�Y�[��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 300F

	SetMotion_(ace, MOT_WALK, BLEND_M);
	task_ace = Task_RotateToPos_(ace, Vec3(-13.0, 33.0, -323.0), ROTATE_DEMO_DEF);
	WaitTask(task_ace);
	DeleteTask_(task_ace);
	MotionTalk(ace);

	//===============================================
	// ���G�[�X
	// �u�悵�c�c�����@���ł��z���ł��邺�B
	// �@�z���������Ȃ�����@�I���Ɂ@�b���������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_123_MSG_020");
	KeyInputWait_();
	task_ace = Task_WalkAroundToPos(ace, GetPos_(player), ROTATE_DEMO_DEF);		// �G�[�X��l���֌���
	//-----------------------------------------------
	// ��
	// �u���ꂩ��ȁ@�z������������
	//�@���x���P�Ő��܂����Ă��Ƃ��@�o���Ă����B
	//-----------------------------------------------
	ShowMsg_("DEMO_123_MSG_030");
	WaitTask(task_ace);
	DeleteTask_(task_ace);
	MotionTalk(ace);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(ace, MOT_WAIT, BLEND_L);				// �G�[�X�ҋ@
	Wait_(20);
	SetDir_(king, -100);
	SetDirToPos_(player, GetPos_(king));
	SetAlpha_(jack, ALPHA_CLEAR);
	SetAlpha_(nocho, ALPHA_CLEAR);
	DeleteTask_(task_cam);
	SetAlpha_(mix, 0.0);


	//��������������������������������������
	//���J�b�g4���L���O�Ǝ�l���̂Q�V���b�g
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 450F

	SetMotion_(king, king_nod, BLEND_N);							// �L���O����
	WaitMotion(king);
	SetMotion_(king, king_look_jack_L, BLEND_XL);					// �W���b�N�̕�������L

	//===============================================
	// ���L���O
	// �u���ށc�c�z����������́@�܂��ア�̂ł���B
	// �@�ꍇ�ɂ���Ắ@��킵���˂�̂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_123_MSG_040");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u������Ɓ@�p�[�e�B�S�̂́@�o�����X���l����
	// �@�z���̌v����@���Ă˂΂�����̂ł���B
	//-----------------------------------------------
	ShowMsg_("DEMO_123_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(king, MOT_WAIT, BLEND_N);			// �L���O�ҋ@
	SetMotion_(ace, MOT_WAIT, BLEND_N);				// �G�[�X�ҋ@
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g5���G�[�X�����l����
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 300F

	MotionTalk(ace);								// �G�[�X��b

	//===============================================
	// ���G�[�X
	// �u��������@�I���[�@���y�̗쓹�֍s���̂��H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_123_MSG_060");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u���y�̗쓹�ւ́@���̈ړ����u����s����B
	//-----------------------------------------------
	ShowMsg_("DEMO_123_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(ace, MOT_WAIT, BLEND_M);				// �G�[�X�ҋ@
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g6���L���O�t�o
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 200F

	SetDirToObject_(king, player);
	SetMotion_(king, king_surprise, BLEND_M);			// ����
	WaitMotion(king);
	SetMotion_(king, king_surprise_L, BLEND_M);			// ����L

	//===============================================
	// ���L���O
	// �u�Ȃ�ƁI�@�G�[�X��I�@����̓��W�X�^���X��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_123_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	DeleteTask_(task_cam);
	SetMotion_(ace, MOT_TALKLOOP, BLEND_N);


	//��������������������������������������
	//���J�b�g7���G�[�X�����l����
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 300F

	//===============================================
	// ���G�[�X
	// �u���Ԃ�ȁB�������@<name_player/>��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_123_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_cam);
	SetMotion_(king, king_talk_L, BLEND_N);			// ��b


	//��������������������������������������
	//���J�b�g8 �L���O�Ǝ�l��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 450F	

	//===============================================
	// ���L���O
	// �u�ӂށc�c���L���́@�����Ă���킯���c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_123_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	SetMotion_(king, king_look_bldg_L, 20);		// ����������L
	Wait_(15);

	//===============================================
	// ���L���O
	// �u<name_player/>��c�c���̋�̉��Łc�c
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_123_MSG_110");
	KeyInputWait_();
	SetMotion_(king, king_talk, BLEND_XL);			// �L���O��b
	WaitMotion(king);
	SetMotion_(king, king_talk_L, BLEND_M);			// �L���O��bL
	//-----------------------------------------------
	// ��
	// �u�Z���^�[�r���Ł@���@�m�`���[����
	//-----------------------------------------------
	ShowMsg_("DEMO_123_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(king, MOT_WAIT, BLEND_XL);
	DeleteTask_(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}