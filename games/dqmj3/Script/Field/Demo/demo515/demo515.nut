//=============================================
//
//		demo515[�e���W�A�̊܂�_1]
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
	local player = GetPlayerId_();						// ��l��

	// �G�t�F�N�g�ǂݍ���
	LoadEffect_("EF712_10_EMO_SURPRISE01");				// �u�I�v

	// �M�~�b�N�ǂݍ���
	local obj_monorisu = ReadGimmick_("o_com_02");		// ���m���X
	local obj_door = ReadGimmick_("o_O01_03");			// A�����N�̔�

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	// �M�~�b�N�z�u
	local monorisu = ArrangePointGimmick_("o_com_02",obj_monorisu, "obj_monorisu000");
	local door = ArrangePointGimmick_("o_O01_04",obj_door, "obj_door000");

// ����풓���[�V�����Ǎ�
	local player_turn_L = ReadMotion_(player, "Player_turn_L");// ��l���U�����

	SetMotion_(monorisu, MOT_GIMMICK_2, BLEND_N);		// �N����ҋ@

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//===============================================
	//*�e���W�A
	// 	�u���̃J�M���g���ā@��������o����O��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_515_MSG_010");
	KeyInputWait_();
	//===============================================
	//*�e���W�A
	// �u�c�c���́@����l���̖��O�����܂�
	//-----------------------------------------------
	ShowMsg_("DEMO_515_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	efc_player = SurpriseDisp(player);
	SetEffectScale_(efc_player, 1.0);
	Wait_(10);
	SetMotion_(player, player_turn_L, BLEND_L);			//��l����������
	Wait_(40);


	//===============================================
	//�J�����V�[���؂�ւ�
	//-----------------------------------------------
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	Wait_(10);
	task_player = Task_RotateToDir_(player, 89, 7);
	SetMotion_(player, MOT_WALK, BLEND_XL);	
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);

	//===============================================
	//*�e���W�A
	// �u���ā@���Ȃ��́@�`�����C�Z���X������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_515_MSG_030");
	KeyInputWait_();
	//===============================================
	//*�e���W�A
	// �u�������@���Ȃ��͔s��@�L����D����
	//-----------------------------------------------
	ShowMsg_("DEMO_515_MSG_040");
	KeyInputWait_();
	//===============================================
	//*�e���W�A
	// �u�����āc�c���Ԃɋ~�o����@���Ȃ���
	//-----------------------------------------------
	ShowMsg_("DEMO_515_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//==============================================

	Wait_(15);


	//===============================================
	//�A�j���[�V�����J�����ɐ؂�ւ�
	//-----------------------------------------------
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	WaitTask(task_player);

	//===============================================
	//*�e���W�A
	// �u�����c�c���́@���܂����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_515_MSG_060");
	KeyInputWait_();
	//==============================================
	//*�e���W�A
	// �u�Ȃ��@�A���Z�X�ƌĂ΂��̂��B
	//-----------------------------------------------
	ShowMsg_("DEMO_515_MSG_070");
	KeyInputWait_();
	//===============================================
	//*�e���W�A
	// �u���W�X�^���X�́@�閧��n�Ɂ@�s����
	//-----------------------------------------------
	ShowMsg_("DEMO_515_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}
