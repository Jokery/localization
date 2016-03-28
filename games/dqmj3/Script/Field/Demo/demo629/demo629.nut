//=============================================
//
//		demo629[����u���h���h�폟��]
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
	local efc_bone0, efc_bone1, efc_bone2, efc_bone3, efc_bone4, efc_bone5, efc_bone6;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_island = ReadGimmick_("o_com_10");	// ����
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_rena = ReadNpc_("n007");			// ���i�[�e
	local model_neo = ReadNpc_("m203_00");			// �u���h���h
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
	// �u���h���h
	local neo = ArrangePointNpc_(model_neo, "npc_bndr000");
	SetPointPosNoFit_(neo, "npc_bndr000");
	SetScaleSilhouette(neo, SCALE.T, SILHOUETTE_WIDTH.T);
	SetSilhouetteHideIfFar_(neo, false);

// ����풓���[�V�����Ǎ�
	// ��l��
	//local player_look_right_L = ReadMotion_(player, "Player_look_right_L");	// �E������L
	// ���i�[�e
	//local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");			// ��������L
	// �u���h���h
	local neo_die = ReadMotion_(neo, "m203_00_die");						// ����

// ���G�t�F�N�g�ݒ�
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_bone0 = SetSelectBoneEffectSetBoneName_("ef731_08_mag_boss_die03", neo, "Chest", Vec3(0.0, 0.0, 0.0));
	efc_bone1 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "LBicep", Vec3(0.0, 0.0, 0.0));
	efc_bone2 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "LForearm", Vec3(0.0, 0.0, 0.0));
	efc_bone3 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "LHand", Vec3(0.0, 0.0, 0.0));
	efc_bone4 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "RBicep", Vec3(0.0, 0.0, 0.0));
	efc_bone5 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "RForearm", Vec3(0.0, 0.0, 0.0));
	efc_bone6 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "RHand", Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_bone0, 1.6);
	SetEffectScale_(efc_bone1, 1.6);
	SetEffectScale_(efc_bone2, 1.6);
	SetEffectScale_(efc_bone3, 1.6);
	SetEffectScale_(efc_bone4, 1.6);
	SetEffectScale_(efc_bone5, 1.6);
	SetEffectScale_(efc_bone6, 1.6);

// �����[�V�����ݒ�
	SetMotion_(neo, MOT_SPECIAL_WAIT, BLEND_N);
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
	StartEarthQuake_(-1, 3, 1);

	// ���J�b�g�P���u���h���h�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`

	//===============================================
	// ���u���h���h
	// �u�L�����������c�c���ǁ@���̐��ɋt�߂�`�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BUNDORUDO");
	ShowMsg_("DEMO_629_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	// ���J�b�g�Q���u���h���h�Y�[���A�E�g�`�`�`�`�`�`�`�`�`�`
	PlaySE_("SE_DEM_164");											//�u���h���h�iT�j����
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 65F
	StartBlurEffect_();

	SetMotion_(neo, neo_die, BLEND_L);
	SetMotionSpeed_(neo, 0.65); //���ʂƂ��̃��[�V�����X�s�[�h���������ɁB
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

//	// ���J�b�g�R����l���ƃ��i�[�e�Y�[���A�E�g�`�`�`�`�`�`�`�`		//�X�N�G�j�v�]�ɂ��CO
//	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 180F

//	SetVisible(player, true);
//	SetVisible(rena, true);
//	SetVisible(island, true);

//	Wait_(60);
//	ChangeColorTone_(0.1, 0.1, 0.1, 60);

//	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}
