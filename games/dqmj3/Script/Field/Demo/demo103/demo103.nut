//=============================================
//
//		demo103[�d���̕���_1(�����)]
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
	local efc00_acc, efc01_srp, efc02, ef0c3, efc04, efc05, efc06, efc07, efc08, efc09, ef810_01;
	local task_cam, task_player, task_npc01, task_npc02, task_npc03;
	
// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	// �M�~�b�N
	local model_monitor = ReadGimmick_("o_A02_02");	// ���j�^
	local model_storage = ReadGimmick_("o_A02_01");	// �~�d��
	
	//�G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			//����
	LoadEffect_("ef810_01_sub_power_in");			//�T�u�d���̐Ԋ�
	LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[����
	
// ���z�u
	// ���j�^
	local monitor = ArrangePointGimmick_("o_A02_02", model_monitor, "obj_monitor000");
	SetMotion_(monitor, MOT_GIMMICK_0, BLEND_N);
	
	//�T�u�d��
	//�E��
	local storage00 = ArrangePointGimmick_("o_A02_01", model_storage, "obj_storage000");
	//�E�E
	local storage01 = ArrangePointGimmick_("o_A02_01", model_storage, "obj_storage100");
	
	// ��l��
	SetPointPos_(player, "player000");
	
// ����풓���[�V�����Ǎ�
	// ��l��
	local reacter = ReadMotion_(player, "Player_touch_reactor");			// ��l����������������遨���A�N�^�[��G��
	local reacterL = ReadMotion_(player, "Player_touch_reactor_L");			// ��l�����A�N�^�[��G��L	
	local player_stand = ReadMotion_(player, "Player_stand01");				// ���A�N�^�[��G�遨�ҋ@�ɖ߂�
	local panel = ReadMotion_(player, "Player_panel01");					// ��l���p�l������	
	
	local pl_nod = ReadMotion_(player, "Player_nod");						// �ҋ@�����ȂÂ����ҋ@
	
// ���������[�V�����ݒ�
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);

	// ���J�����P�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	Wait_(95);
	DeleteTask_(task_player);		
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	

	// ��l���@����
	SurpriseDisp(player);
	
	Wait_(20);
	
	local light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	//���A�N�^�[����
	
	// ��l���@���A�N�^�[��G��
	OpenConnectiveWithMotion("connective_ace", player, reacter, reacterL);					//���A�N�^�[��G�遨���b�Z�[�W�\��

	//===============================================
	// ���G�[�X
	// �u�����ƁI�@���������d�{�݂�
	//�@���䎺�݂������ȁ@<name_player/>�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_103_MSG_010");
	KeyInputWait_();	
	//===============================================	
	
	//===============================================
	// ���G�[�X
	//�u����p�l���̃X�C�b�`���@�����Ă���B
	//�@�����V�X�e�����@�N������͂����B
	//-----------------------------------------------
	ShowMsg_("DEMO_103_MSG_020");
	KeyInputWait_();	
	
	CloseMsgWnd_();	
	//===============================================
			
	CloseConnective();
	
	Wait_(15);
	SetMotion_(player, player_stand, BLEND_L);
	Wait_(30);		
	SetMotion_(player, panel, BLEND_L);				//��l���p�l������
	WaitMotion(player);
	PlaySE_("SE_DEM_006");							//�X�C�b�`on
	SetMotion_(player, MOT_WAIT, BLEND_L);	
				
	// �J�����Y�[���A�E�g
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
		
	WaitTask(task_cam);

	PlaySE_("SE_DEM_032");								//���j�^�N�� SE
	SetMotion_(monitor, MOT_GIMMICK_1, BLEND_M);		// ���j�^�d��on
	Wait_(60);
	
	OpenConnectiveWithMotion("connective_ace", player, reacter, reacterL);					//���A�N�^�[��G�遨���b�Z�[�W�\��
	
	//===============================================
	// ���G�[�X
	//�u�c�c�������I�@���d�{�݂�
	//�@����Ł@�{�ݕ����̏������ł�������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_103_MSG_030");
	KeyInputWait_();;	
	//===============================================
	
	// �J�����@���j�^�Ɍ������ăY�[���C��
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	WaitTask(task_cam);
	
	//===============================================
	// ���G�[�X
	//�u���[�Ɓc�c�܂��́@�T�u�d�����N��������̂��B
	//�@�Ԃ�����X�C�b�`�̂����@�@�B���ȁB
	//-----------------------------------------------
	ShowMsg_("DEMO_103_MSG_040");
	KeyInputWait_();	
	CloseMsgWnd_();	
	//===============================================
	
	CloseConnective();//���A�N�^�[��x����

	SetMotion_(player, player_stand, BLEND_L);
	
	Wait_(30)	
	SetMotion_(monitor, MOT_GIMMICK_4, BLEND_M);		// �T�u�d���_��
	Wait_(20);
	SetMotion_(monitor, MOT_GIMMICK_1, BLEND_M);		
	Wait_(20);
	SetMotion_(monitor, MOT_GIMMICK_4, BLEND_M);		
	Wait_(20);	
	SetMotion_(monitor, MOT_GIMMICK_1, BLEND_M);		
	Wait_(20);
	
	DeleteTask_(task_cam);	
	Wait_(20);
	//===============================================
	// ���G�[�X
	//�u<name_player/>�I�@�Q�����ɂ���
	//-----------------------------------------------

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	SetPointPos_(player, "player001");					//���Ŏ�l����������ړ�
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_103_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();	
	
	Wait_(30);
	//-----------------------------------------------
	DeleteTask_(task_cam);	
	
	// ���G�[�X
	//�u���̃X�C�b�`������Ɓ@�T�u�d�����N������B
	//-----------------------------------------------	
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");	

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_103_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();	
	
	Wait_(30);
	DeleteTask_(task_cam);
	//===============================================	
	//-----------------------------------------------
	// ���G�[�X
	//�u���̎菇�́@�I���[���߂��Ă������������B
	//-----------------------------------------------
	
	// �J�����@��l���A�b�v	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	OpenConnectiveWithMotion("connective_ace", player, reacter, reacterL);					//���A�N�^�[��G�遨���b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_103_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();	

	CloseConnective();
	//===============================================	
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
