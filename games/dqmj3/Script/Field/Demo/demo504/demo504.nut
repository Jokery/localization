//=============================================
//
//		demo504[�T�C���X�̃o�[�f�B]
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
	local task_cam, task_player, task_birdy;
	local task_player_step;
	local efc_cam, efc_player, efc_birdy;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();										// ��l��
	local model_birdy = ReadNpc_("n019");								// �o�[�f�B
	// �G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");									// �W����
	LoadEffect_("ef721_03_nat_smoke_n03");								// ��
	LoadEffect_("ef712_10_emo_surprise01");								// �����u�I�v
	LoadEffect_("ef712_04_emo_joy01");									// ��сu��v

// ���z�u
	SetPointPos_(player, "player000");									// ��l��
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");		// �o�[�f�B
	SetPointPosNoFit_(birdy, "npc_birdy000");
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);				// �T�C�YN
	SetVisible(birdy, false);											// �o�[�f�B��\��

// ����풓���[�V�����Ǎ�
	//��l��
	local player_talk = ReadMotion_(player, "Player_talk");									// �b��
	local player_talk_L = ReadMotion_(player, "Player_talk_L");								// �b��L
	local player_look_walk = ReadMotion_(player, "Player_look_walk_L");						// �L�����L��������
	local player_turn = ReadMotion_(player, "Player_turn_L");								// �U��Ԃ�
	local player_sup = ReadMotion_(player, "Player_surprise");								// ����
	local player_sup_L = ReadMotion_(player, "Player_surprise_L");							// ����L

	//�o�[�f�B
	local birdy_idol = ReadMotion_(birdy, "n019_idol");										// �ҋ@L
	local birdy_flight_Hovering = ReadMotion_(birdy, "n019_flight_Hovering");				// �ҋ@����s(�z�o�����O)
	local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");			// ��s(�z�o�����O)L
	local birdy_glide_L = ReadMotion_(birdy, "n019_flight_glide_L");						// ����
	local birdy_run_L = ReadMotion_(birdy, "n019_run_L");									// ����
	local birdy_talk = ReadMotion_(birdy, "n019_talk");										// �b��
	local birdy_why = ReadMotion_(birdy, "n019_why");										// �����������
	local birdy_wing_Appeal = ReadMotion_(birdy, "n019_wing_Appeal");						// ���߃|�[�Y
	local birdy_wing_Appeal_L = ReadMotion_(birdy, "n019_wing_Appeal_L");					// ���߃|�[�YL
	local birdy_angry = ReadMotion_(birdy, "n019_angry");									// �{��
	local birdy_angry_L = ReadMotion_(birdy, "n019_angry_L");								// �{��L

	//�������[�V����
	SetMotion_(player, player_look_walk, BLEND_N);											// ��@�L��������
	SetMotion_(birdy, birdy_glide_L, BLEND_N);												// ���@����

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	//��������������������������������������
	//���J�b�g1 ��l���u������܂��܂��v
	//��������������������������������������

	StartDemo(FADE_COLOR_BLACK);
	Wait_(55);
	
	task_player = Task_MoveForward_(player, 1.0, false);
	task_player_step = Task_ChangeStepSe(player, "SE_FLD_015", 20);
	Wait_(120);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);													// ��@�ҋ@
	DeleteTask_(task_player);
	DeleteTaskStepSe(player, task_player_step);

	Wait_(30);
	SetVisible(birdy, true);																// �o�[�f�B�\��
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy000");								// �o�[�f�B�A�j���i�e�̂ݕ\���j
	local task_fly = Task_PlaySe_("SE_FLD_036", 26);
	WaitTask(task_birdy);

	SetMotion_(birdy, birdy_flight_Hovering, BLEND_L);										// �o�[�f�B�z�o�����O
	WaitMotion(birdy);
	SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_L);									// �o�[�f�B�z�o�����OL

	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy001");								// �o�[�f�B�A�j��
	Wait_(65);
	WaitTask(task_birdy);
	Wait_(15);
	DeleteTask_(task_birdy);

	//===============================================
	//*�o�[�f�B
	// 	�}�C�z�[���ɂ���@���[�͒N�f�[�X�H
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_504_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);
	SetPointPos_(player, "player001");														// ��l���ړ�


	//��������������������������������������
	//���J�b�g2 ��l���A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(10);
	local pos_pl = Vec3(-0.8, 2.6, 0.0);													//player�u�I�v�̈ʒu
	efc_player = SurpriseDispSetOffset(player, pos_pl, 0.4);								// �u�I�v
	Wait_(10);
	SetMotion_(player, player_turn, BLEND_L);												// ��@�U��Ԃ�
	SetPointPos_(birdy, "npc_birdy001");													// ���ړ�
	Wait_(50);
	SetPointPos_(player, "player002");														// ��l���ړ�


	//��������������������������������������
	//���J�b�g3 �o�[�f�B�o��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");								//140F�ŃY�[���A�E�g

	SetMotion_(birdy, birdy_idol, BLEND_XL);												//�o�[�f�B�ҋ@
	DeleteTask_(task_fly);
	Wait_(15);

	StartDecayEarthQuake_(20, 3, 1)															//�n�k
	PlaySE_("SE_DEM_014");
	efc_birdy = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", birdy, ATTACH_GLOBAL);		//��
	SetEffectScale_(efc_birdy, 0.8);
	Wait_(125);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);									//�W����
	WaitTask(task_cam);

	//===============================================
	//*�o�[�f�B
	// 	�u�}�C�t���[�[�[���h�b�I�I
	//-----------------------------------------------
	SetMotion_(birdy, birdy_wing_Appeal, BLEND_L)												//���@���߃|�[�Y
	WaitMotion(birdy); 
	OpenMsgWnd_();
	ShowMsg_("DEMO_504_MSG_020");
	SetMotion_(birdy, birdy_wing_Appeal_L, BLEND_N)												//���@���߃|�[�Y
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(20);
	DeleteEffectEmitter_(efc_cam);

	SetMotion_(birdy, birdy_run_L, BLEND_M);												// ������
	task_birdy = Task_MoveForward_(birdy, 1.0, true);

	local task_birdy_step = Task_ChangeStepSe(birdy, "SE_FLD_032", 10);						//�o�[�f�B����
	Wait_(20);
	DeleteTaskStepSe(birdy, task_birdy_step);

	DeleteEffect_(efc_cam);
	DeleteTask_(task_birdy);
	SetMotion_(player, MOT_WAIT, BLEND_N);													// ��@�ҋ@
	SetDir_(player, 90);
	SetPointPos_(birdy, "npc_birdy001");													// ���ړ�


	//��������������������������������������
	//���J�b�g4 �o�[�f�B�Ǝ�l��
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	task_birdy = Task_MoveForward_(birdy, 1.0, true);	
	local task_birdy_step = Task_ChangeStepSe(birdy, "SE_FLD_032", 10);						//�o�[�f�B����
	Wait_(15);
	DeleteTask_(task_birdy);
	DeleteTaskStepSe(birdy, task_birdy_step);

	SetMotion_(birdy, birdy_idol, BLEND_L);													//�o�[�f�B�ҋ@
	SetMotion_(player, player_sup, BLEND_M)													//��@����
	WaitMotion(player); 
	SetMotion_(player, player_sup_L, BLEND_M)
	Wait_(10);
	SetMotion_(birdy, birdy_talk, BLEND_XL);												//�o�[�f�B�b��

	//===============================================
	//*�o�[�f�B
	// 	�u��[���Ɩ߂��Ă����l�[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_504_MSG_030");
	KeyInputWait_();
	//===============================================
	//*�o�[�f�B
	// 	�u���x���W�̏����́@���ł��I�[�P�B�I
	//-----------------------------------------------
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_504_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	SetMotion_(player, player_talk, BLEND_XL)												//��@�b��L
	SetMotion_(birdy, birdy_idol, BLEND_XL);												//�o�[�f�B�ҋ@
	WaitMotion(player); 
	Wait_(1);
	SetMotion_(player, player_talk_L, BLEND_M)
	Wait_(60);
	SetVisible(player, false);																// ��@��\��
	SetPointPos_(birdy, "npc_birdy002");													// ���ړ�


	//��������������������������������������
	//���J�b�g5 �o�[�f�B�ⓚ
	//��������������������������������������

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	Wait_(20);
	SetMotion_(birdy, birdy_why, BLEND_L);													//�o�[�f�B�u�H�v
	WaitMotion(birdy);
	SetMotion_(birdy, birdy_talk, BLEND_L);													//�o�[�f�B�b��
	SetMotion_(player, MOT_WAIT, BLEND_N);													// ��@�ҋ@

	//===============================================
	//*�o�[�f�B
	// 	�I�[�I�@�ςȂ��Ɓ@�����܂��l�[�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_504_MSG_050");
	KeyInputWait_();
	//===============================================


		// �y�͂��̏ꍇ�F�P�z
		if (GetQueryResult_() == QUERY2_0) {

			//===============================================
			//*�o�[�f�B
			// 	�u�I�[�m�[�I�@�ł��m�[�v���u�����I
			//-----------------------------------------------
			ShowMsg_("DEMO_504_MSG_060");
			SetMotion_(birdy, birdy_angry, BLEND_L)													//���@�{��
			WaitMotion(birdy); 
			SetMotion_(birdy, birdy_angry_L, BLEND_M)												//���@�{��
			KeyInputWait_();
			//===============================================
			//*�o�[�f�B
			// 	�u�~�[�ɏ���ā@����t���C�����
			//-----------------------------------------------
			ShowMsg_("DEMO_504_MSG_070");
			SetMotion_(birdy, birdy_wing_Appeal, BLEND_L)											//���@���߃|�[�Y
			WaitMotion(birdy); 
			SetMotion_(birdy, birdy_wing_Appeal_L, BLEND_N)											//���@���߃|�[�Y
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
			Wait_(30);
		}

		// �y�������̏ꍇ�F�P�z
		else {
			//===============================================
			//*�o�[�f�B
			// 	�u����ł����@�~�[�̐e�F�l�[�I
			//-----------------------------------------------
			SetMotion_(birdy, birdy_talk, BLEND_L);													//�o�[�f�B�b��
			efc_birdy = SetSelectBoneEffectSetOffset_("ef712_04_emo_joy01", birdy, ATTACH_EFFECT1, Vec3(0.0, 2.0, 0.0));	//��уG�t�F�N�g
			SetEffectScale_(efc_birdy, 2.5);

			ShowMsg_("DEMO_504_MSG_080");
			KeyInputWait_();
			//===============================================
			//*�o�[�f�B
			// 	�u���̗l�q�Ȃ�@���ł��@�t���C�g����
			//-----------------------------------------------
			ShowMsg_("DEMO_504_MSG_090");
			DeleteEffectEmitter_(efc_birdy); 
			SetMotion_(birdy, birdy_wing_Appeal, BLEND_L)											//���@���߃|�[�Y
			WaitMotion(birdy); 
			SetMotion_(birdy, birdy_wing_Appeal_L, BLEND_N)											//���@���߃|�[�Y
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================

			Wait_(30);

		}

	SetVisible(player, true);																	// ��@�\��


	//��������������������������������������
	//���J�b�g6 �o�[�f�B���E
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetMotion_(birdy, birdy_talk, BLEND_XL);													//�o�[�f�B�b��

	//===============================================
	//*�o�[�f�B
	// 	�u�����������ƂȂ�@�[���̓n���[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_504_MSG_100");
	KeyInputWait_();
	//===============================================
	//*�o�[�f�B
	// 	�u�R�A�Ƀt���C�g����Ȃ�@�G���s�X�R�l�[�I
	//-----------------------------------------------
	ShowMsg_("DEMO_504_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local task_birdy_step = Task_ChangeStepSe(birdy, "SE_FLD_032", 10);							//�o�[�f�B����
	Wait_(12);
	DeleteTaskStepSe(birdy, task_birdy_step);
	SetMotion_(birdy, birdy_run_L, BLEND_M);													// ������
	task_birdy = Task_RotateToDir_(birdy, 90, 10);												// ��]
	DeleteTaskStepSe(birdy, task_birdy_step);
	WaitTask(task_birdy);

	task_birdy = Task_MoveForward_(birdy, 1.0, true);
	local task_birdy_step = Task_ChangeStepSe(birdy, "SE_FLD_032", 10);							//�o�[�f�B����
	Wait_(70);
	DeleteTaskStepSe(birdy, task_birdy_step);
	WaitTask(task_cam);
	Wait_(40);

	EndDemo(FADE_COLOR_BLACK);
}
