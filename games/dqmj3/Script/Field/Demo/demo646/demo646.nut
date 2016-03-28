//=============================================
//
//		demo646[�K���}�U�[�h�폟��_5(���i�[�e�Ƃ̕ʂ�)]
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
	local task_cam, task_efc, task_player, task_rena, task_mother, task_efc;
	local efc_player, efc_rena, efc_light000, efc_light001, efc_light002, efc_mother01, efc_mother02;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_skyland = ReadGimmick_("o_V00_10");	// ����
	local model_mother = ReadGimmick_("o_C03_02");	// �}�U�[
	local model_sky = ReadGimmick_("o_dem_25");//��I�u�W�F�N�g
	local model_coa = ReadGimmick_("o_dem_19");//�R�A�I�u�W�F�N�g	
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_rena = ReadNpc_("n007");			// ���i�[�e
	// �G�t�F�N�g
	LoadEffect_("ef710_05_cha_light_ren");			// ���i�[�e�̌�
	LoadEffect_("ef732_13_light_reactor01");		// ���A�N�^�[�̌�(�܂Ԃ���)
	LoadEffect_("ef864_09_galmotherd04");			// �}�U�[�̂������
	LoadEffect_("ef864_10_galmotherd05");			// �K���}�U�[�h�֘A���o

	local baseResId = ReadGimmick_("o_effect_base");
	local baseObj000 = ArrangePointGimmick_("o_effect_base", baseResId, "efc_light000");
	local baseObj001 = ArrangePointGimmick_("o_effect_base", baseResId, "efc_light001");
	local baseObj002 = ArrangePointGimmick_("o_effect_base", baseResId, "obj_mother002");
	local baseObj003 = ArrangePointGimmick_("o_effect_base", baseResId, "obj_mother003");

// ���z�u
	// ����
	local skyland = ArrangePointGimmick_("o_V00_10", model_skyland, "obj_skyland000");
	SetPointPosNoFit_(skyland, "obj_skyland000");
	// �}�U�[
	local mother = ArrangePointGimmick_("o_C03_02", model_mother, "obj_mother000");
	SetPointPosNoFit_(mother, "obj_mother000");
	SetScaleSilhouette(mother, 0.7, 0.9);
	SetMotion_(mother, MOT_GIMMICK_1, BLEND_N);
	//��I�u�W�F�N�g
	local sky	 = ArrangePointGimmick_("o_dem_25", model_sky, "sky000");
	SetScaleSilhouette(sky, 1.0, 0.9);
	//�R�A�I�u�W�F�N�g
	local coa	 = ArrangePointGimmick_("o_dem_19", model_coa, "obj_coa000");
	SetScaleSilhouette(coa, 2.4 , 0.9);
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");

// ����풓���[�V�����Ǎ�
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");			// �E������L
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");				// ������ҋ@L
	local player_light = ReadMotion_(player, "Player_wrap_light");					// ���ɂ܂��
	local player_light_L = ReadMotion_(player, "Player_wrap_light_L");				// ���ɂ܂��L
	local player_light_up_L = ReadMotion_(player, "Player_wrap_light_up_L");		// ���ɂ܂��i������jL
	local player_light_reach = ReadMotion_(player, "Player_wrap_light_reach");		// ���ɂ܂��i���L�΂��j
	local player_light_reach_L = ReadMotion_(player, "Player_wrap_light_reach_L");	// ���ɂ܂��i���L�΂��jL

	local rena_look_down_L = ReadMotion_(rena, "n007_look_down_L");					// ���ނ��ҋ@L
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");					// ��������L
	local rena_float = ReadMotion_(rena, "n007_float");								// �ҋ@�������オ��
	local rena_float_L = ReadMotion_(rena, "n007_float_L");							// �����オ��L
	local rena_flying_L = ReadMotion_(rena, "n007_flying_L");						// ��sL
	local rena_flying_turn_L = ReadMotion_(rena, "n007_flying_turn_L");				// ��s�U��Ԃ�L
	local rena_show_L = ReadMotion_(rena, "n007_show_L");							// ������̍����ʂ܂ŏグ��L
	local rena_show_send = ReadMotion_(rena, "n007_show_send");							// ������̍����ʂ܂ŏグ��L	
	local rena_show_send_L = ReadMotion_(rena, "n007_show_send_L");							// ������̍����ʂ܂ŏグ��L

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	efc_mother01 = SetPointWorldEffect_("ef864_09_galmotherd04", "obj_mother000");
	SetEffectScale_(efc_mother01, 0.6);
	SetFace_(player, "Face_eyes_close");

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 150F
	PlaySE_("SE_DEM_191");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_cam);
	Wait_(65);
	
	SetFace_(rena, "Face_eyes_close");

	//��������������������������������������
	//���J�b�g2
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 60F

	DeleteTask_(task_cam);
	SetMotion_(rena, rena_look_down_L, BLEND_N);
	Wait_(30);

	//===============================================
	// �����i�[�e
	// �u�܂��@��͂����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_646_MSG_010");
	Wait_(14);
	SetMotion_(rena, rena_look_left_L, 14);
	Wait_(23);
	SetMotion_(player, player_look_right_L, 10);
	Wait_(5);
	KeyInputWait_();
	Wait_(5);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 60F
	WaitTask(task_cam);
	//===============================================
	// �����i�[�e
	// �u���Ȃ����@�K���}�U�[�h��|���Ă�����
	//-----------------------------------------------
	ShowMsg_("DEMO_646_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	SetMotion_(rena, MOT_WAIT, 12);
	task_rena = Task_RotateToDir_(rena, 180, 1);
	Wait_(35);
	DeleteTask_(task_rena);
	efc_rena = SetSelectBoneEffectSetOffset_("ef710_05_cha_light_ren", rena, ATTACH_GLOBAL, Vec3(0.0, 0.0, -2.5));
	PlaySE_("SE_DEM_097");
	Wait_(45);
	task_rena = Task_AnimeMoveNoFit_(rena, "anm_rena000");	// 120F
	SetMotion_(rena, rena_float, BLEND_L);
	WaitMotion(rena);
	SetMotion_(rena, rena_float_L, BLEND_M);
	Wait_(80);
	DeleteTask_(task_rena);
	DeleteEffect_(efc_mother01);


	//��������������������������������������
	//���J�b�g3
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 150F

	SetPointPos_(player, "player001");
	SetPointPosNoFit_(mother, "obj_mother001");
	efc_mother01 = SetPointWorldEffect_("ef864_09_galmotherd04", "obj_mother001");
	SetEffectScale_(efc_mother01, 0.6);
	SetMotion_(rena, rena_flying_L, BLEND_N);
	SetDir_(rena, -135);
	task_rena = Task_AnimeMoveNoFit_(rena, "anm_rena001");	// 120F
	Wait_(60);
	SetDir_(player, 160);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	WaitTask(task_rena);
	SetMotion_(rena, rena_float_L, BLEND_XL);
	task_rena = Task_RotateToDir_(rena, 0, 2.85);
	WaitTask(task_rena);
	WaitTask(task_cam);
	Wait_(50);
	SetDir_(player, 180);


	//��������������������������������������
	//���J�b�g4
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	// 90F

	Wait_(15);

	//===============================================
	// �����i�[�e
	// �u���́@�}�U�[�̋@�\��������@���܂ꂽ���݁B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_646_MSG_030");
	KeyInputWait_();
	Wait_(5);
	//===============================================
	// �����i�[�e
	// �u�����c�c�����}�U�[�̋@�\���@��s�����
	//-----------------------------------------------
	ShowMsg_("DEMO_646_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	StopBgm_(15);
	WaitTask(task_cam);
	Wait_(16);

	//��������������������������������������
	//���J�b�g5
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");	// 90F

	SetMotion_(player, player_look_up_L, BLEND_N);

	PlayBgm_("BGM_009");

	//===============================================
	// �����i�[�e
	// �u���肪�Ƃ��@<name_player/>�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_646_MSG_050");
	KeyInputWait_();
	Wait_(5);
	//===============================================
	// �����i�[�e
	// �u�̋��̐����瑱���Ă����@�J���}�b�\�̈��ӂ�
	//-----------------------------------------------
	ShowMsg_("DEMO_646_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(10);


	//��������������������������������������
	//���J�b�g6
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	//===============================================
	// �����i�[�e
	// �u������c�c���x�͎��̔ԁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_646_MSG_070");
	KeyInputWait_();
	Wait_(5);
	//===============================================
	// �����i�[�e
	// �u���́@�}�U�[�Ƃ�������Ɂ@�R�A�ɍs���B
	//-----------------------------------------------
	ShowMsg_("DEMO_646_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);


	//��������������������������������������
	//���J�b�g7
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	Wait_(25);
	SetMotion_(rena, rena_show_L, 20);
	Wait_(43);
	efc_light000 = SetSelectBoneEffect_("ef732_13_light_reactor01", baseObj000, ATTACH_GLOBAL);
	SetEffectScale_(efc_light000, 0.05);
	PlaySE_("SE_DEM_160");
	Wait_(65);
	task_efc = Task_AnimeMoveNoFit_(baseObj000, "anm_efc000");	// 120F
	SetMotion_(rena, rena_show_send_L, 30);
	Wait_(92);
	DeleteTask_(task_efc);
	DeleteEffect_(efc_light000);
	DeleteEffect_(efc_rena);


	//��������������������������������������
	//���J�b�g8
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");	// 120F

	Wait_(35);

	//===============================================
	// �����i�[�e
	// �u�c�c������@���ʂ��@<name_player/>�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_646_MSG_090");
	KeyInputWait_();
	Wait_(5);
	//===============================================
	// �����i�[�e
	// �u���Ȃ����@�u���C�N���[���h�ɋA����B
	//-----------------------------------------------
	ShowMsg_("DEMO_646_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	SetMotion_(rena, rena_float_L, BLEND_N);
	efc_rena = SetBoneEffect_("ef710_05_cha_light_ren", rena);
	efc_light001 = SetSelectBoneEffect_("ef732_13_light_reactor01", baseObj001, ATTACH_GLOBAL);
	SetEffectScale_(efc_light001, 0.06);
	task_efc = Task_AnimeMoveNoFit_(baseObj001, "anm_efc001");	// 90F
	Wait_(73);
	SetMotion_(player, MOT_WAIT, 14);
	WaitTask(task_efc);
	Wait_(3);
	DeleteEffectEmitter_(efc_light001);
	Wait_(30);
	efc_player = SetSelectBoneEffectSetOffset_("ef710_05_cha_light_ren", player, ATTACH_GLOBAL, Vec3(0.0, 0.0, -3.0));
	PlaySE_("SE_DEM_125");
	Wait_(2);
	SetMotion_(player, player_light, BLEND_XL);
	Wait_(100);


	//��������������������������������������
	//���J�b�g9
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");		// 60F

	task_player = Task_AnimeMoveNoDir_(player, "anm_player001");	// 30F
	Wait_(80);
	SetMotion_(player, player_light_up_L, BLEND_XL);
	efc_mother02 = SetPointWorldEffect_("ef864_09_galmotherd04", "obj_mother004");
	SetEffectScale_(efc_mother02, 0.0);
	Wait_(68);
	DeleteEffect_(efc_mother01);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g10
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");	// 180F

	SetPointPosNoFit_(mother, "obj_mother004");
	SetEffectScale_(efc_mother02, 0.6);
	task_rena = Task_AnimeMoveNoDir_(rena, "anm_rena002");	// 140F
	WaitTask(task_rena);
	SetFace_(rena, "Face_default");
	Wait_(3);

	//===============================================
	// �����i�[�e
	// �u�ł��邱�ƂȂ�c�c
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_646_MSG_110");	
	KeyInputWait_();
	Wait_(5);
	//===============================================
	// �����i�[�e
	// �u�c�c���́@�R�A�̒�����
	//-----------------------------------------------
	ShowMsg_("DEMO_646_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	Wait_(50);
	DeleteTask_(task_cam);

	task_cam = Task_AnimeMoveCamera_("anmeye012", "anmtgt012");	//�Œ�

	DeleteEffect_(efc_player);
	//===============================================
	// �����i�[�e
	// �u���܂Ł@���肪�Ƃ��@<name_player/>�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");	
	ShowMsg_("DEMO_646_MSG_130");
	SetFace_(rena, "Face_smile");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	efc_player = SetSelectBoneEffectSetOffset_("ef710_05_cha_light_ren", player, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_player, 0.75);
	Wait_(20);
	DeleteTask_(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye013", "anmtgt013");	//130F
	task_rena = Task_AnimeMoveNoDir_(rena, "anm_rena005");	// 160F
	efc_mother01 = SetSelectBoneEffect_("ef864_09_galmotherd04", baseObj002, ATTACH_GLOBAL);
	SetEffectScale_(efc_mother01, 0.6);
	
	task_efc = Task_AnimeMoveNoDir_(baseObj002, "anm_mother000");	// 210F
	DeleteTask_(task_efc);
	
	Wait_(150);
	
	DeleteTask_(task_rena);
	DeleteEffect_(efc_mother02);


	//��������������������������������������
	//���J�b�g11
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");	// 150F

	SetPointPosNoFit_(rena, "npc_rena003");
	SetPointPosNoFit_(mother, "obj_mother002");
	SetPointPosNoFit_(skyland, "obj_skyland001");
	SetPointPosNoFit_(player, "player003");
	task_rena = Task_AnimeMoveNoDir_(rena, "anm_rena003");	// 210F
	task_mother = Task_AnimeMoveNoDir_(mother, "anm_mother000");	// 210F
	task_efc = Task_AnimeMoveNoDir_(baseObj002, "anm_mother000");	// 210F
	SetEffectScale_(efc_mother01, 0.6);
	WaitTask(task_cam);
	WaitTask(task_rena);
	WaitTask(task_mother);
	WaitTask(task_efc);
	DeleteEffect_(efc_player);
	DeleteEffect_(efc_rena);
	DeleteEffect_(efc_mother01);
	SetFace_(player, "Face_default");


	//��������������������������������������
	//���J�b�g12
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");	// 30F

	SetPointPos_(player, "player005");
	efc_player = SetSelectBoneEffectSetOffset_("ef710_05_cha_light_ren", player, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_player, 0.65);
	efc_mother01 = SetSelectBoneEffect_("ef864_09_galmotherd04", baseObj003, ATTACH_GLOBAL);
	SetEffectScale_(efc_mother01, 0.6);
	task_efc = Task_AnimeMoveNoDir_(baseObj003, "anm_mother001");	// 310F
	DeleteTask_(task_efc);
	Wait_(5);
	SetMotionSpeed_(player, 1.2);
	SetMotion_(player, player_light_reach, BLEND_L);
	WaitMotion(player);
	SetMotionSpeed_(player, 1.0);
	SetMotion_(player, player_light_reach_L, BLEND_M);
	efc_rena = SetSelectBoneEffectSetOffset_("ef710_05_cha_light_ren", rena, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));


	//��������������������������������������
	//���J�b�g13
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");	// 240F

	SetPointPosNoFit_(rena, "npc_rena004");
	SetPointPosNoFit_(mother, "obj_mother003");
	SetPointPosNoFit_(skyland, "obj_skyland002");
	SetPointPos_(player, "player004");
	task_rena = Task_AnimeMoveNoDir_(rena, "anm_rena004");	// 310F
	task_mother = Task_AnimeMoveNoDir_(mother, "anm_mother001");	// 310F
	task_efc = Task_AnimeMoveNoDir_(baseObj003, "anm_mother001");	// 310F
	SetEffectScale_(efc_mother01, 0.6);
	SetEffectScale_(efc_player, 0.75);
	PlaySE_("SE_DEM_174");																			//��SE:���i�[�e�ƃR�A������
	Wait_(80);
	efc_light002 = SetSelectBoneEffectSetBoneName_("ef864_10_galmotherd05", rena, "Waist", Vec3(0.0, 0.0, 2.5));

	for (local i=1; i<=130; i++) {
		SetEffectScale_(efc_light002, 0.1 + (i * 0.13));
		Wait_(1);
	}

	PlaySE_("SE_DEM_138");
	StopBgm_(105);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 40);

	for (local i=1; i<=40; i++) {
		SetEffectScale_(efc_light002, 17.0 + (i * 0.13));
		Wait_(1);
	}

	DeleteTask_(task_cam);
	DeleteTask_(task_rena);
	DeleteTask_(task_mother);
	DeleteTask_(task_efc);
	Wait_(30);
	DeleteEffect_(efc_light002);
	DeleteEffect_(efc_mother01);
	DeleteEffect_(efc_rena);
	SetActive_(rena, false);
	SetActive_(mother, false);
	Wait_(30);

	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");	// 150F

	SetManualCalcAlpha_(sky, true);
	Task_ObjectFadeOut_(sky, 20);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 40);
	Wait_(60);
	SetMotion_(player, player_light_L, 30);
	Wait_(120);

	EndDemo(FADE_COLOR_BLACK);
}
