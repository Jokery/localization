//=============================================
//
//		demo835[�S�B�_�_�O�W���K���}]
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
	local task_cam, task_player, task_dagja;
	local efc_cam, efc_player, efc_darsgrm, efc_dagja0, efc_dagja1, efc_dagja2;
	local efc_explosion0, efc_explosion1;
	local bone_efc0, bone_efc1, bone_efc2, bone_efc3, bone_efc4;
	local offset_aroma = Vec3(0, 3.0, 0);

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_mother = ReadGimmick_("o_C03_02");		// �}�U�[
	local model_decoration = ReadGimmick_("o_C03_03");	// �}�U�[����
	local model_tail_s = ReadGimmick_("o_dem_21");		// �K��(��)
	local model_tail_t = ReadGimmick_("o_dem_22");		// �K��(��)
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_aroma = ReadNpc_("n018");				// �A���}
	local model_rena = ReadNpc_("n007");				// ���i�[�e
	local model_dagja = ReadNpc_("n042");				// �_�O�W���K���}
	local model_darsgrm = ReadNpc_("m180_00");			// �_�[�X�K���}
	// �G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");			// �W����
	LoadEffect_("ef712_10_emo_surprise01");				// �u�I�v
	LoadEffect_("ef721_02_nat_smoke_n02");				// ��02
	LoadEffect_("ef721_03_nat_smoke_n03");				// ��03
	LoadEffect_("ef852_03_explosion_db");				// �唚��
	LoadEffect_("ef883_07_dg01");						// �_�[�X�K���}�m��
	LoadEffect_("ef883_01_dg_transform01");				// �_�O�W���K���}�̕ϐg�P
	LoadEffect_("ef883_02_dg_transform02");				// �_�O�W���K���}�̕ϐg�Q
	LoadEffect_("ef883_03_dg_transform03");				// �_�O�W���K���}�̕ϐg�R
	LoadEffect_("ef730_01_oth_dark_aura01");			// �ЁX�����I�[��
	//���C�A�E�g
	LoadLayout_("black");								// �u���b�N

// ���z�u
	// �}�U�[
	local mother = ArrangePointGimmick_("o_C03_02", model_mother, "obj_mother000");
	SetMotion_(mother, MOT_GIMMICK_1, BLEND_N);
	// �}�U�[����
	local decoration = ArrangePointGimmick_("o_C03_03", model_decoration, "obj_mother000");
	// �K��(��)
	local tail_s = ArrangePointGimmick_("o_dem_21", model_tail_s, "npc_darsgrm000");
	SetMotion_(tail_s, MOT_GIMMICK_1, BLEND_N);
	SetScaleSilhouette(tail_s, SCALE.G, SILHOUETTE_WIDTH.G);
	SetVisible(tail_s, false);
	// �K��(��)
	local tail_t = ArrangePointGimmick_("o_dem_22", model_tail_t, "npc_darsgrm000");
	SetMotion_(tail_t, MOT_GIMMICK_1, BLEND_N);
	SetScaleSilhouette(tail_t, SCALE.G, SILHOUETTE_WIDTH.G);
	SetVisible(tail_t, false);
	
	// ��l��
	SetPointPos_(player, "player000");
	SetVisible(player, false);
	// �A���}
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetVisible(aroma, false);
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "obj_mother000");
	SetPointPosNoFit_(rena, "obj_mother000");
	SetFace_(rena, "Face_loop_close");
	// �_�[�X�K���}
	local darsgrm = ArrangePointNpc_(model_darsgrm, "npc_darsgrm000");
	SetScaleSilhouette(darsgrm, SCALE.G, SILHOUETTE_WIDTH.G);
	// �_�O�W���K���}
	local dagja = ArrangePointNpc_(model_dagja, "npc_darsgrm000");
	SetScaleSilhouette(dagja, SCALE.G, SILHOUETTE_WIDTH.G);
	SetVisible(dagja, false);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// �x��L
	// �A���}
	local aroma_guard_L = ReadMotion_(aroma, "n018_guard_L");				// �\����L
	// ���i�[�e
	local rena_mother_L = ReadMotion_(rena, "n007_mother_L");				// �}�U�[�̒��̃��i�[�e
	// �_�[�X�K���}
	local darsgrm_wait_L = ReadMotion_(darsgrm, "m180_00_wait_L");			// ����O���[�vL
	local darsgrm_die = ReadMotion_(darsgrm, "m180_00_die");				// �ϐg�Q
	local darsgrm_die_L = ReadMotion_(darsgrm, "m180_00_die_L");			// �ϐg�QL
	// �_�O�W���K���}
	local dagja_transform01 = ReadMotion_(dagja, "n042_transform01");		// ����o��
	local dagja_transform01_L = ReadMotion_(dagja, "n042_transform01_L");	// ����o��L
	local dagja_transform02 = ReadMotion_(dagja, "n042_transform02");		// �����o��
	local dagja_transform02_L = ReadMotion_(dagja, "n042_transform02_L");	// �����o��L
	local dagja_transform03 = ReadMotion_(dagja, "n042_transform03");		// �ŏI�ϐg
	local dagja_spell_actuate = ReadMotion_(dagja, "n042_spell_actuate");	// ���@�r��

// �����[�V�����ݒ�
	SetMotion_(rena, rena_mother_L, BLEND_N);
	SetMotion_(darsgrm, darsgrm_die, BLEND_N);

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemoNoFade(FADE_COLOR_BLACK);
	
	// ���J�b�g�P���_�[�X�K���}�A����`�`�`�`�`�`�`�`�`�`�`
	Wait_(36);
	PlaySE_("SE_DEM_218");
	efc_explosion0 = SetPointWorldEffect_("ef852_03_explosion_db", "efc_explosion000");
	Wait_(45);
	
	efc_explosion1 = SetPointWorldEffect_("ef852_03_explosion_db", "efc_explosion001");
	Wait_(20);
	
	SetVisible(tail_s, true);
	
	// ���J�b�g�Q���_�[�X�K���}�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	Wait_(5);
	
	efc_darsgrm = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", darsgrm, ATTACH_GLOBAL);
	
	StartEarthQuake_(15, 3, 3);
	Wait_(15);
	StartDecayEarthQuake_(15, 3, 1.5);
	Wait_(30);
	
	WaitMotion(darsgrm);
	SetMotion_(darsgrm, darsgrm_die_L, BLEND_N);
	
	StartEarthQuake_(15, 3, 1);
	SetPointWorldEffect_("ef721_02_nat_smoke_n02", "efc_smoke000");
	Wait_(60);
	
	SetLayoutAnime_("fade_in", false);											//���������C��
	Wait_(30);
	SetLayoutAnime_("loop", false);												//��������L
	Wait_(5);

	//===============================================
	// ���_�[�X�K���}
	// �u�c�c�܂��@�I������Ǝv���ȁH
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_835_MSG_010", false);
	Wait_(30);
	SetLayoutAnime_("fade_out", false);											//���������A�E�g
	Wait_(30);
	//===============================================
	
	// ���J�b�g�R���_�[�X�K���}�̓����K���`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 260F
	Wait_(210);
	PlaySE_("SE_DEM_218");
	bone_efc0 = SetSelectBoneEffectSetBoneName_("ef883_07_dg01", tail_s, "tailA_02", Vec3(0.0, 0.0, 0.0));
	bone_efc1 = SetSelectBoneEffectSetBoneName_("ef883_07_dg01", tail_s, "tailA_03", Vec3(0.0, 0.0, 0.0));
	bone_efc2 = SetSelectBoneEffectSetBoneName_("ef883_07_dg01", tail_s, "tailA_05", Vec3(0.0, -5.0, 5.0));
	bone_efc3 = SetSelectBoneEffectSetBoneName_("ef883_07_dg01", tail_s, "tailA_05", Vec3(0.0, 0.0, 0.0));
	bone_efc4 = SetSelectBoneEffectSetBoneName_("ef883_07_dg01", tail_s, "tailA_08", Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(bone_efc0, 1.5);
	SetEffectScale_(bone_efc1, 1.5);
	SetEffectScale_(bone_efc2, 1.5);
	SetEffectScale_(bone_efc3, 1.5);
	SetEffectScale_(bone_efc4, 1.5);
	
	SetMotion_(tail_s, MOT_GIMMICK_0, BLEND_N);		// �K���������o��
	Wait_(60);
	
	uChangeEffectScale(bone_efc2, 1.5, 2.0, 70)		// ���X�ɑ傫������
	
	uChangeEffectScale(bone_efc2, 2.0, 6.5, 20)		// ���X�ɑ傫������
	WaitMotion(tail_s);
	Wait_(10);
	
	SetVisible(player, true);
	SetVisible(aroma, true);
	
	SetEffectScale_(bone_efc0, 3.0);
	SetEffectScale_(bone_efc1, 3.0);
	
	DeleteTask_(task_cam);
	
	// ���J�b�g�S����l���ƃA���}�A�����`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	StartEarthQuake_(-1, 3, 0.3);
	
	SurpriseDisp(player, 0.7);
//	SurpriseDispSetOffset(aroma, offset_aroma, 0.6);
	
	local effectId = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", aroma, ATTACH_EFFECT1, offset_aroma);
	SetEffectScale_(effectId, 0.6);
	
	SetMotion_(player, player_caution01_L, BLEND_L);
	SetMotion_(aroma, aroma_guard_L, BLEND_L);
	Wait_(45);
	
	SetVisible(tail_s, false);
	SetVisible(tail_t, true);
	SetMeshVisible_(tail_t, "Model_3", false);
	
	StopEarthQuake_();
	
	// ���J�b�g�T���K���Ǝ�l���ƃA���}�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	StartEarthQuake_(-1, 3, 0.5);
	SetMotion_(tail_t, MOT_GIMMICK_0, BLEND_N);
	WaitMotion(tail_t);
	
	SetVisible(player, false);
	SetVisible(aroma, false);
	StopEarthQuake_();
	
	efc_dagja0 = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", dagja, ATTACH_EFFECT2, Vec3(0.0, -5.0, 0.0));
	
	// ���J�b�g�U������o���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 60F
	Wait_(15);
	
	efc_dagja1 = SetSelectBoneEffect_("ef883_01_dg_transform01", dagja, ATTACH_GLOBAL);
	
	SetVisible(dagja, true);
	PlaySE_("SE_DEM_220");
	SetMotion_(dagja, dagja_transform01, BLEND_N);
	Wait_(1);
	
	StartBlurEffect_();
	SetMeshVisible_(tail_t, "Model_2", false);
	SetMeshVisible_(tail_t, "Model_3", true);
	SetMotion_(tail_t, MOT_GIMMICK_1, BLEND_N);
	WaitMotion(dagja);
	EndBlurEffect_();
	
	SetMotion_(dagja, dagja_transform01_L, BLEND_N);
	SetMotion_(tail_t, MOT_GIMMICK_2, BLEND_N);
	
	WaitTask(task_cam);
	Wait_(30);
	
	SetVisible(darsgrm, false);
	
	// ���J�b�g�V�������o���`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 100F
	
	efc_dagja1 = SetSelectBoneEffect_("ef883_02_dg_transform02", dagja, ATTACH_GLOBAL);
	SetMotion_(dagja, dagja_transform02, BLEND_N);
	SetMotion_(tail_t, MOT_GIMMICK_3, BLEND_N);
	Wait_(15);
	StartBlurEffect_();
	WaitMotion(dagja);
	PlaySE_("SE_DEM_221");
	SetMotion_(dagja, dagja_transform02_L, BLEND_N);
	SetMotion_(tail_t, MOT_GIMMICK_4, BLEND_N);
	Wait_(10);
	EndBlurEffect_();
	
	WaitTask(task_cam);
	
	// ���J�b�g�W���ŏI�ϐg�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 136F
	PlaySE_("SE_DEM_222");
	efc_dagja1 = SetSelectBoneEffect_("ef883_03_dg_transform03", dagja, ATTACH_GLOBAL);
	SetMotion_(dagja, dagja_transform03, BLEND_M);
	SetMotion_(tail_t, MOT_GIMMICK_5, BLEND_N);
	Wait_(110);
	
	DeleteEffect_(bone_efc0);
	DeleteEffect_(bone_efc1);
	DeleteEffect_(bone_efc2);
	DeleteEffect_(bone_efc3);
	DeleteEffect_(bone_efc4);
	SetVisible(tail_t, false);
	
	SetEffectScale_(efc_dagja0, 1.5);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// �W����
	Wait_(10);
	DeleteEffectEmitter_(efc_cam);
	
	WaitMotion(dagja);
	SetMotion_(dagja, MOT_WAIT, BLEND_XL);
	
	//===============================================
	// *�_�O�W���K���}
	// �u�n��􂫁I�@�C������I�@������Ă������I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_835_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
//	Wait_(30);
	
	efc_dagja2 = SetSelectBoneEffectSetBoneName_("ef730_01_oth_dark_aura01", dagja, "j_tail_010", Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_dagja2, 0.5);
	
	// ���J�b�g�X���K���t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 136F
	WaitTask(task_cam);
	
	// ���J�b�g10�����t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 136F
	WaitTask(task_cam);
	Wait_(15);
	
	// ���J�b�g11���K���}�U�[�h�퓬�J�n�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	//===============================================
	// ���_�[�X�K���}
	// �u���̃_�O�W���K���}�Ł@<name_player/>�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DAGUJAGARUMA");
	ShowMsg_("DEMO_835_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	
	task_dagja = Task_RotateToDir_(dagja, 176, 0.5);
	SetMotion_(dagja, dagja_spell_actuate, BLEND_XL);
	PlaySE_("SE_DEM_223");
	SetMotionSpeed_(dagja, 0.5);
	Wait_(20);
	SetMotionSpeed_(dagja, 0.3);
	Wait_(45);
	SetMotionSpeed_(dagja, 1.0);
	Wait_(10);
	
	StartDecayEarthQuake_(15, 3, 15);
	Wait_(15);
	
	SetMotionSpeed_(dagja, 0.1);
	StopBgm_(BGM_STOP_DEF);
	EndDemoBgmFade_(FADE_DEF);
	local task = Task_EncountEffect_(ENCOUNT_BOSS);
	WaitTask(task);
	DeleteAllTask_();
	End_();
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//		�G�t�F�N�g�T�C�Y�����X�ɕύX
//----------------------------------------------------------------------------
//	����	: efc			�G�t�F�N�g�h�c
//			: start_size	�����G�t�F�N�g�T�C�Y
//			: end_size		�ŏI�G�t�F�N�g�T�C�Y
//			: frm			�t���[����
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uChangeEffectScale(efc, start_size, end_size, frm)
{
	local change_size;		// �P�t���[���ŕύX����T�C�Y
	
	change_size = (end_size - start_size) / frm;		// (�ŏI�T�C�Y �| �����T�C�Y) �� �t���[����
	
	for (local i=1; i<=frm; i++) {
		SetEffectScale_(efc, start_size + (change_size * i));
		Wait_(1);
	}
}
