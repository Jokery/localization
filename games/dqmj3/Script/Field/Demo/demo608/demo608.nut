//=============================================
//
//		demo608[�����̌Z�̐���_2(�R�A)]
//
//=============================================


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
	
//	SetMotion_(chr, MOT_WALK, BLEND_M);
	local task = Task_RotateToDir_(chr, sita, frm2);
	
	return task;
}

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
	
// ���ϐ���`
	local task_cam, task_player, task_apa, task_kasya;
	local task_player_step;
	local efc_player, efc, efc_apa, efc_kasya;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player	 = GetPlayerId_();								// ��l��
	local id_rena	 = ReadNpc_("n007");
	local id_dark	 = ReadNpc_("n008");
	local id_kasya	 = ReadNpc_("m200_00");
	local id_apa	 = ReadNpc_("m201_00");
	
	local id_kemuriA = LoadEffect_("ef721_02_nat_smoke_n02");		// �Α���(-30, 650, 190)
	local id_kemuriB = LoadEffect_("ef850_01_smoke_fall");			// �ė���(35F~50F)
	
	local g_mother = ReadGimmick_("o_C03_02");
	local g_kazari = ReadGimmick_("o_C03_03");

// ���z�u
	// ��l��
	SetPointPos_(player, "player");
	local rena	 = ArrangePointNpc_(id_rena, "rena");
	SetStepSePan_(rena, false);
	local dark	 = ArrangePointNpc_(id_dark, "dark");
	local apa	 = ArrangePointNpc_(id_apa, "apa");
	local kasya	 = ArrangePointNpc_(id_kasya, "kasya");
	SetScaleSilhouette(kasya, 0.8, 0.8);
	SetVisible(apa, false);
	SetVisible(kasya, false);
	LoadEffect_("ef733_01_sym_shuchusen01");								// �W����

	local mother = ArrangePointGimmick_("o_C03_02", g_mother,"mother");
	local kazari = ArrangePointGimmick_("o_C03_02", g_kazari,"mother");

// ����풓���[�V�����Ǎ�
	local p_guard	 = ReadMotion_(player, "Player_caution01_L");
	local p_run		 = ReadMotion_(player, "Player_caution01_L");
	local p_battle	 = ReadMotion_(player, "Player_caution01_L");
	local r_hand	 = ReadMotion_(rena, "n007_touch_reactor_L");
	local d_buck	 = ReadMotion_(dark, "n008_back_jump");
	local d_summon	 = ReadMotion_(dark, "n008_summon");
	local d_summonL	 = ReadMotion_(dark, "n008_summon_L");
	local d_supL	 = ReadMotion_(dark, "n008_surprise_L");
	local a_battle	 = ReadMotion_(apa, "m201_00_battle");

	SetMotion_(rena, r_hand, 1);

	SetMotion_(player, p_guard, 1);
	SetMotionSpeed_(player, 0.5);
	
	SetMotion_(dark, d_supL, BLEND_N);
	
//����
	SetStepSe_(rena, "SE_FLD_016");

// ���J�����ݒ�
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 1);
	
	//===============================================
	// �����i�[�e
	// �u�c�c<name_player/>
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_608_MSG_010");
	KeyInputWait_();
	//===============================================
	
	local kaiwa = Task_Rot3(kasya, 200, 30);
	local jkaiwa = Task_Rot3(apa, 160, 30);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 60);
	Wait_(1);
	PlayBgm_("BGM_008");

	//===============================================
	// �����i�[�e
	// <name_player/>�c�c�B�悩�����c
	//-----------------------------------------------
	ShowMsg_("DEMO_608_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetPointCameraEye_("002_cameye");
	SetPointCameraTarget_("002_camtgt");
	
	local taskL = Task_Rot3(player, 90, 40);
	SetMotionSpeed_(player, 1);
	
	SetMotion_(player, MOT_WALK, 16);
	task_player_step = Task_ChangeStepSe(player, "SE_FLD_016", 15);		// ���������E�Ώ̂̉��ʂŖ炷
	
	local taskR = Task_Rot3(rena, -90, 40);
	SetMotion_(rena, MOT_WALK, 16);
	
	//===============================================
	// ���_�[�N�}�X�^�[
	// �u�����c�c�I�@�}�U�[���[���̍Ö����u��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_608_MSG_030");
	
	WaitTask(taskL);
	DeleteTaskStepSe(player, task_player_step);
	SetMotion_(player, p_battle, 4);
	SetMotion_(rena, MOT_WAIT, 4);
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(dark, MOT_WAIT, 15);
	Wait_(10);
	
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");
	DeleteTask_(task_cam);
	task_player	 = Task_AnimeMoveNoDir_(dark, "dark_anm");
	DeleteTask_(task_player);

	//===============================================
	// ���_�[�N�}�X�^�[
	// �u���̐킢�ɂ�����@�M�l�̌��ӂ�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_608_MSG_040");
	KeyInputWait_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	local efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 40);			// �W����

	//===============================================
	// ���_�[�N�}�X�^�[
	// �u�Ȃ�΁@���׍H�Ȃǁ@���p�I
	//-----------------------------------------------
	ShowMsg_("DEMO_608_MSG_050");
	WaitTask(task_cam);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffect_(efc_cam);
	task_cam	 = Task_AnimeMoveCamera_("004_anmeye", "004_anmtgt");
	task_player	 = Task_AnimeMoveNoDir_(dark, "dark_anm");
	
	SetMotion_(dark, d_buck, 4);
	
	WaitTask(task_player);
	PlaySE_("SE_FLD_016");
	//===============================================
	// ���_�[�N�}�X�^�[
	// �u���ł�@�䂪�ŋ��́@�����X�^�[�����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_608_MSG_060");
	
	SetMotion_(dark, d_summon, 4);
	WaitMotion(dark);
	SetMotion_(dark, d_summonL, 4);
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(dark, MOT_WAIT, 8);
	
	SetVisible(apa, true);
	SetVisible(kasya, true);
	task_cam = Task_AnimeMoveCamera_("005_anmeye", "005_anmtgt");
	PlaySE_("SE_DEM_144");

	task_apa = Task_AnimeMoveNoFit_(apa, "apa_anm");
	SetMotion_(apa, MOT_SPECIAL_WAIT, 1);

	task_kasya = Task_AnimeMoveNoFit_(kasya, "kasya_anm");
	SetMotion_(kasya, MOT_WAIT, 1);

	Wait_(25);
	local efc_apa1 = SetPosWorldEffect_("ef721_02_nat_smoke_n02", Vec3(-30, 190, -573.93536));
	SetEffectScale_(efc_apa1, 3.0);
	
	Wait_(10);
	local efc_kasya = SetPosWorldEffect_("ef850_01_smoke_fall", Vec3(30, 190, -573.93536));

	Wait_(15);
	local efc_apa2 = SetPosWorldEffect_("ef721_02_nat_smoke_n02", Vec3(-30, 190, -573.93536));
	DeleteEffectEmitter_(efc_kasya);
	SetEffectScale_(efc_apa2, 3.0);
	
	Wait_(25);
	local efc_apa3 = SetPosWorldEffect_("ef721_02_nat_smoke_n02", Vec3(-30, 190, -573.93536));
	SetEffectScale_(efc_apa3, 3.0);

	WaitTask(task_cam);
	WaitTask(task_apa);
	
	SetMotion_(apa, MOT_WAIT, 16);
	
	local efc_apa3 = SetPosWorldEffect_("ef721_02_nat_smoke_n02", Vec3(-30, 190, -573.93536));
	SetEffectScale_(efc_apa3, 3.0);
	
	//===============================================
	// ���_�[�N�}�X�^�[
	// �u���ӂȂǁ@���|�I�ȃ`�J���̑O�ɂ�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_608_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(dark, d_summon, 16);
	SetMotion_(apa, a_battle, 4);
	Wait_(45);
	SetMotion_(kasya, MOT_SPELL_ACTUATE, 4);
	Wait_(29);
	
	PlaySE_("SE_DEM_145");
	Wait_(5);
	SetMotionSpeed_(kasya, 0.3);
	SetMotionSpeed_(apa, 0.3);
	WaitMotion(dark);
	SetMotion_(dark, d_summonL, 4);
	Wait_(10);
	
	EncountEndDemo(ENCOUNT_BOSS);
}
