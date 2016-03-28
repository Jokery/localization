//=============================================
//
//		demo505[��ׂȂ��I]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------

function Task_Rot3(chr, rot, frm)
{

//�����v���@���Z
//���v���@���Z

	local dir = GetDir_(chr);
	local sita = dir+rot;
	local sita2 = sita-dir;

	if( sita2 <= 0 ){
		sita2 = sita2*-1;
	}

	local frm2 = sita2/frm;
	local task = Task_RotateToDir_(chr, sita, frm2);

	return task;
}


function Update()
{

// ���ϐ���`
	local task_cam, task_player;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player	 = GetPlayerId_();					// ��l��
	local n_birdy	 = ReadNpc_("n019");				// �o�[�f�B
	// �M�~�b�N
	local gi_kabe	 = ReadGimmick_("o_V00_03");
	local gi_souti	 = ReadGimmick_("o_V00_11");
	// �G�t�F�N�g
	LoadEffect_("ef850_01_smoke_fall");					// �ė���
	LoadEffect_("ef821_01_smoke_stone");				// ���n��
	LoadEffect_("ef721_03_nat_smoke_n03");				// ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	task_player		 = Task_AnimeMoveNoFit_(player, "player_anm001");
	DeleteTask_(task_player);
	// �o�[�f�B
	local birdy		 = ArrangePointNpc_(n_birdy, "birdy");
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);
	SetStepSe_(birdy, "SE_FLD_032");
	SetStepSePan_(birdy, false);
	// �M�~�b�N
	local g_kabe	 = ArrangePointGimmick_("o_V00_03", gi_kabe, "kabe");
	local g_souti	 = ArrangeGimmick_("o_V00_11", gi_souti, Vec3(-1371, 897, 1107));
	SetDir_(g_souti, 68);

// ����풓���[�V�����Ǎ�
	local p_tya			 = ReadMotion_(player, "Player_hero_landing");				// ���n
	local p_migi		 = ReadMotion_(player, "Player_look_right_L");				// �E�����ҋ@
	local p_hidari		 = ReadMotion_(player, "Player_look_left_L");				// �E�����ҋ@
	local p_ride		 = ReadMotion_(player, "Player_ride00_L");					// ���C�h
	local p_taikihikou	 = ReadMotion_(player, "Player_flight_Hovering");			// �ҋ@���z�o�����O
	local p_hoba		 = ReadMotion_(player, "Player_flight_Hovering_L");			// �z�o�����OL
	local p_kakku		 = ReadMotion_(player, "Player_flight_glide_L");			// ����

	local b_hikoumae	 = ReadMotion_(birdy, "n019_before_flight");				// �ҋ@����s�O
	local b_hikoumael	 = ReadMotion_(birdy, "n019_before_flight_L");				// ��s�OL
	local b_taikihikou	 = ReadMotion_(birdy, "n019_flight_Hovering");				// �ҋ@����s(�z�o�����O)
	local b_hoba		 = ReadMotion_(birdy, "n019_flight_Hovering_L");			// ��s(�z�o�����O)L
	local b_kakku		 = ReadMotion_(birdy, "n019_flight_glide_L");				// ��s(����)L
	local b_tuiraku		 = ReadMotion_(birdy, "n019_flight_fall");					// ��s(�ӂ�ӂ�)���ė�
	local b_why			 = ReadMotion_(birdy, "n019_why");							// �񂩂���
	local b_idol		 = ReadMotion_(birdy, "n019_idol");							// �ҋ@
	local b_talk		 = ReadMotion_(birdy, "n019_talk");							// ��b

	SetMotion_(birdy, b_hoba, 1);
	local task_birdy	= Task_AnimeMoveNoFit_(birdy, "birdy_anm001");

// ���V��ݒ�
	SetWeather_(WEATHER.BAD);

	//��������������������������������������
	//���J�b�g�P
	//��������������������������������������

	// ���J�����ݒ�
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	local task_fly = Task_PlaySe_("SE_FLD_036", 26);

	WaitTask(task_birdy);
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(birdy), 5.0);
	SetMotion_(player, MOT_WALK, 4);
	WaitTask(task_kaiwa);
	SetMotion_(player, MOT_WAIT, 4);

	//===============================================
	//*�o�[�f�B
	// 	�u�w�[�C�@�A���Z�[�X�I�@�҂��Ă��l�[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_505_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local task = Task_RotateToDir_(birdy, 66, 3);
	SetMotion_(player, p_hidari, BLEND_XL);
	WaitTask(task);
	Wait_(30);
	SetVisible(birdy, false);


	//��������������������������������������
	//���J�b�g�Q
	//��������������������������������������
	DeleteTask_(task_fly);

	task_cam	 = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");

	local task_kaiwa = Task_RotateToPos_(birdy, GetPos_(player), 100.0);
	WaitTask(task_cam);
	Wait_(30);
	SetVisible(birdy, true);
	local task_fly = Task_PlaySe_("SE_FLD_036", 26);


	//��������������������������������������
	//���J�b�g�R
	//��������������������������������������

	SetPointCameraEye_("003_cameye");
	SetPointCameraTarget_("003_camtgt");

	//===============================================
	//*�o�[�f�B
	// 	�u�����I�@�����~�[�Ɂ@���C�h����f�[�X�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_505_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local task_kaiwa = Task_Rot3(birdy, 140, 60);
	WaitTask(task_kaiwa);
	task_birdy	= Task_AnimeMoveNoFit_(birdy, "birdy_anm002");
	WaitTask(task_birdy);
	DeleteTask_(task_fly);
	
	task_player = Task_AnimeMoveNoFit_(player, "player_anm001");
	SetMotion_(player, MOT_WALK, BLEND_M);
	SetMotion_(birdy, b_hikoumael, BLEND_XL);
	Wait_(10);
	
	PlaySE_("SE_FLD_032");
	local efc_birdy = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", birdy, ATTACH_GLOBAL);		//��
	SetEffectScale_(efc_birdy, 0.8);
	Wait_(35);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	Wait_(30);
	SetVisible(player, false);
	SetVisible(birdy, false);
	Wait_(1);
	SetVisible(birdy, true);
	Wait_(1);
	SetVisible(player, true);
	Wait_(1);
	AttachObject_(birdy, player, ATTACH_EFFECT2);
	SetMotion_(player, p_ride, BLEND_N);
	task_birdy = Task_AnimeMoveNoFit_(birdy, "birdy_anm003");
	DeleteTask_(task_birdy);
	Wait_(1);


	//��������������������������������������
	//���J�b�g�S
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("004_anmeye", "004_anmtgt");

	DeleteTask_(task_cam);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);

	//===============================================
	//*�o�[�f�B
	// 	�u�I�[�P�B�I�@�ł͂ł́c�c��у}�[�X�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_505_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("004_anmeye", "004_anmtgt");

	PlaySE_("SE_DEM_130");											//��SE:�o�[�f�B������s
	task_birdy = Task_AnimeMoveNoFit_(birdy, "birdy_anm003");
	SetMotion_(birdy, b_taikihikou, 16);
	SetMotion_(player, p_taikihikou, 16);
	WaitMotion(birdy);
	SetMotion_(birdy, b_hoba, 16);
	SetMotion_(player, p_hoba, 16);
	WaitTask(task_birdy);
	SetMotion_(birdy, b_kakku, 16);
	SetMotion_(player, p_kakku, 16);
	task_birdy = Task_AnimeMoveNoFit_(birdy, "birdy_anm0031");
	WaitTask(task_birdy);
	task_birdy = Task_AnimeMoveNoFit_(birdy, "birdy_anm0032");
	Wait_(60);
	DeleteTask_(task_birdy);
	DeleteTask_(task_cam);
	task_birdy = Task_AnimeMoveNoFit_(birdy, "birdy_anm004");
	Wait_(1);


	//��������������������������������������
	//���J�b�g�T�@�o�[�f�B�ė�
	//��������������������������������������

	SetPointCameraEye_("007_cameye");
	SetPointCameraTarget_("007_camtgt");

	Wait_(5);
	PlaySE_("SE_DEM_131");											//��SE:�o�[�f�B�ė�	
	Wait_(25);
	SetMotion_(birdy, b_tuiraku, BLEND_M);
	Wait_(30);
	local efc = SetSelectBoneEffectSetOffset_("ef850_01_smoke_fall", birdy, ATTACH_GLOBAL, Vec3(0,0,0));
	StartDecayEarthQuake_(30,3,1);
	Wait_(5);
	SetAlpha_(player, ALPHA_CLEAR);
	DetachObject_(birdy);
	WaitTask(task_birdy);
	Wait_(30);
	DeleteEffectEmitter_(efc,10);
	SetVisible(birdy, false);
	SetStepSe_(player, SILENT_STEP_SE);


	//��������������������������������������
	//���J�b�g�U�@��l�����n
	//��������������������������������������

	SetPointCameraEye_("008_cameye");
	SetPointCameraTarget_("008_camtgt");

	PlaySE_("SE_DEM_132");											//��SE:��@���n
	SetAlpha_(player, ALPHA_EXIST);
	task_player = Task_AnimeMoveNoFit_(player, "player_anm002");
	SetMotion_(player, MOT_JUMP_DOWN, BLEND_M);
	Wait_(18);
	SetMotion_(player, p_tya, BLEND_M);
	Wait_(2);
	StartDecayEarthQuake_(15,3,0.5);
	local efc = SetSelectBoneEffectSetOffset_("ef850_01_smoke_fall", player, ATTACH_GLOBAL, Vec3(0,0,0));
	SetEffectScale_(efc, 0.3);
	WaitTask(task_player);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	Wait_(30);
	DeleteEffect_(efc);
	SetVisible(birdy, true);
	SetMotion_(birdy, b_hikoumael, 1);
	task_birdy = Task_AnimeMove_(birdy, "birdy_anm005");
	DeleteTask_(task_birdy);
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(birdy), 100.0);
	local task_kaiwa = Task_RotateToPos_(birdy, GetPos_(player), 100.0);
	WaitTask(task_kaiwa);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	ResetStepSe_(player);


	//��������������������������������������
	//���J�b�g�V
	//��������������������������������������

	SetPointCameraEye_("009_cameye");
	SetPointCameraTarget_("009_camtgt");

	SetMotion_(birdy, b_idol, BLEND_XL);
	Wait_(45);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	SetMotion_(birdy, b_why, BLEND_XL);
	WaitMotion(birdy);
	SetMotion_(birdy,b_talk , BLEND_XL);

	//===============================================
	//*�o�[�f�B
	// 	�u�z�b���[�C�I�H�@�ǂ�����������l�[�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_505_MSG_040");
	KeyInputWait_();
	
	//-----------------------------------------------
	//*�o�[�f�B
	// 	�u�I�[�m�[�I�@���������ăA���Z�X�I
	//-----------------------------------------------
	ShowMsg_("DEMO_505_MSG_050");
	KeyInputWait_();
	
	//-----------------------------------------------
	//*�o�[�f�B
	// 	�u�m�c�c�m�[�v���u�����f�[�X�I�@������
	//-----------------------------------------------
	ShowMsg_("DEMO_505_MSG_060");
	KeyInputWait_();
	
	//-----------------------------------------------
	//*�o�[�f�B
	// 	�u�S�z�̓i�b�V���O�I
	//-----------------------------------------------
	ShowMsg_("DEMO_505_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(birdy, MOT_WALK, BLEND_L);
	local tsk = Task_Rot3(birdy, 80, 45);
	WaitTask(tsk);
	task_birdy = Task_AnimeMove_(birdy, "birdy_anm005");
	Wait_(10);
	SetMotion_(player, p_migi, BLEND_L);
	Wait_(40);

	EndDemo(FADE_COLOR_BLACK);
}
