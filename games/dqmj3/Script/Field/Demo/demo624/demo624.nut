//=============================================
//
//		demo624[�e�C�N�I�t�̑O��]
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
	local player = GetPlayerId_();									// ��l��
	local model_rena = ReadNpc_("n007");							// ���i�[�e

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	
//	���i�[�e
	local rena_walk = ReadMotion_(rena, "n007_walk01_L");			// ���ނ�
	local rena_look_down = ReadMotion_(rena, "n007_look_down_L");	
	local rena_talk = ReadMotion_(rena, "n007_talk01");
	local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");
	local rena_ue = ReadMotion_(rena, "n007_look_up_L");

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetMotion_(rena, rena_walk, BLEND_N);							// ���i�[�e����
	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_015", 12);
	task_rena = Task_MoveForward_(rena, 0.8, false);
	
	//��������������������������������������
	//���J�b�g�P
	//��������������������������������������
	StartDemo(FADE_COLOR_BLACK);
	
	DeleteTaskStepSe(rena, task_rena_step);
	DeleteTask_(task_rena);
	SetMotion_(rena, rena_look_down, BLEND_L);						// ���i�[�e���ނ��ҋ@
	WaitTask(task_rena);
	
	//===============================================
	// �����i�[�e
	// �u�c�c<name_player/>�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_624_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u���Ɂc�c�K���r���X��|���@�`�J���͂Ȃ��B
	//-----------------------------------------------
	ShowMsg_("DEMO_624_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_rena = Task_WalkAroundToPos(rena, GetPos_(player), 5.7);
	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_015", 12);
	WaitTask(task_rena);
	
	DeleteTaskStepSe(rena, task_rena_step);
	SetMotion_(rena, MOT_WAIT, BLEND_L);
	Wait_(20);
	
	SetMotion_(rena, rena_talk, BLEND_XL);
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);	
	Wait_(25);
	
	//===============================================
	// �����i�[�e
	// �u�c�c�{���Ɂ@���ӂ��Ă�B�����΂�댯��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_624_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	SetPointPos_(rena, "npc_rena001");
	
	//��������������������������������������
	//���J�b�g�Q
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//===============================================
	// �����i�[�e
	// �u�c�c���̐�@���������Ă��@���Ȃ���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_624_MSG_040");
	KeyInputWait_();
	
	SetMotion_(rena, rena_ue, BLEND_XL);							// ���i�[�e�����
	
	//-----------------------------------------------
	// ��
	// �u�Î�̑����Ɂ@�s���܂��傤�c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_624_MSG_050");
	KeyInputWait_();
	
	SetMotion_(rena, MOT_TALKLOOP, BLEND_XL);						// ���i�[�e�ʏ��b
	
	//-----------------------------------------------
	// ��
	// �u�������Ȃ�c�c�t���C�g�V�O�i����
	//-----------------------------------------------
	ShowMsg_("DEMO_624_MSG_060");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u��󃉃C�h�Ł@�R�A�̏���ڎw���́c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_624_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	EndDemo(FADE_COLOR_BLACK);
}
