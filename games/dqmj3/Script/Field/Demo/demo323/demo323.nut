//=============================================
//
//		demo323[�_�[�N�}�X�^�[�̒���_2]
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
	local task_cam, task_anse, task_rena, task_dark, task_birdy, task_snow00, task_snow01, task_snow02;
	local efc_player,efc_anse, efc_rena, efc_dark, efc_birdy, efc_mon, efc_cam, efc_fire;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local ansesu = GetPlayerId_();						// ��l���H(�A���Z�X)
	local model_rena = ReadNpc_("n007");				// �Ȃ��̏���(���i�[�e)
	local model_birdy = ReadNpc_("n019");				// �Ȃ��̒��i�o�[�f�B�j
	local model_dark = ReadNpc_("n008"); 				// �_�[�N�}�X�^�[
	
	// �����X�^�[
	local model_snowdragon = ReadNpc_("m015_01");		// �������イ
	
	// �G�t�F�N�g�ݒ�
	LoadEffect_("ef733_01_sym_shuchusen01");					// �W����
	LoadEffect_("ef721_03_nat_smoke_n03");				// ��
	LoadEffect_("ef832_01_fire");						// ������
	
// ���z�u
	// npc
	SetPointPos_(ansesu, "npc_ansesu000");								// ��l���i�A���Z�X�j
	SetStepSe_(ansesu, SILENT_STEP_SE);
	
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");		// �Ȃ��̏���(���i�[�e)
	SetStepSe_(rena, SILENT_STEP_SE);
	
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");		// �Ȃ��̒��i�o�[�f�B�j
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);				// �T�C�YN
	SetStepSe_(birdy, SILENT_STEP_SE);
	
	local dark = ArrangePointNpc_(model_dark, "npc_dark000");			// �_�[�N�}�X�^�[
	SetStepSe_(dark, SILENT_STEP_SE);
	
	// �����X�^�[
	local snow00 = ArrangePointNpc_(model_snowdragon, "npc_monster000");	// �������イ�O��E��
	SetStepSe_(snow00, SILENT_STEP_SE);
	SetScaleSilhouette(snow00, 0.8, 0.8);
	
	local snow01 = ArrangePointNpc_(model_snowdragon, "npc_monster100");	// �ł����������イ�E�^��
	SetStepSe_(snow01, SILENT_STEP_SE);
	SetScaleSilhouette(snow01, 2.0, 2.0);
	
	local snow02 = ArrangePointNpc_(model_snowdragon, "npc_monster200");	// �������イ�O��E�E
	SetStepSe_(snow02, SILENT_STEP_SE);
	SetScaleSilhouette(snow02, 0.8, 0.8);
	
	local snow03 = ArrangePointNpc_(model_snowdragon, "npc_monster300");	// �������イ���E�E
	SetStepSe_(snow03, SILENT_STEP_SE);
	SetScaleSilhouette(snow03, 1.0, 1.0);

	local snow04 = ArrangePointNpc_(model_snowdragon, "npc_monster400");	// �������イ���E��
	SetStepSe_(snow04, SILENT_STEP_SE);
	SetScaleSilhouette(snow04, 1.0, 1.0);
	
	// �G�t�F�N�g
	efc_fire = SetPointWorldEffect_("ef832_01_fire", "efc_fire000");

// ����풓���[�V�����Ǎ�
	// ����l���H(�A���Z�X)
	local anse_talk = ReadMotion_(ansesu, "Player_talk");												// �b��
	local anse_talk_L = ReadMotion_(ansesu, "Player_talk_L");											// �b��L
	local anse_wood_look_down = ReadMotion_(ansesu, "Player_wood_look_down_L");							// �؂ɂ������i���ނ��jL
	local anse_wood_look_flont = ReadMotion_(ansesu, "Player_wood_look_front_L");						// �؂ɂ������i��𐳖ʂɁjL
	local anse_hand_shoulder_L = ReadMotion_(ansesu, "Player_hand_shoulder_L");							// ���i�[�e�̌��Ɏ��u��L
	local anse_hand_shoulder_look_right_L = ReadMotion_(ansesu, "Player_hand_shoulder_look_right_L");	// ���i�[�e�̌��Ɏ��u���i�E�����jL
	local anse_caution01 = ReadMotion_(ansesu, "Player_caution01_L");									// �x��
	local anse_battle_L = ReadMotion_(ansesu, "Player_battle_L");										// �퓬�ҋ@
	local anse_battle_look_up_L = ReadMotion_(ansesu, "Player_battle01_L");								// �퓬�ҋ@�i�������j
	local anse_ride_on = ReadMotion_(ansesu, "Player_ride_on");											// ���C�h�I��
	local anse_ride_L = ReadMotion_(ansesu, "Player_ride00_L");											// ���C�hL
	local anse_look_up_L = ReadMotion_(ansesu, "Player_look_up_L");										// ������ҋ@L
	local anses_Player_flight_glide_L = ReadMotion_(ansesu, "Player_flight_glide_L");					// �O���C�hL
	local anses_glide_right_L = ReadMotion_(ansesu, "Player_flight_glide_right_L");						// ��s�i����j�E����

	// ���Ȃ��̏���(���i�[�e)
	local rena_right = ReadMotion_(rena, "n007_look_right_L");									// �E������
	local rena_left = ReadMotion_(rena, "n007_look_left_L");									// ��������
	local rena_sit_look_down_L = ReadMotion_(rena, "n007_sit_look_down_L");						// �ۑ��ɍ���i���ނ��jL	
	local rena_sit_look_up_L = ReadMotion_(rena, "n007_sit_look_up_L");							// �ۑ��ɍ���i��������jL	
	local rena_sit_look_left_L = ReadMotion_(rena, "n007_sit_look_left_L");						// �ۑ��ɍ���i���������jL	
	local rena_ride_hover = ReadMotion_(rena, "n007_ride_hovering_L");							// �z�o�����O���̃o�[�f�B�ɏ��(�A���Z�X�ɃA�^�b�`���K�v)
	local rena_ride = ReadMotion_(rena, "n007_ride_L");											// ���󎞂̃o�[�f�B�ɏ��(�A���Z�X�ɃA�^�b�`���K�v)
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");									// ���i�[�e������ҋ@

	
	// ���Ȃ��̒��i�o�[�f�B�j
	local birdy_idol = ReadMotion_(birdy, "n019_idol");										// �ҋ@L
	local birdy_before_flight = ReadMotion_(birdy, "n019_before_flight");					// �ҋ@����s�O
	local birdy_before_flight_L = ReadMotion_(birdy, "n019_before_flight_L");				// ��s�OL
	local birdy_flight_Hovering = ReadMotion_(birdy, "n019_flight_Hovering");				// �ҋ@����s(�z�o�����O)
	local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");			// ��s(�z�o�����O)L
	local birdy_glide_L = ReadMotion_(birdy, "n019_flight_glide_L");						// ����
	
	// ���_�[�N�}�X�^�[
	local dark_laugh = ReadMotion_(dark, "n008_laugh_L");							// �΂�L

// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ���F���ݒ�
	ChangeColorSepia();

// �����C�A�E�g
	LoadLayout_("noise");															// �m�C�Y
	
// ���������[�V����
	SetMotion_(ansesu, anse_wood_look_down, BLEND_N);								// �A���Z�X�؂ɂ������
	SetMotion_(rena, rena_sit_look_down_L, BLEND_N);								// ���i�[�e����
	SetMotion_(birdy, birdy_glide_L, BLEND_N);										// �o�[�f�B����
	SetVisible(birdy, false);														// �o�[�f�B��\��
	SetFace_(ansesu, "Face_loop_close");
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
//	ReadWaitingLod("lodeye000", "lodtgt000");
	SetPointCameraEye_("lodeye000");
	SetPointCameraTarget_("lodtgt000");
	
	//��������������������������������������
	//���J�b�g1 �����΁˃Y�[���A�E�g
	//��������������������������������������
	StartDemo(FADE_COLOR_WHITE);
	
	PlayBgm_("BG_AMBI_016");
	SetLayoutAnime_("noise_in", false);												// �m�C�Y
	WaitLayoutAnime();
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	SetLayoutAnime_("noise_out", false);											// �m�C�Y�A�E�g
	
	WaitTask(task_cam);
	Wait_(80);
	//��������������������������������������
	//���J�b�g2 �A���Z�X�A�b�v
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(ansesu, anse_wood_look_flont, BLEND_L);								// �A���Z�X����グ��
	SetFace_(ansesu, "Face_default");
	Wait_(20);
	//===============================================
	//*�A���Z�X
	//�u��ꂽ���H
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(40);
		
	//��������������������������������������
	//���J�b�g3 ���i�A�b�v
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(rena, rena_sit_look_up_L, BLEND_L);							// ���i�[�e����グ��
	Wait_(20);
	//===============================================
	//���Ȃ��̏���
	//�u�c�c�������B
	//�@����Ȃ��Ƃ́c�c�Ȃ����ǁc�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL"); 
	ShowMsg_("DEMO_323_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(40);
	
	//��������������������������������������
	//���J�b�g4 �A���Z�X�A���i�ɐڋ�
	//��������������������������������������
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(ansesu, MOT_WAIT, BLEND_XL);										// �A���Z�X�ҋ@
	
	Wait_(30);
	SetMotion_(ansesu, MOT_WALK, BLEND_M);										// �A���Z�X����
	task_anse = Task_MoveForward_(ansesu, 1.0, false);
	
	Wait_(30);
	DeleteTask_(task_anse);
	
	//��������������������������������������
	//���J�b�g5 �A���Z�X�������V�[��
	//��������������������������������������
	SetPointPos_(ansesu, "npc_ansesu001");										// �A���Z�X�ړ�
	task_anse = Task_MoveForward_(ansesu, 1.0, false);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	Wait_(25);
	DeleteTask_(task_anse);
	SetMotion_(ansesu, anse_hand_shoulder_L, BLEND_XL);							// �A���Z�X���|��

	Wait_(40);
	//===============================================
	//*�A���Z�X
	//�u�����́@���Ȃ��Ă����B
	//�@�̐S�ȂƂ��Ɂ@�|���ꂽ�獢��B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_030");
	KeyInputWait_();

	
	//-----------------------------------------------
	//�u�I���Ɓ@���O�́@�ӂ��肪������ĂȂ���
	//�@�}�U�[���@�ǂ��ɂ����邱�Ƃ́@����������ȁB
	//-----------------------------------------------
	ShowMsg_("DEMO_323_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	Wait_(30);
	
	//��������������������������������������
	//���J�b�g6 ��ꂽ�A���Z�X
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");

	Wait_(30);
	SetFace_(ansesu, "Face_loop_close");										// �A���Z�X�ڕ�
	//===============================================
	//*�A���Z�X	
	//�u����Ɂc�c�I�����@������ꂽ�B
	//�@�����̂Ƃ���@�킢���ςȂ�����������ȁB
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);

	StartDecayEarthQuake_(20, 3, 1)												// �n�k

	Wait_(25);
	
	//��������������������������������������
	//���J�b�g7 �Y�[���A�E�g�{�n�k
	//��������������������������������������
	SetFace_(ansesu, "Face_default");											// �A���Z�X�ڊJ��
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	SetMotion_(ansesu, anse_hand_shoulder_look_right_L, BLEND_L);				// �A���Z�X�E������
	SetMotion_(rena, rena_sit_look_left_L, BLEND_L);							// ���i�[�e��������

	WaitTask(task_cam);
	Wait_(10);
	StartDecayEarthQuake_(20, 3, 1)												// �n�k

	Wait_(40);
	StartDecayEarthQuake_(20, 3, 1)												// �n�k
	Wait_(40);
	
	//��������������������������������������
	//���J�b�g8 �u���C�N�����X�^�[�̏W�c
	//��������������������������������������
	SetPointPos_(ansesu, "npc_ansesu002");										// �A���Z�X�ړ�
	SetPointPos_(rena, "npc_renerte001");										// ���i�[�e�ړ�
	SetMotion_(ansesu, MOT_WAIT, BLEND_N);										// �A���Z�X�ҋ@
	SetMotion_(rena, MOT_WAIT, BLEND_N);										// ���i�ҋ@

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	Wait_(20);
	SetMotion_(snow01, MOT_LIFE_SPECIAL_2, BLEND_XL);							// �ጴ���@�^�񒆁@�i����

	SetMotion_(snow00, MOT_WALK, BLEND_M);										// �ጴ���@���E�@����
	SetMotion_(snow02, MOT_WALK, BLEND_M);
	task_snow00 = Task_MoveForward_(snow00, 1.5, false);
	task_snow02 = Task_MoveForward_(snow02, 1.3, false);
	
	Wait_(30);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);						// �W����
	WaitMotion(snow01);
	SetMotion_(snow01, MOT_WAIT, BLEND_L);
	DeleteEffectEmitter_(efc_cam);
	
	WaitTask(task_cam);

	Wait_(5);
	DeleteTask_(task_snow02);
	SetMotion_(snow02, MOT_WAIT, BLEND_L);
	
	Wait_(20);
	DeleteTask_(task_snow00);
	SetMotion_(snow00, MOT_WAIT, BLEND_L);

	Wait_(30);	
	//��������������������������������������
	//���J�b�g9 �A���Z�X�A���i�[�e
	//��������������������������������������
	SetPointPos_(rena, "npc_renerte002");											// ���i�[�e�ړ�
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	//===============================================
	//*�A���Z�X
	//�u����ȂƂ���ɂ܂Łc�c�I
	//�@�܂������@�������z�炾���I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(ansesu, anse_look_up_L, BLEND_L);								// �A���Z�X������ҋ@
	SetMotion_(rena, rena_look_up_L, BLEND_L);										// ���i�����
	
	SetVisible(birdy, true);														// �o�[�f�B�\��
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy000");						// �o�[�f�B�A�j���i�e�̂ݕ\���j
	
	WaitTask(task_birdy);
	Wait_(50);	
	
	//��������������������������������������
	//���J�b�g10 �o�[�f�B�̓o��V�[��
	//��������������������������������������
	SetMotion_(ansesu, MOT_WAIT, BLEND_N);											// �A���Z�X�ҋ@
	SetMotion_(rena, MOT_WAIT, BLEND_N);											// ���i�ҋ@

	SetPointPosNoFit_(birdy, "npc_birdy001");										// ���ړ�
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy001");						// �o�[�f�B�~��
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	Wait_(5);
	
	SetMotion_(birdy, birdy_flight_Hovering, BLEND_L);								// �o�[�f�B�z�o�����O
	WaitMotion(birdy);
	SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_L);							// �o�[�f�B�z�o�����OL
	
	WaitTask(task_cam);
	efc_birdy = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", birdy, ATTACH_GLOBAL);		// ��
	SetEffectScale_(efc_birdy, 2.0);

	Wait_(15);
	DeleteTask_(task_birdy);
	SetMotion_(birdy, birdy_idol, BLEND_XL);										// �o�[�f�B�ҋ@
	
	Wait_(50);
	
	//��������������������������������������
	//���J�b�g11 �A���Z�X�A�b�v
	//������������������������������������
	SetVisible(birdy, false);														// �o�[�f�B��\��
	SetMotion_(ansesu, anse_caution01, BLEND_N);									// �A���Z�X�x��
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);							// �W����

	//===============================================
	//*�A���Z�X
	//�u�ゾ�I�@��ׁ@�o�[�f�B�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	DeleteEffectEmitter_(efc_cam);

	//��������������������������������������
	//���J�b�g12 ���ɂ�
	//��������������������������������������
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 50);										// �t�F�[�h�C���E�A�E�g
	//-------------------------------------------------------------------------------------------------------------
	WaitFade_();
	Wait_(20);
	
	SetPointPosNoFit_(birdy, "npc_birdy002");										// ���ړ�
	SetPointPosNoFit_(rena, "npc_birdy002");										// ���ړ�
	SetVisible(birdy, true);														// �o�[�f�B�\��
	
	SetMotion_(birdy, birdy_glide_L, BLEND_N);										// �o�[�f�B�O���C�hL
	SetMotion_(ansesu, anses_Player_flight_glide_L, BLEND_N);										// �A���E���i�@���C�h���[�V����
	SetMotion_(rena, rena_ride, BLEND_N);

	AttachObject_(birdy, ansesu, ATTACH_EFFECT2);									// �A���˃o�[�f�B�ɃA�^�b�`
	AttachObject_(ansesu, rena, ATTACH_GLOBAL);										// ���i�˃A���Z�X�ɃA�^�b�`
	
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy002");						// �o�[�f�B�A�j��
	task_rena = Task_AnimeMoveNoFit_(rena, "anm_birdy002");

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	//-------------------------------------------------------------------------------------------------------------
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);

	Wait_(130);
	
	//===============================================
	//���Ȃ��̏���
	//�u�c�c�G�́@�s���͈͂��@�ŋ߂͂₯��
	//�@�L�����Ă���@�C�������c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL"); 
	ShowMsg_("DEMO_323_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	SetMotion_(ansesu, anses_glide_right_L, BLEND_XL);
	SetFace_(ansesu, "Face_right");
	Wait_(10);
	//===============================================
	//*�A���Z�X
	//�u���ꂾ���@�G�́c�c�}�U�[�ƃ_
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_090");
	Wait_(30);
	CloseMsgWnd_();
	//===============================================
	StopBgm_(3);
	PlaySE_("SE_DEM_126");
	SetLayoutAnime_("noise_in", false);												// �m�C�Y
	WaitLayoutAnime();
	SetLayoutAnime_("noise_loop", false);											// �m�C�Y���[�v

	DeleteTask_(task_cam);
	DeleteTask_(task_birdy);

	//��������������������������������������
	//���J�b�g13 �_�[�N�}�X�^�[
	//��������������������������������������
	SetSepiaColor_(false);															// �Z�s�A����
	SetBgBlack_(true);																// ��ʔw�i�������܂�
	PlayBgm_("BGM_008");
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");

	SetMotion_(dark, dark_laugh, BLEND_N);											// �_�N�}�X�΂�
	
	//===============================================
	//*�_�[�N�}�X�^�[
	//�u�c�c�������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_100");
	SetLayoutAnime_("noise_out", false);							// �m�C�Y�A�E�g
	KeyInputWait_();

	//�u�v���Ԃ肾�ȁc�c�B	
	ShowMsg_("DEMO_323_MSG_110");
	SetMotion_(dark, MOT_WAIT, BLEND_XL);											// �_�N�}�X�ҋ@
	KeyInputWait_();
	
	//�u�䂪���́@�_�[�N�}�X�^�[�B
	SetMotion_(dark, MOT_TALK, BLEND_L);												// �_�N�}�X�b��
	WaitMotion(dark);
	SetMotion_(dark, MOT_TALKLOOP, BLEND_M);											// �_�N�}�X�b��
	ShowMsg_("DEMO_323_MSG_120");
	KeyInputWait_();

	//�u�ǂ����c�c���̊y���́@�s���������悤���ȁB
	SetMotion_(dark, MOT_WAIT, BLEND_XL);											// �_�N�}�X�ҋ@
	SetTalkName_("NAME_TAG_DARKMASTER"); 
	ShowMsg_("DEMO_323_MSG_130");
	KeyInputWait_();

	//�u�ǂ����@�A�ꂾ�����̂́@���̏����낤���c�c
	SetMotion_(dark, dark_laugh, BLEND_L);											// �_�N�}�X�΂�
	ShowMsg_("DEMO_323_MSG_140");
	KeyInputWait_();
	WaitLayoutAnime();
	
	//�u�����c�c����Ł@�������������Ǝv���ȁB
	SetMotion_(dark, MOT_WAIT, BLEND_XL);											// �_�N�}�X�ҋ@
	ShowMsg_("DEMO_323_MSG_150");
	KeyInputWait_();

	//�u����@����ā@�҂��Ă��邪�����B
	SetMotion_(dark, dark_laugh, BLEND_L);											// �_�N�}�X�΂�
	ShowMsg_("DEMO_323_MSG_160");	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	PlaySE_("SE_DEM_126");
	SetLayoutAnime_("noise_in", false);												// �m�C�Y
	WaitLayoutAnime();
	SetLayoutAnime_("noise_loop", true);											// �m�C�Y���[�v	
	
	Wait_(15);

	EndDemo(FADE_COLOR_WHITE);
}
