//=============================================
//
//		demo525[���i�[�e�����������]
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
	local player = GetPlayerId_();								// ��l��
	local npc_rena = ReadNpc_("n007");							//���i�[�e

//�M�~�b�N�ǂݍ���
	local  model_cold = ReadGimmick_("o_V02_10");				//�R�[���h�X���[�v�P�[�X
	local  model_couldsleep = ReadGimmick_("o_V02_12");			//�R�[���h�X���[�v���u
	local  model_couldsleep_monitor = ReadGimmick_("o_V02_13");	//�R�[���h�X���[�v����
	local model_door = ReadGimmick_("o_V02_09");			// ��

// ���z�u
	// ��l��
	//SetPointPos_(player, "player000");
	local rena = ArrangePointNpc_(npc_rena, "npc_rena000");
	
	//�M�~�b�N
	local couldsleep = ArrangePointGimmick_("o_V02_12", model_couldsleep, "obj_couldsleep000");				//�R�[���h�X���[�v���u
	local monitor000 = ArrangePointGimmick_("o_V02_13", model_couldsleep_monitor, "obj_monitor000");		//�R�[���h�X���[�v����
	// ��
	local door = ArrangePointGimmick_("o_V02_09", model_door, "obj_door000");

// ����풓���[�V�����Ǎ�
	local rena_typing_L = ReadMotion_(rena, "n007_typing_L");			// ���i�[�e �R���\�[���𑀍삷��L
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");		// ���i�[�e ��������


//����
	SetStepSe_(rena, "SE_FLD_016");
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	SetMotion_(monitor000, MOT_GIMMICK_0, BLEND_N);					//���j�^�[�̒ʏ���
	
	StartDemo(FADE_COLOR_BLACK);	

	SetMotion_(rena, MOT_WAIT, BLEND_L);
	Wait_(7);

	SetMotion_(rena, MOT_WALK, BLEND_XL);
	local tas_renak = Task_RotateToDir_(rena, 218, 2);				//���i�[�e�p�x�ύX
	Wait_(48);
	SetMotion_(rena, rena_look_left_L, BLEND_XL);					// ���i�[�e ��������
	
	Wait_(20);

	//===============================================
	//*���i�[�e
	// 	�u�����������Ƃ́@���낢�날��Ǝv���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_525_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*���i�[�e
	// 	�u���ׂẮc�c���ꂩ��B
	//-----------------------------------------------
	ShowMsg_("DEMO_525_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, MOT_WALK, BLEND_L);
	local tas_renak = Task_RotateToDir_(rena, 120, 3);				//���i�[�e�p�x�ύX
	Wait_(28);

	PlayLoopSE_("SE_DEM_121");
	SetMotion_(rena, rena_typing_L, BLEND_XL);						//���i�[�e �R���\�[���𑀍�
	Wait_(40);

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	//*���i�[�e
	// 	�u�c�c����́@���Ȃ��ɂ��Ă�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_525_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	
	local task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
		
	SetAlpha_(rena, 0);
	StopLoopSE_(15);
	Wait_(60);
	PlaySE_("SE_DEM_049");												//��SE:���j�^�[�Ƀm�C�Y������
	SetMotion_(monitor000, MOT_GIMMICK_1, BLEND_N);						//���j�^�[�̃m�C�Y���

	Wait_(40);
	
	EndDemo(FADE_COLOR_WHITE);
}
