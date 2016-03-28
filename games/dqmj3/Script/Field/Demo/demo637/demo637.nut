//=============================================
//
//		demo637[�r�����N���C�Z���X�l��_2(���e�B�X�l����)]
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
	local efc_player, efc_rena, efc_cam;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();															// ��l��
	local model_rena = ReadNpc_("n007");													// ���i�[�e
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");													// �u�I�v

// ���z�u
	//�L�����N�^�[
	SetPointPos_(player, "player000");														// ��l��
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");							// ���i�[�e

// ����풓���[�V�����Ǎ�
	//��l��
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");						// ������ҋ@L
	local player_sup = ReadMotion_(player, "Player_surprise");								// ����
	local player_sup_L = ReadMotion_(player, "Player_surprise_L");							// ����L
	local player_nod = ReadMotion_(player, "Player_nod");									// ���ȂÂ�

	//���i�[�e
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");								// ������ҋ@L
	local rena_talk = ReadMotion_(rena, "n007_talk01");										// ��b�J�n�i������ɂ��Ă�j
	local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");									// ��bL�i������ɂ��Ă�j
	local rena_look_down = ReadMotion_(rena, "n007_look_down_L");							// ���ނ��ҋ@
	local rena_nod = ReadMotion_(rena, "n007_nod");											// ���ȂÂ�
	
//����
	SetStepSe_(rena, "SE_FLD_016");

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//����������������������������������������������������������������������������
	//���J�b�g1 ���i�@�A�b�v	��demo623�̑�����
	//����������������������������������������������������������������������������

	SetMotion_(rena, rena_talk, BLEND_L);													// ���i�b��
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_L);

	//===============================================
	// *���i�[�e
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_637_MSG_010");	// �u�A���Z�X�́@���̃��e�B�X�Ł@���Ȃ���
	KeyInputWait_();
	//===============================================
	// *���i�[�e
	//-----------------------------------------------
	ShowMsg_("DEMO_637_MSG_020");	// �u�A���Z�X�̎v���@�󂯎���Ă����āc�c�B
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_XL);													// ���i�ҋ@
	Wait_(30);


	//��������������������������������������
	//���J�b�g2 ��@���i
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	Wait_(10);

	//===============================================
	// *�e���W�A
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");	
	ShowMsg_("DEMO_637_MSG_030");	// �u��󃉃C�h���g���ۂɂ́@���܂Œʂ�
	Wait_(3);
	SetMotion_(player, player_look_up_L, BLEND_XL);											// ��@��ҋ@
	SetMotion_(rena, rena_look_up_L, BLEND_XL);												// ���i��ҋ@
	KeyInputWait_();
	//===============================================
	// *�e���W�A
	//-----------------------------------------------
	ShowMsg_("DEMO_637_MSG_040");	// �u�����ā@�t���C�g�V�O�i�����g����
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(10);


	//��������������������������������������
	//���J�b�g3 ��@���i�ɃY�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetMotion_(player, MOT_WAIT, BLEND_XL);													// ��@�ҋ@
	SetMotion_(rena, MOT_WAIT, BLEND_XL);													// ���i�ҋ@
	Wait_(30);
	SetMotion_(rena, rena_talk, BLEND_L);													// ���i�b��
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_L);

	//===============================================
	// *���i�[�e
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_637_MSG_050");	// �u���󃉃C�h���g����
	KeyInputWait_();
	//===============================================
	// *���i�[�e
	//-----------------------------------------------
	ShowMsg_("DEMO_637_MSG_060");	// �u�c�c�c���ꂽ���Ԃ́@�����Ȃ��B
	SetMotion_(rena, rena_look_down, BLEND_XL);												// ���i���ނ��ҋ@
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_XL);													// ���i�ҋ@
	WaitTask(task_cam);
	Wait_(20);

	SetMotion_(rena, MOT_WALK, BLEND_L);													// ���i����
	task_rena = Task_RotateToDir_(rena, 180, 5.7);	// ��]
	WaitTask(task_rena);
	task_rena = Task_MoveForward_(rena, 0.8, false);

	Wait_(50);
	DeleteTask_(task_rena);
	SetPointPos_(rena, "npc_renerte001");													// ���i�ړ�
	task_rena = Task_MoveForward_(rena, 0.9, false);


	//��������������������������������������
	//���J�b�g4 ���i�@�t���[���A�E�g
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(20);
	SetMotion_(player, MOT_WALK, BLEND_L);													// ��@����
	task_player = Task_MoveForward_(player, 0.8, false);
	Wait_(15);
	SetMotion_(rena, MOT_WAIT, BLEND_L);													// ���i��~
	Wait_(23);

	//===============================================
	// *�e���W�A
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");	
	ShowMsg_("DEMO_637_MSG_070");	// �u�c�c<name_player/>���܁B
	Wait_(12);
	DeleteTask_(task_rena);
	SetMotion_(player, player_sup, BLEND_L);												// ��@����
	DeleteTask_(task_player);
	WaitMotion(player);
	local pos = Vec3(1, 0.8, 0);
	efc_player = SurpriseDispSetOffset(player, pos, 0.6);									// [!]
	SetMotion_(player, player_sup_L, BLEND_L);												// ��@����
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(player, player_look_up_L, BLEND_XL);											// ��@��ҋ@
	Wait_(50);

	//===============================================
	// *�e���W�A
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");	
	ShowMsg_("DEMO_637_MSG_080");	// �u�}�U�[�E���i�[�e�̂��Ɓc�c
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//��������������������������������������
	//���J�b�g5 ��@�Y�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetMotion_(player, MOT_WAIT, BLEND_XL);										// ��@�ҋ@
	WaitTask(task_cam);
	SetMotion_(player, player_nod, BLEND_XL);									// ��@���ȂÂ�
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_N);										// ��@�ҋ@
	Wait_(30);
	SetMotion_(player, MOT_WALK, BLEND_L);										// ��@����
	task_player = Task_MoveForward_(player, 0.8, false);
	Wait_(20);

	EndDemo(FADE_COLOR_BLACK);
}
