//=============================================
//
//		demo516[�e���W�A�̊܂�_2(��n)]
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
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��

	local obj_door = ReadGimmick_("o_V00_03");		//���W�X�^���X�̔�
	local doa = ArrangePointGimmick_("o_V00_03",obj_door, "obj_door000");


	local obj_panel = ReadGimmick_("o_V00_11");		//���W�X�^���X�̔�
	local panel = ArrangePointGimmick_("o_V00_11",obj_panel, "obj_panel000");
	
	local model_ruler = ReadGimmick_("o_com_08");	// ���[���|�C���g


// ���z�u
	// ��l��
//	SetPointPos_(player, "player000");
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	if(GetEventFlg_("BFG_RULER_ADD_021") == true){
		SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N);
	}

// ����풓���[�V�����Ǎ�
	

// ���J�����ݒ�

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

// ���V��ݒ�
	SetWeather_(WEATHER.BAD);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//*�e���W�A
	// 	�u�G���s�X�R�́@�ǂ����ɂ���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_516_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*�e���W�A
	// 	�o�[�f�B�c�c�ނ̃`�J�����@�؂���
	//-----------------------------------------------
	ShowMsg_("DEMO_516_MSG_020");
	KeyInputWait_();
	
	//===============================================
	//*�e���W�A
	// 	�u���i�[�e���҂��Ă�
	//-----------------------------------------------
	ShowMsg_("DEMO_516_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	
	Wait_(50);
	
	EndDemo(FADE_COLOR_BLACK);
}
