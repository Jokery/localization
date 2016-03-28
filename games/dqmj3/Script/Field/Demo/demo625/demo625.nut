//=============================================
//
//		demo625[����{�[�V���b�N]
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
	local model_neo = ReadNpc_("m207_00");			// �{�[�V���b�N
	// �G�t�F�N�g
	LoadEffect_("ef733_02_sym_black_mist01");		// ������
	LoadEffect_("ef731_03_mag_boss_pollen01");		// �����ԕ�(��)
	LoadEffect_("ef731_04_mag_boss_pollen02");		// �����ԕ�(��)
	LoadEffect_("ef731_05_mag_boss_pollen03");		// �����ԕ�(��)
	LoadEffect_("ef730_01_oth_dark_aura01");		// �ЁX�����I�[��

// ���z�u
	// ����
	local island = ArrangePointGimmick_("o_com_10", model_island, "obj_island000");
	
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// �{�[�V���b�N
	local neo = ArrangePointNpc_(model_neo, "npc_bor000");
	SetPointPosNoFit_(neo, "npc_bor000");
	SetScaleSilhouette(neo, SCALE.T, SILHOUETTE_WIDTH.T);
	SetSilhouetteHideIfFar_(neo, false);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// ���聨�퓬�ҋ@
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// �퓬�ҋ@�i�������jL
	// ���i�[�e
	local rena_run_L = ReadMotion_(rena, "n007_run_L");						// ����L
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");				// �������L
	// �{�[�V���b�N
	local neo_talk_L = ReadMotion_(neo, "m202_00_talk_L");					// ��bL
	local neo_attack = ReadMotion_(neo, "m202_00_attack");					// ��b���P���|����

// ���G�t�F�N�g�ݒ�
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_neo = SetBoneEffect_("ef730_01_oth_dark_aura01", neo);
	
	SetSelectBoneEffectSetBoneName_("ef731_05_mag_boss_pollen03", neo, "Hip_root", Vec3(0.0, 5.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_ude_a_l", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_ude_b_l", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_te_l", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_ude_a_r", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_ude_b_r", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_te_r", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_kubi", Vec3(0.0, 0.0, 0.0));

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	Wait_(15);		// �嗤�̃`�����h�~

// �����[�V�����ݒ�
	SetMotion_(player, player_run_battle, BLEND_N);
	task_player = Task_AnimeMoveNoDir_(player, "anm_player000");
	
	SetMotion_(rena, rena_run_L, BLEND_N);
	task_rena = Task_MoveToPointSetSpeed_(rena, "npc_rena001", 1.5);
	
	SetMotion_(neo, MOT_SPECIAL_WAIT, BLEND_N);
	SetMotionSpeed_(neo, 0.5);

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
	// *�{�[�V���b�N
	// �u���͂͂͂͂́I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_625_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�Y�ꂽ���H�@�I�����I�@�{�[�V���b�N���I
	//-----------------------------------------------
	ShowMsg_("DEMO_625_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	SetMotion_(neo, neo_talk_L, BLEND_N);		// ��bL
	SetMotionSpeed_(neo, 1);
	
	// ���J�b�g�Q���{�[�V���b�N�A�Y�[���C���`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F
	
	//-----------------------------------------------
	// ���{�[�V���b�N
	// �u�K���r���X���܂́@�̑�ȃ`�J����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	ShowMsg_("DEMO_625_MSG_030");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�K���r���X���܂̌��ւ́@�s�����Ȃ��ׁI
	//-----------------------------------------------
	ShowMsg_("DEMO_625_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	SetVisible(player, false);
	SetVisible(rena, false);
	SetVisible(island, false);
	
	// ���J�b�g�R���퓬�J�n�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye_1bor", "anmtgt_1bor");		// 10F
	
	PlaySE_("SE_DEM_161");

	SetMotion_(neo, MOT_SPELL_ACTUATE, BLEND_L);
	PlaySE_("SE_DEM_161");
	SetDir_(neo, GetDir_(neo)+2);
	task_neo = Task_AnimeMoveNoDir_(neo, "anm_bor000");
	Wait_(15);
	
	EncountEndDemo(ENCOUNT_BOSS);
}
