//=============================================
//
//		demo528[�ړ����u��ł��グ��_1]
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
	SetStepSePan_(rena, false);

// ����풓���[�V�����Ǎ�
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");	// ������ҋ@L

	local rena_look_down_L = ReadMotion_(rena, "n007_look_down_L");		// ���ނ��ҋ@L
	local rena_typing_L = ReadMotion_(rena, "n007_typing_L");			// �R���\�[���𑀍삷��L

//����
	SetStepSe_(rena, "SE_FLD_016");

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 110F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(25);
	
	SetMotion_(rena, rena_look_down_L, 12);
	
	//===============================================
	//*���i�[�e
	// 	�u�����c�c���߂��́c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_528_MSG_010");
	KeyInputWait_();
	
	SetMotion_(rena, MOT_WAIT, 12);
	
	//===============================================
	//*���i�[�e
	// 	�u�Ȃ�c�c�����猾�����Ƃ́@�����Ȃ���B
	//-----------------------------------------------
	ShowMsg_("DEMO_528_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// 70F
	
	Wait_(30);
	
	task_rena = Task_RotateToDirSetMotion_(rena, 120, ROTATE_DEMO_DEF, MOT_WALK, MOT_WAIT);
	
	Wait_(55);
	PlayLoopSE_("SE_DEM_121");
	SetMotion_(rena, rena_typing_L, 12);
	
	Wait_(2);
	
	SetMotion_(player, player_look_up_L, 10);
	
	Wait_(23);

	//===============================================
	//*���i�[�e
	// 	�u�G�̖{���n�c�c�R�A�ւ́@�ʏ�̎�i��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_528_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);
	StopLoopSE_(30);
	EndDemo(FADE_COLOR_BLACK);
}
