//=============================================
//
//		demo631[����A�[�U���[�N]
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
	local model_neo = ReadNpc_("m204_00");			// �A�[�U���[�N
	// �G�t�F�N�g
	LoadEffect_("ef733_02_sym_black_mist01");		// ������
	LoadEffect_("ef731_03_mag_boss_pollen01");		// �����ԕ�(��)
	LoadEffect_("ef731_04_mag_boss_pollen02");		// �����ԕ�(��)
	LoadEffect_("ef731_05_mag_boss_pollen03");		// �����ԕ�(��)
	LoadEffect_("ef733_01_sym_shuchusen01");		// �W����
	LoadEffect_("ef730_01_oth_dark_aura01");		// �ЁX�����I�[��
	
// ���z�u
	// ����
	local island = ArrangePointGimmick_("o_com_10", model_island, "obj_island000");
	
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// �A�[�U���[�N
	local neo = ArrangePointNpc_(model_neo, "npc_azmk000");
	SetPointPosNoFit_(neo, "npc_azmk000");
	SetScaleSilhouette(neo, SCALE.NEO_AZAMUKU, SILHOUETTE_WIDTH.T);
	SetSilhouetteHideIfFar_(neo, false);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// ���聨�퓬�ҋ@
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// �퓬�ҋ@�i�������jL
	// ���i�[�e
	local rena_run_L = ReadMotion_(rena, "n007_run_L");						// ����L
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");				// �������L
	// �A�[�U���[�N
	local neo_talk_L = ReadMotion_(neo, "m204_00_talk_L");					// ��bL

// ���G�t�F�N�g�ݒ�
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_neo = SetBoneEffect_("ef730_01_oth_dark_aura01", neo);
	
	SetSelectBoneEffectSetBoneName_("ef731_05_mag_boss_pollen03", neo, "j_sebo_Root", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_ude_a_l", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_ude_b_l", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_te_l", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_ude_a_r", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_ude_b_r", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_te_r", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "j_kao", Vec3(0.0, 0.0, 0.0));

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
	// *�A�[�U���[�N
	// �u�z�[�b�z�b�z�b�z�I
	//-----------------------------------------------
	OpenMsgWnd_();	
	ShowMsg_("DEMO_631_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u���̃A�[�U���[�N�@�K���r���X���܂ɂ��
	//-----------------------------------------------
	ShowMsg_("DEMO_631_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	SetMotion_(neo, neo_talk_L, BLEND_N);		// ��bL
	SetMotionSpeed_(neo, 1);
	
	// ���J�b�g�Q���A�[�U���[�N�A�Y�[���C���`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F
	
	//-----------------------------------------------
	// ���A�[�U���[�N
	// �u�K���r���X���܂��󂯂��@�����I
	//-----------------------------------------------
	OpenMsgWnd_();	
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_631_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	PlaySE_("SE_DEM_165");													//�A�[�U���[�N�iT�j�퓬���O
	
	// ���J�b�g�R���퓬�J�n�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye_3azmk", "anmtgt_3azmk");		// 10F
	
	SetMotionSpeed_(neo, 0.7);
	SetMotion_(neo, MOT_SPELL_ACTUATE, BLEND_M);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
	Wait_(36/0.7);

	StopBgm_(BGM_STOP_DEF);
	local task = Task_EncountEffect_(ENCOUNT_BOSS);
	WaitTask(task);
	DeleteAllTask_();
	End_();
}
