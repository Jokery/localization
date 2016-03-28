//=============================================
//
//		demo641[�K���}�U�[�h�̊J��]
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
	local efc_player, efc_gal, efc_gal2, efc_gal3, efc_cama;
	local bone_efc0, bone_efc1;


// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player	 = GetPlayerId_();					// ��l��
	local id_gal	 = ReadNpc_("m185_00");
	local id_rena	 = ReadNpc_("n007");
	local id_ukisima = ReadGimmick_("o_V00_10");
	local id_sky = ReadGimmick_("o_dem_25");
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player");
	local rena	 = ArrangePointNpc_(id_rena, "rena");
	local gal	 = ArrangePointNpc_(id_gal, "gal");
	SetScaleSilhouette(gal, 6, 1);
	
	local sky	 = ArrangePointGimmick_("o_dem_25", id_sky, "sky000");
	SetScale_(sky, 0.2);	
	local ukisima	 = ArrangePointGimmick_("o_V00_10", id_ukisima, "ukisima");

//���G�t�F�N�g
	LoadEffect_("ef733_04_sym_pollen_mist");
	LoadEffect_("ef733_01_sym_shuchusen01");
	LoadEffect_("ef730_01_oth_dark_aura01");
	LoadEffect_("ef864_06_galmotherd01");
	LoadEffect_("ef864_07_galmotherd02");
	LoadEffect_("ef864_08_galmotherd03");

	efc_cama = SetCameraEffect_("ef733_04_sym_pollen_mist", CAMERA_DEF);	// �������
	efc_gal = SetSelectBoneEffect_("ef864_07_galmotherd02", gal, ATTACH_EFFECT2);	

	SetEffectScale_(efc_gal, 1.5);
	
// ����풓���[�V�����Ǎ�
	local g_ent	 = ReadMotion_(gal, "m185_00_enter");			//�o��
	local g_ent_L	 = ReadMotion_(gal, "m185_00_enter_L");			//�o��	
	local g_ent_end	 = ReadMotion_(gal, "m185_00_enter_end");			//�o��	
	local p_ue = ReadMotion_(player, "Player_battle01_L");		// ��l���퓬�ҋ@�i�������j
	local r_att = ReadMotion_(rena, "n007_attack");				// �U��(�Ȃ�����)
	local r_attL = ReadMotion_(rena, "n007_attack_L");			// �U����̑ҋ@
	local r_atk = ReadMotion_(rena, "n007_attack_start");		// �U���J�n
	local r_atkL = ReadMotion_(rena, "n007_attack_start_L");	// �U���J�nL
	local r_caution_L = ReadMotion_(rena, "n007_caution_L");	// �U���J�nL
	
	SetMotion_(player, p_ue, BLEND_N);
	SetMotion_(rena, r_caution_L, BLEND_N);
	SetMotion_(gal, MOT_SPELL_CHARGE, BLEND_N);	
	
	SetVisible(player, false);
	SetVisible(rena, false);
	SetVisible(ukisima, false);
	
	SetManualCalcAlpha_(sky, true);
	Task_ObjectFadeOut_(sky, 1);
	ChangeColorTone_(-0.2, -0.3, -0.2,1);
// ���J�����ݒ�
	local task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	WaitTask(task_cam);
	
	bone_efc0 = SetSelectBoneEffectSetBoneName_("ef864_06_galmotherd01", gal, "j_head", Vec3(0.8, 0.3, 0.0));	
	bone_efc1 = SetSelectBoneEffectSetBoneName_("ef864_06_galmotherd01", gal, "j_head", Vec3(-0.8, 0.3, 0.0));
	PlaySE_("SE_DEM_125");
	SetEffectScale_(bone_efc0, 0.6);
	SetEffectScale_(bone_efc1, 0.6);	
	Wait_(60);
	//===============================================
	// *�K���}�U�[�h
	// �u�c�c�������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_641_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetEffectScale_(efc_gal, 1.0);
	
	local task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	SetVisible(rena, true);
	SetVisible(ukisima, true);

	//===============================================
	// �����i�[�e
	// �u�K���r���X�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_641_MSG_020");
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	local efc = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	Wait_(10);	
	DeleteEffect_(efc);

	SetEffectScale_(efc_gal, 1.0);		
	local task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");
	SetMotion_(gal, MOT_SPELL_CHARGE, 8);
	SetVisible(rena, false);
	SetVisible(ukisima, false);

	//===============================================
	// *�K���}�U�[�h
	// �u���͂�@�K���r���X�ł͂Ȃ��B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_641_MSG_030");
	KeyInputWait_();
	//===============================================
	//===============================================
	// *�K���}�U�[�h
	// �u�}�U�[�ƈ�̉����@�u���C�N���[���h��
	//-----------------------------------------------
	ShowMsg_("DEMO_641_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	PlaySE_("SE_DEM_171");									//�K���}�U�[�h�����
	DeleteEffect_(bone_efc0);	
	DeleteEffect_(bone_efc1);	
	SetMotion_(gal, g_ent, BLEND_XL);
	Wait_(15);
	Task_ObjectFadeIn_(sky, 60);
	efc_gal3 = SetSelectBoneEffect_("ef864_08_galmotherd03", gal, ATTACH_EFFECT2);	
	Wait_(20);
	DeleteEffectEmitter_(efc_gal);	
	Wait_(10);
		
	local task_cam = Task_AnimeMoveCamera_("004_anmeye", "004_anmtgt");	
	
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(gal), 180);	
	SetVisible(player, true);
	SetVisible(rena, true);
	SetVisible(ukisima, true);
	WaitMotion(gal);	
	SetMotion_(gal, g_ent_L, BLEND_XL);	
	StartBlurEffect_();
	
	
	//===============================================
	// *�K���}�U�[�h
	// �u�K���}�U�[�h�I�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_641_MSG_050");

	ChangeColorTone_(0,0,0,30);
	DeleteEffectEmitter_(efc_cama);
	EndBlurEffect_();
	local efc = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
			
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffect_(efc);
	
	local task_cam = Task_AnimeMoveCamera_("005_anmeye", "005_anmtgt");
	
	SetMotion_(gal, g_ent_end, BLEND_XL);	
	WaitMotion(gal);		
	SetMotion_(gal, MOT_WAIT, BLEND_XL);	
	WaitTask(task_cam);	
	
	Wait_(30);
	
	//===============================================
	// ���K���}�U�[�h
	// �u�{�N���c�c�������@��������I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUMAZADO");
	ShowMsg_("DEMO_641_MSG_060");
	KeyInputWait_();
	
	//===============================================
	// ���K���}�U�[�h
	// �u�c�c���O�����́@�_�ւ̃C�P�j�G���B
	//-----------------------------------------------
	
	ShowMsg_("DEMO_641_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	WaitTask(task_cam);
	//===============================================
	SetVisible(player, false);
	
	SetPointCameraEye_("000_cameye");
	SetPointCameraTarget_("000_camtgt");
	//===============================================
	// �����i�[�e
	// �u�Ⴄ�I�@�������́c�c�����ā@���̐��E�ɐ�����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_641_MSG_080");
	SetMotion_(rena, r_atk, BLEND_L);
	WaitMotion(rena);
	SetMotion_(rena, r_atkL, BLEND_XL);
	KeyInputWait_();
	//===============================================
		
	//===============================================
	// �����i�[�e
	// �u�u���C�N���[���h�́@������������Ă݂���I
	//-----------------------------------------------
	ShowMsg_("DEMO_641_MSG_090");
	SetMotion_(rena, r_att, BLEND_XL);
	Wait_(20);
	SetMotion_(rena, r_attL, BLEND_XL);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetVisible(rena, false);
	SetVisible(ukisima, false);
	
	efc_gal = SetSelectBoneEffect_("ef730_01_oth_dark_aura01", gal, ATTACH_EFFECT2);
	SetEffectScale_(efc_gal, 0.8);
	
	SetMotion_(gal, MOT_SWORD_CHARGE, BLEND_N);
	
	local task_cam = Task_AnimeMoveCamera_("006_anmeye", "006_anmtgt");

	//===============================================
	// ���K���}�U�[�h
	// �u�K���}�U�[�h���@��M����Ƃ����̂��c�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUMAZADO");
	ShowMsg_("DEMO_641_MSG_100");
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	local efc = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	
	KeyInputWait_();
	ShowMsg_("DEMO_641_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_DEM_186");									//�K���}�U�[�h�퓬�O

	DeleteEffect_(efc);
	DeleteTask_(task_cam);	
	SetMotion_(gal, MOT_SPELL_ACTUATE, BLEND_XL);
	local task_cam = Task_AnimeMoveCamera_("007_anmeye", "007_anmtgt");
	Wait_(45);
	SetMotionSpeed_(gal, 0.01);
	local	task = Task_EncountEffect_(ENCOUNT_BOSS);
	StopBgm_(20);
	WaitTask(task);
	DeleteAllTask_();
	
	End_();

}
