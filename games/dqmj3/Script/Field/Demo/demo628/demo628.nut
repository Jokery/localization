//=============================================
//
//		demo628[����u���h���h]
//
//=============================================

function Update()
{
// ���ϐ���`
	local task_cam, task_player, task_rena, task_neo;
	local efc_cam, efc_neo;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_island = ReadGimmick_("o_com_10");	// ����
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_rena = ReadNpc_("n007");			// ���i�[�e
	local model_neo = ReadNpc_("m203_00");			// �u���h���h
	// �G�t�F�N�g
	LoadEffect_("ef733_02_sym_black_mist01");		// ������
	LoadEffect_("ef731_03_mag_boss_pollen01");		// �����ԕ�(��)
	LoadEffect_("ef731_04_mag_boss_pollen02");		// �����ԕ�(��)
	LoadEffect_("ef731_05_mag_boss_pollen03");		// �����ԕ�(��)
	LoadEffect_("ef733_01_sym_shuchusen01");				// �W����
	LoadEffect_("ef730_01_oth_dark_aura01");		// �ЁX�����I�[��

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
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// ���聨�퓬�ҋ@
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// �퓬�ҋ@�i�������jL
	// ���i�[�e
	local rena_run_L = ReadMotion_(rena, "n007_run_L");						// ����L
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");				// �������L
	// �u���h���h
	local neo_talk_L = ReadMotion_(neo, "m203_00_talk_L");					// ��bL

// ���G�t�F�N�g�ݒ�
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_neo = SetBoneEffect_("ef730_01_oth_dark_aura01", neo);

	SetSelectBoneEffectSetBoneName_("ef731_05_mag_boss_pollen03", neo, "Chest", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "LBicep", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "LForearm", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "LHand", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "RBicep", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "RForearm", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "RHand", Vec3(0.0, 0.0, 0.0));

// �����[�V�����ݒ�
	SetMotion_(player, player_run_battle, BLEND_N);
	task_player = Task_AnimeMoveNoDir_(player, "anm_player000");

	SetMotion_(rena, rena_run_L, BLEND_N);
	task_rena = Task_MoveToPointSetSpeed_(rena, "npc_rena001", 1.5);

	SetMotion_(neo, MOT_SPECIAL_WAIT, BLEND_N);
	SetMotionSpeed_(neo, 0.5);

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemoNoFade(FADE_COLOR_BLACK);

	// ���J�b�g�P����l���B�J�����C���`�`�`�`�`�`�`�`�`�`�`�`�`
	WaitTask(task_rena);
	SetMotion_(rena, rena_look_up_L, BLEND_L);
	WaitTask(task_player);
	SetMotion_(player, player_battle01_L, BLEND_M);

	//===============================================
	// *�u���h���h
	// �u���̍��݁c�c
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_628_MSG_010");
	KeyInputWait_();
	//===============================================
	// ��
	// �u�Y�ꂽ�Ƃ́@���킹�܂���I
	//-----------------------------------------------
	ShowMsg_("DEMO_628_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(neo, neo_talk_L, BLEND_N);		// ��bL
	SetMotionSpeed_(neo, 1);


	// ���J�b�g�Q���u���h���h�A�Y�[���C���`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F

	//-----------------------------------------------
	// ���u���h���h
	// �u���Q�̂��߁@�K���r���X���܂́@���`�J����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BUNDORUDO");
	ShowMsg_("DEMO_628_MSG_030");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u�����I�@���Ȃ����@�����Ă����܂��傤�I
	//-----------------------------------------------
	ShowMsg_("DEMO_628_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);


	// ���J�b�g�R���퓬�J�n�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye_2bndr", "anmtgt_2bndr");		// 10F

	SetMotion_(neo, MOT_SWORD_START, BLEND_L);
	PlaySE_("SE_DEM_163");													//�u���h���h�iT�j�퓬���O
	WaitMotion(neo);
	SetMotion_(neo, MOT_SWORD_ACTUATE, BLEND_L);
	Wait_(36);
	SetMotionSpeed_(neo, 0.01);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
	StopBgm_(BGM_STOP_DEF);
	local task = Task_EncountEffect_(ENCOUNT_BOSS);
	WaitTask(task);
	DeleteAllTask_();

	End_();
}
