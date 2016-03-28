//=============================================
//
//		demo639[�f�X�o�[�����v�����e�E�X�폟��]
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
	local task_cam, task_player, task_rena, task_prmt, task_dsbn;
	local efc_cam, efc_dsbn0, efc_dsbn1;
	local efc_mag_boss_die01, efc_mag_boss_die02, efc_mag_boss_die03, efc_mag_boss_die04_000, efc_mag_boss_die04_001;
	local efc_bone0, efc_bone1, efc_bone2, efc_bone3, efc_bone4, efc_bone5, efc_bone6, efc_bone7, efc_bone8;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_island = ReadGimmick_("o_com_10");	// ����
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_rena = ReadNpc_("n007");			// ���i�[�e
	local model_prmt = ReadNpc_("n026");			// �v�����e�E�X
	local model_dsbn = ReadNpc_("m206_00");			// �f�X�o�[��
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
	// �v�����e�E�X
	local prmt = ArrangePointNpc_(model_prmt, "npc_dsbn000");
	SetPointPosNoFit_(prmt, "npc_dsbn000");
	SetSilhouetteHideIfFar_(prmt, false);
	// �f�X�o�[��
	local dsbn = ArrangePointNpc_(model_dsbn, "npc_dsbn000");
	SetPointPosNoFit_(dsbn, "npc_dsbn000");
	SetScaleSilhouette(dsbn, SCALE.T, SILHOUETTE_WIDTH.T);
	SetSilhouetteHideIfFar_(dsbn, false);

// ����풓���[�V�����Ǎ�
	// �v�����e�E�X
	local prmt_die = ReadMotion_(prmt, "n026_die");							// ����
	// �f�X�o�[��
	local dsbn_die = ReadMotion_(dsbn, "m206_00_die");						// ����

// ���G�t�F�N�g�ݒ�
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);

	efc_bone0 = SetSelectBoneEffectSetBoneName_("ef731_08_mag_boss_die03", dsbn, "n_hara", Vec3(0.0, 0.0, 0.0));
	efc_bone1 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", dsbn, "j_kao1", Vec3(0.0, 0.0, 0.0));
	efc_bone2 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", prmt, "Chest_B", Vec3(0.0, 0.0, 0.0));
	efc_bone3 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", prmt, "LBicep", Vec3(0.0, 0.0, 0.0));
	efc_bone4 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", prmt, "LForearm", Vec3(0.0, 0.0, 0.0));
	efc_bone5 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", prmt, "LHand", Vec3(0.0, 0.0, 0.0));
	efc_bone6 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", prmt, "RBicep", Vec3(0.0, 0.0, 0.0));
	efc_bone7 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", prmt, "RForearm", Vec3(0.0, 0.0, 0.0));
	efc_bone8 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", prmt, "RHand", Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_bone0, 0.25);
	SetEffectScale_(efc_bone1, 0.25);
	SetEffectScale_(efc_bone2, 0.25);
	SetEffectScale_(efc_bone3, 0.25);
	SetEffectScale_(efc_bone4, 0.25);
	SetEffectScale_(efc_bone5, 0.25);
	SetEffectScale_(efc_bone6, 0.25);
	SetEffectScale_(efc_bone7, 0.25);
	SetEffectScale_(efc_bone8, 0.25);

// �����[�V�����ݒ�
	SetMotion_(dsbn, MOT_SPECIAL_WAIT, BLEND_N);
	SetMotionSpeed_(dsbn, 0.5);

	Wait_(1);	// ���C�h���[�V�����ɂ����邽�߁A1F�҂�
	RideOn_(prmt, dsbn, 606, SIZE_T);

	ChangeColorTone_(-0.3, -0.5, -0.2, 0);

	SetVisible(player, false);
	SetVisible(rena, false);
	SetVisible(island, false);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 90F


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	Wait_(60);
	DeleteTask_(task_cam);
	StartEarthQuake_(-1, 3, 2.0);

	// ���J�b�g�P���v�����e�E�X�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`

	//===============================================
	// ���v�����e�E�X
	// �u�O�����[�b�I�@����т邷�T�}�[�b�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_PROMETHEUS");
	ShowMsg_("DEMO_639_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	PlaySE_("SE_DEM_170");											//�v�����e�E�X&���J�o�[���iT�j����


	// ���J�b�g�Q���v�����e�E�X�Y�[���A�E�g�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 65F

	StartBlurEffect_();
	SetMotion_(prmt, prmt_die, BLEND_XL);
	SetMotion_(dsbn, dsbn_die, BLEND_XL);
	SetMotionSpeed_(prmt, 0.7);
	SetMotionSpeed_(dsbn, 0.5);
	efc_mag_boss_die04_000 = SetSelectBoneEffect_("ef731_09_mag_boss_die04", dsbn, ATTACH_EFFECT2);
	SetEffectScale_(efc_mag_boss_die04_000, 2.0);
	efc_mag_boss_die04_001 = SetSelectBoneEffect_("ef731_09_mag_boss_die04", prmt, ATTACH_EFFECT2);
	SetEffectScale_(efc_mag_boss_die04_001, 10.0);
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
	DeleteEffectEmitter_(efc_bone8);
	Wait_(40);
	StopEarthQuake_();
	Wait_(15);
	StartEarthQuake_(-1, 3, 30);
	Wait_(45);
	task_prmt = Task_ObjectFadeOut_(prmt, 15);
	task_dsbn = Task_ObjectFadeOut_(dsbn, 15);
	Wait_(30);
	ChangeColorTone_(-0.3, -0.5, -0.2, 30);
	Wait_(39);
	StartEarthQuake_(60, 3, 30);
	ChangeColorTone_(0.3, 0.3, 0.3, 50);
	Wait_(105);

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	Wait_(30);

	StopEarthQuake_();
	DeleteEffectEmitter_(efc_mag_boss_die04_000);
	DeleteEffectEmitter_(efc_mag_boss_die04_001);
	EndBlurEffect_();
	DeleteTask_(task_cam);


	// ���J�b�g�R����l���ƃ��i�[�e�Y�[���A�E�g�`�`�`�`�`�`�`�`		// �X�N�G�j�v�]�ɂ��CO
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 180F

	SetVisible(player, true);
	SetVisible(rena, true);
	SetVisible(island, true);
	Wait_(60);
	ChangeColorTone_(0.1, 0.1, 0.1, 60);
	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}
