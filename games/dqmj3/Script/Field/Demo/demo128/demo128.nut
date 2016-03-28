//=============================================
//
//		demo128[�d���̕���_1(�N��)]
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
	local efc_light;
	local task_cam, task_player, task_npc01, task_npc02, task_npc03;
	
// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	// �M�~�b�N
	local model_monitor = ReadGimmick_("o_A02_02");	// ���j�^
	// �G�t�F�N�g
	LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[����
	LoadEffect_("ef712_10_emo_surprise01");			//����

// ���z�u
	// ���j�^
	local monitor = ArrangePointGimmick_("o_A02_02", model_monitor, "obj_monitor000");
	SetMotion_(monitor, MOT_GIMMICK_4, BLEND_N);		// ���j�^�ԁ@�~�d�헼�_��
	
	// ��l��
	SetPointPos_(player, "player000");

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_reactor = ReadMotion_(player, "Player_touch_reactor");			// ��������������遨���A�N�^�[��G��
	local player_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");		// ���A�N�^�[��G��L
	local player_stand = ReadMotion_(player, "Player_stand01");					// ���A�N�^�[��G�遨�ҋ@�ɖ߂�	
	local panel = ReadMotion_(player, "Player_panel01");						// ��l���p�l������
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�����P�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SurpriseDisp(player);
	Wait_(20);
	
	efc_light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	//���A�N�^�[����
	
	OpenConnectiveWithMotion("connective_ace", player, player_reactor, player_reactor_L);
	
	//===============================================
	// ���G�[�X
	// �u���ꂶ�Ⴀ�@�d�グ�����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_128_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�����𑀍삵��
	//-----------------------------------------------
	ShowMsg_("DEMO_128_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();	
	CloseConnective();
	
	Wait_(15);
	SetMotion_(player, player_stand, BLEND_L);
	Wait_(25);
	SetMotion_(player, panel, BLEND_L);					//��l���p�l������
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	PlaySE_("SE_DEM_033");								//�~�d��N����SE
	
	DeleteTask_(task_cam);
	
	// �J�����@���j�^�A�b�v	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	Wait_(45);

	SetMotion_(monitor, MOT_GIMMICK_5, BLEND_M);		// ���j�^�@�J��
	
	Wait_(70);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000")
	
	//-----------------------------------------------
	// ��
	// �u�������c�c���܂��@�����Ă�݂������B
	//-----------------------------------------------
	OpenConnectiveWithMotion("connective_ace", player, player_reactor, player_reactor_L);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_128_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	
	CloseConnective();
	Wait_(30);
	
	SetMotion_(player, player_stand, BLEND_L);

	EndDemo(FADE_COLOR_BLACK);
}
