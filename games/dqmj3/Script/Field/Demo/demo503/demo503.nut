//=============================================
//
//		demo503[���V�Ƃ̖ʉ�]
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
	local task_cam, task_player, task_elder;
	local efc_shuchusen;
	
// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();										// ��l��
	local model_elder = ReadNpc_("m076_02");							// ���V�i���񂶂���j
	local model_rock = ReadNpc_("m107_01");								// ���߁i���K�U�����b�N�j
	
	// �G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");									// �W����
	
	local pos_eld = Vec3(0, 0, 0);											//elder�u�I�v�̈ʒu
	local pos_pl = Vec3(0.8, 1.2, 0);										//player�u�I�v�̈ʒu

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	
	//NPC
	local elder = ArrangePointNpc_(model_elder, "npc_elder000");				// ���V �T�C�Y0.4
	SetScaleSilhouette(elder, SCALE.S, 0.3);

	local rock = ArrangePointNpc_(model_rock, "npc_rock000");					// ���� �T�C�Y0.6
	SetScaleSilhouette(rock, SCALE.N, SILHOUETTE_WIDTH.N);
	SetDirToObject_(rock, player);												// ���� ��l���̕�������

// ����풓���[�V�����Ǎ�
	
	//��l��
	local pl_talk = ReadMotion_(player, "Player_talk");							//	�b��
	local pl_talk_L = ReadMotion_(player, "Player_talk_L");						//	�b��L

	//���V
	local elder_wait = ReadMotion_(elder, "m076_02_wait_L");					//	�ҋ@
	
// ���������[�V����
	SetMotion_(elder, elder_wait, BLEND_N)										//���V�ҋ@
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	//��������������������������������������
	//���J�b�g1 ���A��A���Z�X
	//��������������������������������������
	
	StartDemo(FADE_COLOR_WHITE);
	
	Wait_(20);
	//===============================================
	//*���V
	// 	�u�A���Z�X����ƁH
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ELDER");
	ShowMsg_("DEMO_503_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*���V
	// 	�u����́@�₯�Ɏ��Ԃ��@���������悤����āB
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_020");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*���V
	// 	�u����Ƃ��@���L���Ɓ@����Ă����̂��́H
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	
	SetMotion_(player, pl_talk, BLEND_L)								//��@�b��L
	WaitMotion(player); 
	SetMotion_(player, pl_talk_L, BLEND_M)
	
	Wait_(50);
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g2 �y�ߕ�z���L������
	//��������������������������������������

	SetMotion_(player, MOT_WAIT, BLEND_N)
	SetVisible(player, false);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	Wait_(20);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_shuchusen = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);

	WaitTask(task_cam);
	
	//===============================================
	//*���V
	// 	�u�Ȃ�Ɓc�c���L�����@���񂾂���ƁH
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ELDER");
	ShowMsg_("DEMO_503_MSG_040");
	KeyInputWait_();
	//===============================================
	DeleteEffectEmitter_(efc_shuchusen);

	SetMotionSpeed_(elder, 0.4);													// ���[�V�������������ɂȂ�
	SetMotion_(elder, MOT_SPELL_CHARGE, BLEND_XL)									//���V�ӂ邦�i���@�r���j
	
	//===============================================
	//*���V
	// 	�u�c�c�ɂ����҂��@�S�������킢�B
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);
	
	//��������������������������������������
	//���J�b�g3 ��l���A�b�v
	//��������������������������������������
	SetVisible(player, true);
	SetVisible(elder, false);
	SetMotionSpeed_(elder, 1.0);													// ���[�V�������x�߂�
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	//===============================================
	//*���V
	// 	�u�������@�ł��Ă͂Ȃ�ʁB���ʂ��͓��ʁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ELDER");
	ShowMsg_("DEMO_503_MSG_060");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*���V
	// 	�u�s���g�̂��ʂ��Ȃ�@���ꂪ�ł���B
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(40);
	DeleteTask_(task_cam);

//	WaitTask(task_cam);
	
	//��������������������������������������
	//���J�b�g4 ���V�߂Â�
	//��������������������������������������
	SetVisible(elder, true);
	SetMotion_(elder, elder_wait, BLEND_N)								//���V�ҋ@

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(player, pl_talk, BLEND_L)								//��@�b��L
	WaitMotion(player); 
	SetMotion_(player, pl_talk_L, BLEND_M)
	
	Wait_(50);
	
	SetMotion_(elder, MOT_WALK, BLEND_M)								//���V�@�O�֏o��
	task_elder = Task_MoveForward_(elder, 0.9, false);
	Wait_(20);
	SetMotion_(elder, elder_wait, BLEND_L)								//���V�ҋ@
	DeleteTask_(task_elder);
	
	//===============================================
	//*���V
	// 	�u�ނށH�@�����̓A���Z�X����Ȃ��ƂȁH
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ELDER");
	ShowMsg_("DEMO_503_MSG_080");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*���V
	// 	�u���ʂ��́@�ǂ�����ǂ����Ă�
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(player, MOT_WAIT, BLEND_L)									//��@�ҋ@
	Wait_(30);
	
	//��������������������������������������
	//���J�b�g5 ���V�A�b�v
	//��������������������������������������
	SetVisible(player, false);

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
		
	//===============================================
	//*���V
	// 	�u�ӂށc�c�ǂ����Ł@���ł��ł������́H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ELDER");
	ShowMsg_("DEMO_503_MSG_100");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*���V
	// 	�u����ȂɁ@�����Ɏ��M�����ĂȂ��Ȃ�
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_110");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*���V
	// 	�u����̊������΁@���傢�ƃg�{����
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	
	//��������������������������������������
	//���J�b�g6 �o�[�f�B����ƂɃY�[���C��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	//===============================================
	//*���V
	// 	�u�����@�s���������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ELDER");
	ShowMsg_("DEMO_503_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(80);

	EndDemo(FADE_COLOR_BLACK);
}
