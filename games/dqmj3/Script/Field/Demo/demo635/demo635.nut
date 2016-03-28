//=============================================
//
//		demo635[����C�b�^�u���폟��]
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
	local task_cam, task_player, task_rena, task_neo;
	local efc_cam, efc_neo0, efc_neo1, efc_mag_boss_die01, efc_mag_boss_die02, efc_mag_boss_die03, efc_mag_boss_die04;
	local efc_bone0, efc_bone1, efc_bone2, efc_bone3, efc_bone4, efc_bone5, efc_bone6, efc_bone7;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_island = ReadGimmick_("o_com_10");	// ����
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_rena = ReadNpc_("n007");			// ���i�[�e
	local model_neo = ReadNpc_("m205_00");			// �C�b�^�u��
	// �G�t�F�N�g
	LoadEffect_("ef733_02_sym_black_mist01");		// ������
	LoadEffect_("ef731_06_mag_boss_die01");			// ����{�X�̏��ŃG�t�F�N�g(��)
	LoadEffect_("ef731_08_mag_boss_die03");			// ����{�X�̏��ŃG�t�F�N�g(��)
	LoadEffect_("ef731_09_mag_boss_die04");			// ����{�X�̏��ŃG�t�F�N�g(���j)

// ���z�u
	// ����
	local island = ArrangePointGimmick_("o_com_10", model_island, "obj_island000");
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// �C�b�^�u��
	local neo = ArrangePointNpc_(model_neo, "npc_itbr000");
	SetPointPosNoFit_(neo, "npc_itbr000");
	SetScaleSilhouette(neo, SCALE.T, SILHOUETTE_WIDTH.T);
	SetSilhouetteHideIfFar_(neo, false);

// ����풓���[�V�����Ǎ�
	// �C�b�^�u��
	local neo_die = ReadMotion_(neo, "m205_00_die");						// ����

// ���G�t�F�N�g�ݒ�
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_bone0 = SetSelectBoneEffectSetBoneName_("ef731_08_mag_boss_die03", neo, "Waist", Vec3(0.0, 0.0, 0.0));
	efc_bone1 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "Neck", Vec3(0.0, 0.0, 0.0));
	efc_bone2 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "L_Bicep", Vec3(0.0, 0.0, 0.0));
	efc_bone3 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "LForearm", Vec3(0.0, 0.0, 0.0));
	efc_bone4 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "LWrist", Vec3(0.0, 0.0, 0.0));
	efc_bone5 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "R_Bicep", Vec3(0.0, 0.0, 0.0));
	efc_bone6 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "RForearm", Vec3(0.0, 0.0, 0.0));
	efc_bone7 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "RWrist", Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_bone0, 1.6);
	SetEffectScale_(efc_bone1, 1.6);
	SetEffectScale_(efc_bone2, 1.6);
	SetEffectScale_(efc_bone3, 1.6);
	SetEffectScale_(efc_bone4, 1.6);
	SetEffectScale_(efc_bone5, 1.6);
	SetEffectScale_(efc_bone6, 1.6);
	SetEffectScale_(efc_bone7, 1.6);

// �����[�V�����ݒ�
	SetMotion_(neo, MOT_WAIT, BLEND_N);
	SetMotionSpeed_(neo, 0.5);

	ChangeColorTone_(-0.3, -0.5, -0.2, 0);

	SetVisible(player, false);
	SetVisible(rena, false);
	SetVisible(island, false);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 90F


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	Wait_(60);
	DeleteTask_(task_cam);
	StartEarthQuake_(-1, 3, 1.5);

	// ���J�b�g�P���C�b�^�u���t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`

	//===============================================
	// ���C�b�^�u��
	// �u�O�I�S�S�S�S�c�c�I�@�܂��s���̂ł��邩�I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_635_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	PlaySE_("SE_DEM_168");											//�C�b�^�u���iT�j����

	// ���J�b�g�Q���C�b�^�u���Y�[���A�E�g�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 65F
	StartBlurEffect_();

	SetMotion_(neo, neo_die, 28);
	SetMotionSpeed_(neo, 0.5);
	efc_mag_boss_die04 = SetSelectBoneEffect_("ef731_09_mag_boss_die04", neo, ATTACH_EFFECT2);
	DeleteEffectEmitter_(efc_cam);
	ChangeColorTone_(0.3, 0.3, 0.3, 60);
	Wait_(40);

	DeleteEffectEmitter_(efc_bone0);
	DeleteEffectEmitter_(efc_bone1);
	DeleteEffectEmitter_(efc_bone2);
	DeleteEffectEmitter_(efc_bone3);
	DeleteEffectEmitter_(efc_bone4);
	DeleteEffectEmitter_(efc_bone5);
	DeleteEffectEmitter_(efc_bone6);
	DeleteEffectEmitter_(efc_bone7);
	Wait_(40);

	StopEarthQuake_();
	Wait_(15);

	StartEarthQuake_(-1, 3, 30);
	Wait_(45);

	task_neo = Task_ObjectFadeOut_(neo, 15);
	Wait_(30);

	ChangeColorTone_(-0.3, -0.5, -0.2, 30);
	Wait_(39);

	StartEarthQuake_(60, 3, 30);
	ChangeColorTone_(0.3, 0.3, 0.3, 50);

	Wait_(105);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	Wait_(30);

	StopEarthQuake_();
	DeleteEffectEmitter_(efc_mag_boss_die04);
	EndBlurEffect_();
	DeleteTask_(task_cam);

	// ���J�b�g�R����l���ƃ��i�[�e�Y�[���A�E�g�`�`�`�`�`�`�`�`		// �X�N�G�j�v�]�ɂ��CO
//	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 180F

//	SetVisible(player, true);
//	SetVisible(rena, true);
//	SetVisible(island, true);

//	Wait_(60);
//	ChangeColorTone_(0.1, 0.1, 0.1, 60);

//	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}
