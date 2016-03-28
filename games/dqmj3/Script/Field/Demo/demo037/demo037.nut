//=============================================
//
//		demo037[�������R���z����]
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
	local task_cam, task_player, task_npc01, task_npc02, task_npc03, task_npc04, task_npc05, task_npc06, task_npc07;
	
// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_nocho = ReadNpc_("n000");			// ��ʃm�`���[��
	local model_jack = ReadNpc_("n001");			// �W���b�N
	local model_ace = ReadNpc_("n002");				// �G�[�X
	local model_king = ReadNpc_("n003");			// �L���O
	local model_qween = ReadNpc_("n005");			// �N�C�[��
	local model_rin = ReadNpc_("n043");				// �m�`������
	
	// �M�~�b�N
	local model_maruta = ReadGimmick_("o_H00_04");	// �ۑ�
	local model_throne = ReadGimmick_("o_com_05");	// �ʍ�

// ���z�u
	// �ۑ�
	local maruta = ArrangePointGimmick_("o_H00_04", model_maruta, "obj_maruta000");
	// �ʍ�
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");
	
	// ��l��
	SetPointPos_(player, "player000");
	local task_player = Task_RotateToPos_(player, GetPos_(maruta), 229);
	// �m�`������
	local nocho = ArrangePointNpc_(model_rin, "npc_nocho000");
	// �m�`���[��B
	local nocho2 = ArrangePointNpc_(model_nocho, "npc_nocho001");
	// �m�`���[��C
	local nocho3 = ArrangePointNpc_(model_nocho, "npc_nocho002");
	// �m�`���[��D
	local nocho4 = ArrangePointNpc_(model_nocho, "npc_nocho003");
	// �W���b�N
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// �G�[�X
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	// �L���O
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// �N�C�[��
	local qween = ArrangePointNpc_(model_qween, "npc_qween000");

// ����풓���[�V�����Ǎ�
	local kg_talk = ReadMotion_(king, "n003_talk");						// �ҋ@����b
	local kg_talk_L = ReadMotion_(king, "n003_talk_L");					// ��b

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�����P�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	Wait_(45);
	
	//===============================================
	// ���L���O
	// �u�҂������ȁ@<name_player/>��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToPos_(player, GetPos_(king), ROTATE_DEMO_DEF);
	
	//�p���p���ƕ����o��
	SetMotion_(jack, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(ace, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(qween, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(nocho, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(nocho2, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(nocho3, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(nocho4, MOT_WALK, BLEND_M);
	
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	task_npc02 = Task_MoveForward_(jack, 1.0, false);
	task_npc04 = Task_MoveForward_(ace, 1.0, false);
	task_npc06 = Task_MoveForward_(qween, 1.0, false);
	task_npc03 = Task_MoveForward_(nocho, 1.0, false);
	task_npc05 = Task_MoveForward_(nocho2, 1.0, false);
	task_npc07 = Task_MoveForward_(nocho3, 1.0, false);
	
	// ���J�����P�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	Wait_(20);
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	DeleteTask_(task_npc04);
	DeleteTask_(task_npc03);
	Wait_(20);
	
	SetMotion_(qween, MOT_WAIT, BLEND_M);
	SetMotion_(nocho2, MOT_WAIT, BLEND_M);
	DeleteTask_(task_npc06);
	DeleteTask_(task_npc05);
	Wait_(20);
	
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	SetMotion_(nocho3, MOT_WAIT, BLEND_M);
	SetMotion_(nocho4, MOT_WAIT, BLEND_M);
	DeleteTask_(task_npc02);
	DeleteTask_(task_npc07);
	Wait_(5);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	// ���J�����Q�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	//-----
	
	SetMotion_(king, kg_talk, BLEND_XL);				// ��b
	WaitMotion(king);
	SetMotion_(king, kg_talk_L, BLEND_M);				// ��bLOOP
	
	//===============================================
	// ���L���O
	// �u�ł́@���ꂩ��@������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_020");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u���邪�悢�B���̃K�P�Ɂ@�͂΂܂�
	//-----------------------------------------------
	ShowMsg_("DEMO_037_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_L);
	
	// ���J�����R�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToPos_(player, GetPos_(maruta), ROTATE_DEMO_DEF);
	WaitTask(task_player);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	WaitTask(task_cam);
	
	//===============================================
	// ���L���O
	// �u�������@�����̎��@���΂ꂤ���ǂ�Ȃ��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	// ���J�����S�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	//===============================================
	// ���L���O
	// �u���������B���̊ۑ����@�]������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	DeleteTask_(task_cam);
	
	// ���J�����T�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	SetMotion_(king, kg_talk, BLEND_XL);		// ��b
	WaitMotion(king);
	SetMotion_(king, kg_talk_L, BLEND_M);		// ��bLOOP
	//-----
	
	//===============================================
	// ���L���O
	// �u���ށB�������@���΂ꂤ���ǂ�ɏ����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	
	EndDemo(FADE_COLOR_BLACK);
}
