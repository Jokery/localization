//=============================================
//
//		demo101[�ړI�n�̓Z���^�[�r��]
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
	local task_cam, task_player, task_nocho00, task_nocho01, task_nocho02, task_nocho03, task_jack;

// �����f���Ǎ�
	// �M�~�b�N
	local model_throne = ReadGimmick_("o_com_05");	// �ʍ�
	local model_shelter = ReadGimmick_("o_A00_03");	//�V�F���^�[
	local model_door = ReadGimmick_("o_A00_01");	// ��
	local model_window = ReadGimmick_("o_A00_04");	// �Z���^�[�r���̑��M�~�b�N
	local model_stele = ReadGimmick_("o_com_07");	// ���Z�Δ�
	local model_ruler = ReadGimmick_("o_com_08");	// ���[���|�C���g
	
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_nocho = ReadNpc_("n000");			// ��ʃm�`���[��
	local model_jack = ReadNpc_("n001");			// �W���b�N
	local model_king = ReadNpc_("n003");			// �L���O
	local model_queen = ReadNpc_("n005");			// �N�C�[��
	local model_ace = ReadNpc_("n002");				// �G�[�X

// ���z�u
	// �ʍ�
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");
	// �V�F���^�[
	local shelter000 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter000");
	local shelter001 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter001");
	local shelter002 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter002");
	local door000 = ArrangePointGimmick_("o_A00_01", model_door, "obj_door000");
	local door001 = ArrangePointGimmick_("o_A00_01", model_door, "obj_door001");
	// ��
	local res_tele = ArrangePointGimmick_("o_A00_04", model_window, "gimmick000");
	SetMotion_(res_tele, MOT_GIMMICK_0, BLEND_N);	
	// ���Z�Δ�
	local stele = ArrangePointGimmick_("o_com_07", model_stele, "obj_stele000");
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	
	// ��l��
	SetPointPos_(player, "player000");
	// �N�C�[��
	local nocho00 = ArrangePointNpc_(model_queen, "npc_nocho000");
	// �G�[�X
	local nocho03 = ArrangePointNpc_(model_ace, "npc_nocho003");
	// �W���b�N
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// �L���O
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// �m�`���[���Q
	local nocho01 = ArrangePointNpc_(model_nocho, "npc_nocho001");
	// �m�`���[���R
	local nocho02 = ArrangePointNpc_(model_nocho, "npc_nocho002");

// ����풓���[�V�����Ǎ�
	local player_look_right = ReadMotion_(player, "Player_look_right_L");			// �ҋ@���Z���^�[�r��������	

	
	// �L���O
	local kng_look_bldg = ReadMotion_(king, "n003_look_bldg");			// �ҋ@���Z���^�[�r��������
	local kng_look_bldg_L = ReadMotion_(king, "n003_look_bldg_L");		// �Z���^�[�r��������L
	local kng_talk = ReadMotion_(king, "n003_talk");					// �ҋ@����b
	local kng_talkL = ReadMotion_(king, "n003_talk_L");					// ��bL

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 210F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P�`�Q�������s�s�S�i�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	Wait_(170);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	DeleteTask_(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// 210F
	
	// �N���X�t�F�[�h
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	Wait_(180);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	DeleteTask_(task_cam);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	
	// ���J�b�g�S����l���J�����C���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");			// 90F
	
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);
	Wait_(70);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	Wait_(10);
	
	SetMotion_(king, kng_talk, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, kng_talkL, BLEND_M);
	
	//===============================================
	// ���L���O
	// �u�����ł��邩�@<name_player/>�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_101_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// �N���X�t�F�[�h
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	DeleteTask_(task_cam);
	
	// ���J�b�g�S���Z���^�[�r���ʂ��`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 520F
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	// �S���Z���^�[�r���̕�������
	SetMotion_(king, kng_look_bldg, BLEND_M);						// �ҋ@���Z���^�[�r��������
	Wait_(5);
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToPos_(player, GetPos_(res_tele), ROTATE_DEMO_DEF);
	Wait_(3);
	task_jack = Task_RotateToPos_(jack, GetPos_(res_tele), ROTATE_DEMO_DEF);
	Wait_(3);
	
	SetMotion_(nocho00, MOT_WALK, BLEND_M);							//�N�C�[���U�����
	task_nocho00 = Task_RotateToPos_(nocho00, GetPos_(res_tele), ROTATE_DEMO_DEF);
	WaitTask(task_nocho00);
	SetMotion_(nocho00, MOT_WAIT, BLEND_M);

	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	WaitMotion(king);
	SetMotion_(king, kng_look_bldg_L, BLEND_M);						// �Z���^�[�r��������LOOP
	
	//===============================================
	// ���L���O
	// �u����́@�Z���^�[�r���Ƃ����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_101_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ���W���b�N
	// �u�����ށc�c�l�̋C�z���@���܂���ȁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_101_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(10);
	
	//===============================================
	// ���L���O
	// �u�c�c���Ƃ��Ă��@���̖ڂŁ@�������߂����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_101_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	DeleteTask_(task_cam);
	
	SetMotion_(king, kng_talk, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, kng_talkL, BLEND_M);
	
	// ���J�����ݒ� �L���O�A�b�v
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	
	Wait_(10);	
	
	//===============================================
	// ���L���O
	// �u�������@���Ă���ʂ��H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_101_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
