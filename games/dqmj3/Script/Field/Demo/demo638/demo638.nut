//=============================================
//
//		demo638[�f�X�o�[�����v�����e�E�X]
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
	local efc_cam, efc_dsbn;

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
	// ��l��
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// ���聨�퓬�ҋ@
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// �퓬�ҋ@�i�������jL
	// ���i�[�e
	local rena_run_L = ReadMotion_(rena, "n007_run_L");						// ����L
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");				// �������L
	// �v�����e�E�X
	local prmt_attack = ReadMotion_(prmt, "n026_attack");					// �U��
	local prmt_ride = ReadMotion_(prmt, "n026_ride_L");					// �U��	
	// �f�X�o�[��
	local dsbn_Hovering_L = ReadMotion_(dsbn, "m206_00_flight_Hovering_L");	// �z�o�����OL

// ���G�t�F�N�g�ݒ�
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_dsbn = SetBoneEffect_("ef730_01_oth_dark_aura01", dsbn);
	
	local effectId = SetPointWorldEffect_("ef731_03_mag_boss_pollen01", "1");
	local effectId2 = SetPointWorldEffect_("ef731_03_mag_boss_pollen01", "2");
	local effectId1 = SetPointWorldEffect_("ef731_03_mag_boss_pollen01", "3");
	SetEffectScale_(effectId, 10.0);
	SetEffectScale_(effectId2, 10.0);
	SetEffectScale_(effectId1, 10.0);

// �����[�V�����ݒ�
	SetMotion_(player, player_run_battle, BLEND_N);
	task_player = Task_AnimeMoveNoDir_(player, "anm_player000");
	
	SetMotion_(rena, rena_run_L, BLEND_N);
	task_rena = Task_MoveToPointSetSpeed_(rena, "npc_rena001", 1.5);
	
	SetMotion_(dsbn, dsbn_Hovering_L, BLEND_N);

	RideOn_(prmt, dsbn, 606, SIZE_T);
	Wait_(1);	// ���C�h���[�V�����ɂ����邽�߁A1F�҂�
	SetMotion_(prmt, prmt_ride, BLEND_N);	

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
	// *�v�����e�E�X
	// �u�O�������c�c���c�P�^�]�@����т邷�T�}�m
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_638_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	// ���J�b�g�Q���f�X�o�[���A�Y�[���C���`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 70F
	
	//-----------------------------------------------
	// ��
	// �u�O���������I�@���~�K�G�b�^�@�Ղ�߂Ă����g
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_638_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	
	// ���J�b�g�R���퓬�J�n�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye_5dsbn", "anmtgt_5dsbn");		// 10F
		
	PlaySE_("SE_DEM_169");													//�v�����e�E�X&���J�o�[���iT�j�퓬���O

	SetPointPos_(island, "obj_island001");
	SetVisible(player, false);
	SetVisible(rena, false);
	Wait_(10);
	SetMotionSpeed_(prmt, 0.5);
	SetMotion_(prmt, prmt_attack, BLEND_M);
	SetMotionSpeed_(dsbn, 0.58);
	SetMotion_(dsbn, MOT_SPELL_ACTUATE, BLEND_XL);
	Wait_(55);
	
	EncountEndDemo(ENCOUNT_BOSS);
}
