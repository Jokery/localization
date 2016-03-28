//=============================================
//
//		demo033[���΂ꂤ���ǂ��T����]
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

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();
	local model_jack = ReadNpc_("n001");		// �W���b�N
	local model_king = ReadNpc_("n003");		// �L���O
	local model_queen = ReadNpc_("n005");		// �N�C�[��
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �L���O
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// �W���b�N
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// �N�C�[��
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");

// ����풓���[�V�����Ǎ�
	local pl_talk = ReadMotion_(player, "Player_talk");				// ��b
	local pl_talk_L = ReadMotion_(player, "Player_talk_L");			// ��bL
	local king_talk = ReadMotion_(king, "n003_talk");				// �L���O�@�ҋ@����b
	local king_talk_L = ReadMotion_(king, "n003_talk_L");			// �L���O�@��b
	local king_stick = ReadMotion_(king, "n003_stick_up");			// �L���O�@�ҋ@����f��
	local king_stick_L = ReadMotion_(king, "n003_stick_up_L");		// �L���O�@��f��
	local king_think = ReadMotion_(king, "n003_think");				// �L���O�@�ҋ@���l����
	local king_think_L = ReadMotion_(king, "n003_think_L");			// �L���O�@�l����
	local king_surprise = ReadMotion_(king, "n003_surprise");		// �L���O�@�ʏ�ҋ@������
	local king_surprise_L = ReadMotion_(king, "n003_surprise_L");	// �L���O�@����L

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(king, king_talk_L, BLEND_XL);
	
	//===============================================
	// ���L���O
	// �u�����@�߂������@<name_player/>��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_033_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	
	SetMotion_(player, pl_talk, BLEND_M);		// ��b
	WaitMotion(player);
	SetMotion_(player, pl_talk_L, BLEND_M);		// ��bLOOP
	Wait_(60);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	SetMotion_(king, king_think, BLEND_M);		// �l����
	WaitMotion(king);
	SetMotion_(king, king_think_L, BLEND_M);	// �l����LOOP
	
	//===============================================
	// ���L���O
	// �u�Ȃ�قǁc�c�t�B�[���h���C�h�Ƃ���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_033_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(20);
	
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_CLEAR);
	
	//��������������������������������������
	//���J�b�g�Q
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	//-----------------------------------------------
	// ��
	// �u��͂�@�����ɂ́@��߂���`�J����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_033_MSG_030");
	KeyInputWait_();
	
	SetMotion_(king, king_talk_L, BLEND_XL);
	
	//-----------------------------------------------
	// ��
	// �u�c�c���Ɂ@<name_player/>��B
	//-----------------------------------------------
	ShowMsg_("DEMO_033_MSG_040");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u���΂ꂤ���ǂ�Ƃ���������
	//-----------------------------------------------
	ShowMsg_("DEMO_033_MSG_050");
	KeyInputWait_();
	
	SetMotion_(king, king_stick, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, king_stick_L, BLEND_M);
	
	//-----------------------------------------------
	// ��
	// �u���΂ꂤ���ǂ�́@��������܂�����
	//-----------------------------------------------
	ShowMsg_("DEMO_033_MSG_060");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u���Ԃɂ�����@���΂ꂤ���ǂ�ɏ�����܂�
	//-----------------------------------------------
	
	ShowMsg_("DEMO_033_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_()
	
	EndDemo(FADE_COLOR_BLACK);
}
