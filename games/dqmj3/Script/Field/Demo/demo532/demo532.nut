//=============================================
//
//		demo532[�ړ����u��ł��グ��_4(��n)]
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
	local task_cam, task_rena;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();			// ��l��
	local model_rena = ReadNpc_("n007");	// ���i�[�e

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");

// ����풓���[�V�����Ǎ�
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");	// ������ҋ@L

	local rena_typing_L = ReadMotion_(rena, "n007_typing_L");			// �R���\�[���𑀍삷��L
	
//����
	SetStepSe_(rena, "SE_FLD_016");

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 70F
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	SetMotion_(player, player_look_up_L, BLEND_N);
	SetMotion_(rena, rena_typing_L, BLEND_N);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(5);
	PlayLoopSE_("SE_DEM_121");
	
	Wait_(55);
	
	//===============================================
	//*���i�[�e
	// 	�u�c�c�]�����u�́@�N�����m�F�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_532_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
	StopLoopSE_(5);
	SetMotion_(rena, MOT_WAIT, 12);
	Wait_(5);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(30);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 70F
	
	Wait_(30);
	
	task_rena = Task_RotateToDirSetMotion_(rena, -45, ROTATE_DEMO_DEF, MOT_WALK, MOT_WAIT);
	
	WaitTask(task_cam);
	WaitTask(task_rena);

	Wait_(10);

	//===============================================
	//*���i�[�e
	// 	�u�O�ɏo�܂��傤�c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_532_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
	
	EndDemo(FADE_COLOR_BLACK);
}
