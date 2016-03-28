//=============================================
//
//		demo316[�C�G�^�X�̎���]
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
	local task_silver,task_cam;
	local efc_smoke,efc_shuchusen,efc_ice01,efc_ice02;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();													// ��l��
	local model_silver = ReadNpc_("m077_00");										// �V���o�[ 
	local ice_wall = ReadGimmick_("o_I01_01");										// �X�̕�
	local ice_wall_flake = ReadGimmick_("o_I01_02");								// �X�̕ǂ̔j��
	local ietasu = ReadGimmick_("o_dem_08");

	//�M�~�b�N
	local res_ice = ArrangePointGimmick_("o_I01_01", ice_wall, "obj_ice_wall000");	// �X�̕�
	SetAlpha_(res_ice, 0.3);
	local die_ietasu = ArrangePointGimmick_("o_dem_08", ietasu, "obj_ietasu000");	// �X�Ђ��̃C�G�^�X
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player002");
	
	//�V���o�[
	local silver = ArrangePointNpc_(model_silver, "npc_silver002");
	SetScaleSilhouette(silver, SCALE.N, 0.5);
	SetStepSePan_(silver, false);

// ����풓���[�V�����Ǎ�
	//����l��
	local look_up = ReadMotion_(player, "Player_look_up_L");			// ������ҋ@
	local touch_wall = ReadMotion_(player, "Player_touch_wall_L");		// �ǂ�G��
	local surprise = ReadMotion_(player, "Player_surprise");			// ����
	local surprise_L = ReadMotion_(player, "Player_surprise_L");		// ����L
	local look_around = ReadMotion_(player, "Player_look_around_L");	// �L�����L����L
	local caution01 = ReadMotion_(player, "Player_caution01_L");		// �x��L
	local caution02 = ReadMotion_(player, "Player_caution02_L");		// �x�����ĕӂ������L
	local guard = ReadMotion_(player, "Player_guard");					// �x�����g�\����
	local guardL = ReadMotion_(player, "Player_guard_L");				// �g�\����L
	local caution = ReadMotion_(player, "Player_caution");				// �g�\���遨�x��
	local look_right = ReadMotion_(player, "Player_look_right_L");		// ��l���E������
	local nod_player = ReadMotion_(player, "Player_nod");				// ��l������
	
	//���V���o�[
	local sil_talk_L = ReadMotion_(silver, "m077_00_talk_L");			// �b��
	local sil_left_L = ReadMotion_(silver, "m077_00_wait_left_L");		// �E�����ҋ@
	local sil_fist_L = ReadMotion_(silver, "m077_00_hold_fist01_L");	// �������L	
	local sil_look_walk_L = ReadMotion_(silver, "m077_00_look_walk_L");	// �L�����L��������L	
	local sil_right_L = ReadMotion_(silver, "m077_00_wait_right_L");	// ����E������L	
	local sil_above_L = ReadMotion_(silver, "m077_00_wait_above_L");	// ������ҋ@L	
	local sil_touch_ice = ReadMotion_(silver, "m077_00_touch_ice_L");	// �X�ɐG��L	
	local sil_hold_fist = ReadMotion_(silver, "m077_00_hold_fist02_L");	// �������2L	
	local sil_wait_L = ReadMotion_(silver, "m077_00_wait_L");			// �ҋ@02L	
	

// ���G�t�F�N�g�ݒ�
	LoadEffect_("ef721_03_nat_smoke_n03");								// ��
	LoadEffect_("ef831_03_ice_break_s");								// �X�̕ǃq�r�����������Ɏg�p
	LoadEffect_("ef831_04_ice_break_l");								// �X�̕ǂ����ꂽ���Ɏg�p
	LoadEffect_("ef733_01_sym_shuchusen01");									// �W����

// ����l���������[�V����
	SetMotion_(player, look_up, BLEND_N);								// ��l���@������ҋ@
	SetMotion_(silver, sil_wait_L, BLEND_N);							// �V���o�[�ҋ@

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");										// 80F
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	//��������������������������������������
	//���J�b�g1�@�X�̕Ǖ����
	//��������������������������������������
	StartDemo(FADE_COLOR_BLACK);
	PlaySE_("SE_DEM_116");
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake000");					// �X�̂�����EF
	SetEffectScale_(efc_ice01, 1.0);
	Wait_(30);
	
	StartEarthQuake_(-1, 3, 0.1)																	// �n�k

	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake000");					// �X�̂�����EF
	SetEffectScale_(efc_ice01, 1.3);
	SetMotion_(player, surprise, BLEND_L);															// ��l���@����
	WaitMotion(player);
	SetMotion_(player, surprise_L, BLEND_L);														// ��l���@��L
	
	Wait_(25);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake000");					// �X�̂�����EF
	SetEffectScale_(efc_ice01, 0.8);
	Wait_(20);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake000");					// �X�̂�����EF
	SetEffectScale_(efc_ice01, 1.6);
	Wait_(15);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake001");					// �X�̂�����EF
	SetEffectScale_(efc_ice01, 1.0);
	
	//�ǂ̃q�r���S�̂ɍL����
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake002");					// �X�̂�����EF
	SetEffectScale_(efc_ice01, 1.0);
	Wait_(10);
	
	//�ǂ̃q�r���S�̂ɍL����
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake003");					// �X�̂�����EF
	SetEffectScale_(efc_ice01, 1.3);
	Wait_(7);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake001");					// �X�̂�����EF
	SetEffectScale_(efc_ice01, 1.5);
	Wait_(5);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake002");					// �X�̂�����EF
	SetEffectScale_(efc_ice01, 1.7);
	Wait_(3);
	
	StopEarthQuake_();
	DeleteTask_(task_cam);
	StartEarthQuake_(-1, 3, 0.8);																	// �n�k	
	//��������������������������������������
	//���J�b�g2�@�Y�[���A�E�g
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");										// 35F
	
	Wait_(3);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake003");					// �X�̂�����EF
	SetEffectScale_(efc_ice01, 1.9);
	Wait_(3);
	SetMotion_(player,guard, BLEND_M);																// ��l���@�g�\����
	WaitMotion(player);
	SetMotion_(player,guardL, BLEND_L);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake002");					// �X�̂�����EF
	SetEffectScale_(efc_ice01, 3.0);
	
	//�X�̕Ǌ����
	
	//===============================================
	//���t���b�V���̂悤�ȃt�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);

	Wait_(20);
	SetVisible(res_ice, false);																		// �X�ǂ̏���
	WaitTask(task_cam);
	StopEarthQuake_();
	local res_ice02 = ArrangePointGimmick_("o_I01_02", ice_wall_flake, "obj_ice_wall000");			// �X�̕ǂ̔j��
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	//===============================================
	
	efc_smoke = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "player000");						// ��
	efc_ice02 = SetPointWorldEffect_("ef831_04_ice_break_l", "efc_ice_brake000");					// �X����EF
	SetEffectScale_(efc_ice02, 1.5);
	
	SetEffectScale_(efc_smoke, 2.5);
	Wait_(90);	
		
	SetMotion_(player, caution02, BLEND_L);															// ��l���K�[�h���L�����L����
	DeleteTask_(task_cam);

	//��������������������������������������
	//���J�b�g3�@�V���o�[�A�b�v
	//��������������������������������������
	SetPointPos_(silver, "npc_silver000");
	InitSilhouetteWidth_(silver, 0.6);
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	//===============================================
	//*�V���o�[
	// 	�u����́c�c�B���������I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_316_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	//����������������������������������������������
	//���J�b�g4�@�C�G�^�X����
	//����������������������������������������������
	SetMotion_(player, MOT_WAIT, BLEND_M);															// ��l���ҋ@
	
	// ���J�����ݒ� �p���A�b�v���Y�[���C���i�����j
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	Wait_(75);	
	
//	PlaySE_("SE_DEM_001");																			// �W����
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_shuchusen = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	
	//===============================================
	//*�V���o�[
	// 	�u���c�����̓C�G�^�X�b�I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_316_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteEffect_(efc_shuchusen);	
	
	SetAlpha_(player, ALPHA_CLEAR);																	// ���l�ݒ� ��l������
	
	DeleteTask_(task_cam);
	
	//����������������������������������������������
	//���J�b�g5�@�V���o�[���̂ɋ߂Â�
	//����������������������������������������������
	// ���J�����ݒ�
	InitSilhouetteWidth_(silver, 1.4);
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	//�V���o�[�ړ�
	SetPointPos_(silver, "npc_silver001");
	
	//�V���o�[ 2�A3���C�G�^�X�ɋ߂Â�
	SetMotion_(silver, MOT_WALK, BLEND_N);									// �V���o�[����
	task_silver = Task_MoveForward_(silver, 1.0, false);
	
	Wait_(50);	
	
	DeleteTask_(task_silver);
	SetMotion_(silver, sil_above_L, BLEND_L);								// �V���o�[������ҋ@
	
	//===============================================
	//*�V���o�[
	// �u�����Ɂ@�C�G�^�X�̎��̂�����ȏ�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_316_MSG_030");
	KeyInputWait_();
	//===============================================
	SetMotion_(silver, sil_touch_ice, BLEND_XL);							// �X�Ђ��C�G�^�X�ɐG��
	WaitTask(task_cam);
	
	//����������������������������������������������
	//���J�b�g6�@�V���o�[�@�Y�[���C��
	//����������������������������������������������
	
	// ���J�����ݒ�
	InitSilhouetteWidth_(silver, 0.9);
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	//===============================================
	//*�V���o�[
	// �u�܂�@���ׂẮ@�C�G�^�X��
	//-----------------------------------------------
	ShowMsg_("DEMO_316_MSG_040");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*�V���o�[
	//�u�����P�����ړI�́@�I�T�̏؂�D�����߁c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_316_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);

	//����������������������������������������������
	//���J�b�g7�@�V���o�[�@��l��
	//����������������������������������������������
	// ���J�����ݒ�
	InitSilhouetteWidth_(silver, 1.2);
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	//��l���\��
	SetAlpha_(player, ALPHA_EXIST);
	
	//��l���ړ�
	SetPointPos_(player, "player001");
	
	//��l���ҋ@
	SetMotion_(player, look_right, BLEND_N);								// ��l���E�����ҋ@
	
	//�V���o�[��l���̕�������
	SetMotion_(silver, MOT_WALK, BLEND_M);									// �V���o�[����
	task_silver = Task_RotateToPos_(silver,Vec3(-186,52,-115), 4);
	WaitTask(task_silver);
	DeleteTask_(task_silver);
	SetMotion_(silver, sil_hold_fist, BLEND_M);								// �V���o�[���Ԃ������	
	
	//===============================================
	//*�V���o�[
	// �u�I�T�̏؂́@�ӂ�����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_316_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	//����������������������������������������������
	//���J�b�g8�@�V���o�[�A�b�v
	//����������������������������������������������
	InitSilhouetteWidth_(silver, 0.8);
	SetAlpha_(player, ALPHA_CLEAR);											// ���l�ݒ� ��l������
//	SetMotion_(silver, sil_fist_L, BLEND_N);								// �V���o�[���Ԃ�L
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	
	WaitTask(task_cam);
	
	//===============================================
	//*�V���o�[
	// �u<name_player/>�@���ށI�@�A�C�X�p�[�N�ɖ߂�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_316_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	
	EndDemo(FADE_COLOR_BLACK);
}
