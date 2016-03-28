//=============================================
//
//		demo634[����C�b�^�u��]
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
	local efc_cam, efc_neo;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_island = ReadGimmick_("o_com_10");	// ����
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_rena = ReadNpc_("n007");			// ���i�[�e
	local model_neo = ReadNpc_("m205_00");			// �C�b�^�u��
	// �G�t�F�N�g
	LoadEffect_("ef733_02_sym_black_mist01");		// ������
	LoadEffect_("ef731_03_mag_boss_pollen01");		// �����ԕ�(��)
	LoadEffect_("ef731_04_mag_boss_pollen02");		// �����ԕ�(��)
	LoadEffect_("ef731_05_mag_boss_pollen03");		// �����ԕ�(��)
	LoadEffect_("ef730_01_oth_dark_aura01");		// �ЁX�����I�[��

// ���z�u
	// ����
	local ukisima = ArrangePointGimmick_("o_com_10", model_island, "ukisima");
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// �C�b�^�u��
	local neo = ArrangePointNpc_(model_neo, "npc_itbr000");
	SetPointPosNoFit_(neo, "npc_itbr000");
	SetScaleSilhouette(neo, 7, SILHOUETTE_WIDTH.T);
	SetSilhouetteHideIfFar_(neo, false);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// ���聨�퓬�ҋ@
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// �퓬�ҋ@�i�������jL
	// ���i�[�e
	local rena_run_L = ReadMotion_(rena, "n007_run_L");						// ����L
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");				// �������L

// ���G�t�F�N�g�ݒ�
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_neo = SetBoneEffect_("ef730_01_oth_dark_aura01", neo);

	SetSelectBoneEffectSetBoneName_("ef731_05_mag_boss_pollen03", neo, "Waist", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "Neck", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "L_Bicep", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "LForearm", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "LWrist", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "R_Bicep", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "RForearm", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "RWrist", Vec3(0.0, 0.0, 0.0));

// ���J�����ݒ�
	SetPointCameraEye_("0_eye");
	SetPointCameraTarget_("0_tgt");
	Wait_(15);		// �嗤�̃`�����h�~

// �����[�V�����ݒ�
	SetMotion_(player, player_run_battle, BLEND_N);
	task_player = Task_MoveToPointSetSpeed_(player, "player001", 1.5);

	SetMotion_(rena, rena_run_L, BLEND_N);
	task_rena = Task_AnimeMove_(rena, "rena_anm");

	SetMotion_(neo, MOT_WAIT, BLEND_N);
	SetMotionSpeed_(neo, 0.5);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	// ���J�b�g�P����l���B�J�����C���`�`�`�`�`�`�`�`�`�`�`�`�`
	WaitTask(task_rena);
	SetMotion_(rena, rena_look_up_L, BLEND_M);
	WaitTask(task_player);
	SetMotion_(player, player_battle01_L, BLEND_M);

	//===============================================
	// *�C�b�^�u��
	// �u�҂̂ł���I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_634_MSG_010");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u���̃C�b�^�u���@�K���r���X���܂̂��`�J����
	//-----------------------------------------------
	ShowMsg_("DEMO_634_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(neo, MOT_WAIT, BLEND_N);
	SetMotionSpeed_(neo, 1);
	SetPointPos_(neo, "npc_itbr001");


	// ���J�b�g�Q���C�b�^�u���A�Y�[���C���`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("1_eye", "1_tgt");		// 10F

	//-----------------------------------------------
	// ���C�b�^�u��
	// �u�K���r���X���܂Ɂ@�w�Ȃ������X�^�[�}�X�^�[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_634_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);


	// ���J�b�g�R���퓬�J�n�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("2_eye", "2_tgt");		// 10F

	SetVisible(player, false);
	SetVisible(rena, false);
	SetVisible(ukisima, false);
	SetMotion_(neo, MOT_SPELL_START, BLEND_M);
	PlaySE_("SE_DEM_167");									//�C�b�^�u���iT�j�퓬���O
	SetMotionSpeed_(neo, 0.6);	// 0.5���Ƒ����Ƃ̎��Ȃ̂�0.45��
	WaitMotion(neo);
	SetMotion_(neo, MOT_SPELL_ACTUATE, BLEND_M);
	Wait_(36/0.6);			// 36:�f�t�H���g���̃^�C�~���O/0.6:���[�V�����X�s�[�h
	Wait_(15);
	StopBgm_(BGM_STOP_DEF);
	local task_boss = Task_EncountEffect_(ENCOUNT_BOSS);
	WaitTask(task_boss);
	DeleteAllTask_();

	End_();
}