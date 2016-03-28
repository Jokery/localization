//=============================================
//
//		demo048[���i�[�e�o��_1(�y��)]
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
	local task_cam, task_player, task_rena, task_sancho;
	local efc_cam, efc_player, efc_sancho0, efc_sancho1, efc_sancho2, efc_rena, efc_wormhole ,efc_bird;
	local effect_pos = Vec3(0, -1.5, 0);	// ��l���p�G�t�F�N�g���AEffect1���Ⴂ�ʒu�ɕ\������

// ��LOD�ǂݍ���
	ReadWaitingLod("cameye003", "camtgt003");

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_reactor = ReadGimmick_("o_dem_11");		// ���A�N�^�[
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_rena = ReadNpc_("n007");				// ���i�[�e
	local model_sancho = ReadNpc_("n011");				// �T���`���i�ϐg�O�j
	local model_sancho_after = ReadNpc_("m179_00");		// �T���`���i�ϐg��j
	// �G�t�F�N�g
	LoadEffect_("ef710_02_cha_heroi_atc01");			// �q���C���̍U���P
	LoadEffect_("ef710_03_cha_heroi_atc02");			// �q���C���̍U���Q
	LoadEffect_("ef732_10_wormhole_black");				// �������
	LoadEffect_("ef732_09_light_reactor_c");			// ���A�N�^�[�̌�
	LoadEffect_("ef732_08_light_scan");					// �X�L�����̌�
	LoadEffect_("ef712_10_emo_surprise01");				// �u�I�v
	LoadEffect_("ef721_03_nat_smoke_n03");				// ����
	LoadEffect_("ef804_02_beacon_reactor");				// �K�C�h�r�[�R��
	LoadEffect_("ef804_03_tran_sancho");				// �g�����X�t�H�[��
	LoadEffect_("ef720_01_nat_oth_birds");				// ��
	LoadEffect_("ef733_01_sym_shuchusen01");			// �W����(����)
	LoadEffect_("ef804_04_death_sancho01");				// �U�����󂯂���
	LoadEffect_("ef804_05_death_sancho02");				// �r���r��
	LoadEffect_("ef804_06_death_sancho03");				// ����
	LoadEffect_("ef723_01_nat_explosion_n01");			// �R���\�[������
	

// ���z�u
	// �M�~�b�N
	local reactor = ArrangePointGimmick_("o_dem_11", model_reactor, "obj_reactor000");
	// ��l��
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_left");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetPointPosNoFit_(rena, "npc_rena000");
	SetFace_(rena, "Face_loop_close");
	// �T���`���i�ϐg�O�j
	local sancho = ArrangePointNpc_(model_sancho, "npc_sancho000");
	SetScaleSilhouette(sancho, SCALE.SANCHO, SILHOUETTE_WIDTH.SANCHO);
	SetStepSe_(sancho, SILENT_STEP_SE);									// ������ �����ɂ���
	// �T���`���i�ϐg��j
	local sancho_after = ArrangePointNpc_(model_sancho_after, "npc_sancho_after000");
	SetScaleSilhouette(sancho_after, SCALE.M, SILHOUETTE_WIDTH.S);
	SetAlpha_(sancho_after, ALPHA_CLEAR);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");				// �퓬�ҋ@L�i�������j
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");			// �x��L
	local player_cage_turn = ReadMotion_(player, "Player_cage_turn");				// ����������U�����
	local player_cage_turn_L = ReadMotion_(player, "Player_cage_turn_L");			// �U�����
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");			// ���������������L
	local player_reactor = ReadMotion_(player, "Player_touch_reactor");				// ��������������遨���A�N�^�[��G��
	local player_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");			// ���A�N�^�[��G��L
	local player_surprise = ReadMotion_(player, "Player_surprise");					// ��l���@����
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");				// ��l���@����L
	
	// ���i�[�e
	local rena_reach_hand = ReadMotion_(rena, "n007_reach_hand");					// �ҋ@�����L�΂�
	local rena_appearance = ReadMotion_(rena, "n007_appearance");					// �o��
	local rena_attack_start = ReadMotion_(rena, "n007_attack_start");				// �ҋ@���U���J�n
	local rena_attack_start_L = ReadMotion_(rena, "n007_attack_start_L");			// �U���J�nL
	local rena_attack02 = ReadMotion_(rena, "n007_attack02");						// �T���`���ɍU��
	local rena_attack02_L = ReadMotion_(rena, "n007_attack02_L");					// �T���`���ɍU��L
	
	// �T���`���i�ϐg�O�j
	local sancho_warning_L = ReadMotion_(sancho, "n011_warning_L");					// �x��L
	
	// �T���`���i�ϐg��j
	local sancho_explosion = ReadMotion_(sancho_after, "m179_00_explosion");		// ��������
	local sancho_explosion_L = ReadMotion_(sancho_after, "m179_00_explosion_L");	// ��������L
	local sancho_death = ReadMotion_(sancho_after, "m179_00_death");				// ���S����

// �����[�V�����ݒ�
	// ��l��
	SetMotion_(player, player_reactor_L, BLEND_N);		// ���A�N�^�[��G��LOOP

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 60F
//	PlayBgm_("BG_AMBI_005");//�f�o�b�O�pBGM

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P����l���փY�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`
	Wait_(15);
	SetMotion_(player, player_look_left_L, BLEND_XL);		// ������LOOP
	Wait_(15);
	
//	efc_player = SetBoneEffect_("ef732_09_light_reactor_c", player);
	efc_player = SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1, effect_pos);		// �K�C�h�r�[�R��
	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	Wait_(15);
	
	//===============================================
	// ���Ȃ��̋@�B
	// �u������@���p�҂̊m�F���@�s���܂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYMACHINE");
	ShowMsg_("DEMO_048_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	DeleteEffect_(efc_player);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetFace_(player, "Face_eyes_close");
	efc_player = SetSelectBoneEffect_("ef732_08_light_scan", player, ATTACH_GLOBAL);		// �X�L�����̌�
	PlaySE_("SE_FLD_235");
	// ���J�b�g�Q����l���ւo�`�m�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 120F
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	//===============================================
	// ���Ȃ��̋@�B
	// �u�o�^����Ă���@�c�m�`�f�[�^�ƈ�v�c�c
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYMACHINE");
	ShowMsg_("DEMO_048_MSG_020");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u�v���O�������@�����Đ��B
	//-----------------------------------------------
	ShowMsg_("DEMO_048_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�R����l������Y�[���A�E�g�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 60F
	SetMotion_(player, player_caution01_L, BLEND_L);				// �x��
	efc_player = SetSelectBoneEffectSetOffset_("ef804_02_beacon_reactor", player, ATTACH_EFFECT1, effect_pos);		// �K�C�h�r�[�R��
	
	PlaySE_("SE_DEM_063");											// ��SE:�K�C�h�r�[�R��
	
	Wait_(60);
	DeleteTask_(task_cam);
	DeleteEffect_(efc_player);
	
	// ���J�b�g�S��������ї��i�H�j�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	efc_bird = SetPointWorldEffect_("ef720_01_nat_oth_birds", "efc_bird000");
	Wait_(180);
	
	// ���J�b�g�T���T���`���̃A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	Wait_(10);
	efc_sancho0 = SurpriseDisp(sancho);
	task_sancho = Task_RotateToDir_(sancho, -60, ROTATE_DEMO_DEF);
	WaitTask(task_sancho);
	DeleteTask_(task_sancho);
	
	SetFace_(sancho, "Face_warning");
	Wait_(30);
	
	// �Y�[���A�E�g
	task_cam = Task_AnimeMoveCamera_("anmeye012", "anmtgt012");			// 30F
	SetMotion_(sancho, MOT_WALK, BLEND_L);
	task_sancho = Task_MoveForward_(sancho, 4.0, false);
	PlaySE_("SE_FLD_040");											//��SE:�T���`�������i���V�����X�^�[�̑����j
	Wait_(15);
	PlaySE_("SE_FLD_040");											//��SE:�T���`�������i���V�����X�^�[�̑����j
	Wait_(45);
	PosDebug(sancho);
	
	SetMotion_(sancho, MOT_WAIT, BLEND_N);
	DeleteTask_(task_sancho);
	DeleteTask_(task_cam);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	StopBgm_(15);
	WaitFade_();
	
	SetBgBlack_(true);
	
	// �^�����ȉ��
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	//-----
	
	// ���J�b�g�S�����i�[�e�ւo�`�m�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 120F
	StartBlurEffect_();
	Wait_(30);
	
	//===============================================
	// *�Ȃ��̏���
	// �u�c�c�����B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_048_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
	
	//===============================================
	// *�Ȃ��̏���
	// �u�c�c�������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_048_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
	
	//===============================================
	// *�Ȃ��̏���
	// �u����Ɓc�c�������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_048_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, rena_reach_hand, BLEND_M);		// �ҋ@�����L�΂�
	SetMotionSpeed_(rena, 0.75);
	WaitMotion(rena);
	
//	Wait_(30);
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	EndBlurEffect_();
	
	SetBgBlack_(false);
	SetMotion_(player, player_caution01_L, BLEND_N);				// �x��
	
//	//-----
//	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 5);
//	WaitFade_();
	
	// ���J�b�g�U��������Ԃ��o������`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	efc_wormhole = SetPointWorldEffect_("ef732_10_wormhole_black", "efc_wormhole000");
	PlaySE_("SE_DEM_064");											// ��SE:�����̌����烌�i�[�e

	Wait_(90);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 5);
	WaitFade_();
	
//	DeleteEffect_(efc_wormhole);
	
	SetPointPos_(rena, "npc_rena001");
	SetMotion_(rena, rena_appearance, BLEND_N);		// �o��
	SetMotionSpeed_(rena, 0.5);
	
	// ���J�b�g�V�����i�[�e�o��`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 110F
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 10);
	//-----
	
	Wait_(55);
	SetMotionSpeed_(rena, 1.0);
	Wait_(43);
	PlaySE_("SE_FLD_015");		// �����i�����j
	
	Wait_(55);
	SetFace_(rena, "Face_default");
	
	WaitMotion(rena);
	SetMotion_(rena, MOT_WAIT, BLEND_M);
	
	WaitTask(task_cam);
	DeleteEffect_(efc_wormhole);
	
	// ���J�b�g�W�����i�[�e�A�Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 60F
	WaitTask(task_cam);
	
	Wait_(60);
	
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotionSpeed_(rena, 1.0);
	
	// ���J�b�g�X����l���A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// ���Ȃ��̏���
	// �u�T�����c�c���Ȃ��̂��ƁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_048_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(player, "player001");
	
	SetPointPos_(rena, "npc_rena002");
	SetMotion_(rena, MOT_WAIT, BLEND_N);
	
	SetPointPos_(sancho, "npc_sancho001");
	task_sancho = Task_MoveToPointSetSpeed_(sancho, "npc_sancho002", 1.5);
	SetMotion_(sancho, sancho_warning_L, BLEND_N);		// �x��
//	SetMotion_(sancho, MOT_RUN, BLEND_N);
	SetFace_(sancho, "Face_warning");
	
	// ���J�b�g10���T���`���A��l���̑O�ց`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");			// 10F
	PlaySE_("SE_DEM_026");													// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
	
	WaitTask(task_sancho);
	DeleteTask_(task_sancho);
	
//	SetMotion_(sancho, sancho_warning_L, BLEND_M);		// �x��
	task_sancho = Task_RotateToDir_(sancho, -20, ROTATE_DEMO_DEF);
//	WaitTask(task_sancho);
//	DeleteTask_(task_sancho);
	
	SetMotion_(player, player_surprise, BLEND_M);					// ����
	task_player = Task_ChangeMotion_(player, player_surprise_L, BLEND_M);
	
	//===============================================
	// ���T���`��
	// �u�C�P�}�Z���@�S��l�T�}�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_048_MSG_080");
	KeyInputWait_();
	
	DeleteTask_(task_cam);
	DeleteEffect_(efc_cam);
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(rena, ALPHA_CLEAR);
	
	// ���J�b�g11���T���`���̃A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	//-----------------------------------------------
	// ��
	// �u���C�i���j�i�b�e�n�@�_���f�X�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_048_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// �Y�[���C��
	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");			// 10F
//	PlaySE_("SE_DEM_026");												// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// �W����
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	WaitFade_();
	PlaySE_("SE_DEM_065");											// ��SE:�T���`���ό`
	
	DeleteTask_(task_cam);
	DeleteTask_(task_sancho);
	DeleteTask_(task_player);
	DeleteEffect_(efc_cam);
	
	SetAlpha_(sancho, ALPHA_CLEAR);
	SetAlpha_(sancho_after, ALPHA_EXIST);
	
	Wait_(15);
	
	efc_sancho0 = SetSelectBoneEffect_("ef804_03_tran_sancho", sancho_after, ATTACH_GLOBAL);		// �g�����X�t�H�[��
	
	// ���J�b�g12���ϐg��T���`���A�o�`�m�t�o�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");		// 210F
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 60);
	//-----
	
	WaitTask(task_cam);
	Wait_(10);
	DeleteTask_(task_cam);
	
	SetPointPos_(rena, "npc_rena001");
	SetAlpha_(rena, ALPHA_EXIST);
//	SetAlpha_(sancho_after, ALPHA_CLEAR);
	
	// ���J�b�g13�����i�[�e�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`

	task_cam = Task_AnimeMoveCamera_("anmeye007a", "anmtgt007a");				// 5F
	SetMotion_(rena, rena_attack_start, BLEND_M);
	task_rena = Task_ChangeMotion_(rena, rena_attack_start_L, BLEND_M);
	Wait_(20);
	efc_rena = SetSelectBoneEffect_("ef710_02_cha_heroi_atc01", rena, ATTACH_EFFECT3);
	PlaySE_("SE_DEM_142");
	WaitTask(task_cam);	
	
	//===============================================
	// ���Ȃ��̏���
	// �u�ז������Ȃ��ŁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_048_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");				// 5F
	SetFace_(rena, "Face_left");	
		
	SetMotion_(rena, rena_attack02, BLEND_M);
	task_rena = Task_ChangeMotion_(rena, rena_attack02_L, BLEND_M);
		
	DeleteEffectEmitter_(efc_rena);
	efc_rena = SetSelectBoneEffect_("ef710_03_cha_heroi_atc02", rena, ATTACH_GLOBAL);
	Wait_(16);
	SetFace_(rena, "Face_default");
	PlaySE_("SE_DEM_066");											// ��SE:���i�[�e�U��
	DeleteTask_(task_rena);
		
	// ���J�b�g14���Y�[���A�b�v�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`

	StartBlurEffect_();
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
	Wait_(45);
	
	SetAlpha_(sancho_after, ALPHA_EXIST);
	SetAlpha_(rena, ALPHA_CLEAR);
	DeleteTask_(task_cam);
//	DeleteTask_(task_rena);
	DeleteEffect_(efc_cam);
	EndBlurEffect_();	
	
	// ���J�b�g15���T���`������`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye014", "anmtgt014");				// 210F
	
	efc_sancho0 = SetBoneEffect_("ef804_04_death_sancho01", sancho_after);
	efc_sancho1 = SetBoneEffect_("ef804_05_death_sancho02", sancho_after);
	SetMotion_(sancho_after, MOT_DAMAGE, BLEND_N);
	WaitMotion(sancho_after);
	SetMotion_(sancho_after, sancho_explosion, BLEND_XL);
	Wait_(30);
	efc_sancho0 = SetSelectBoneEffectSetOffset_("ef723_01_nat_explosion_n01", sancho_after, ATTACH_EFFECT2, Vec3(0.0, 30.0, 0.0));
	SetEffectScale_(efc_sancho0, 0.3);	
	WaitMotion(sancho_after);
	SetMotion_(sancho_after, sancho_explosion_L, BLEND_M);
	
	//===============================================
	// ���T���`��
	// �u�M�M�c�c���C���V�X�e����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_048_MSG_110");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u���̋�Ԃ��@�ێ��c�c�ł��}�Z���B
	//-----------------------------------------------
	ShowMsg_("DEMO_048_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	SetAlpha_(player, ALPHA_EXIST);
	SetPointPos_(player, "player000");
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetAlpha_(rena, ALPHA_EXIST);
	SetAlpha_(sancho_after, ALPHA_CLEAR);
	DeleteEffect_(efc_sancho0);
	DeleteEffect_(efc_sancho1);
	
	// ���J�b�g16����l���Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetMotion_(player, player_caution01_L, BLEND_N);				// �x��
	SetPointCameraEye_("cameye010");
	SetPointCameraTarget_("camtgt010");
	Wait_(10);
	
	//===============================================
	// ���Ȃ��̏���
	// �u�܂��́@���Ȃ����c�c
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_048_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(rena, ALPHA_EXIST);
	SetMotion_(rena, MOT_WAIT, BLEND_N);

	
	// ���J�b�g17�����i�[�e�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetMotionSpeed_(rena, 1.0);	

	
	task_cam = Task_AnimeMoveCamera_("anmeye018", "anmtgt018");				// 8F
	Wait_(10);
	SetFace_(rena, "Face_loop_close");
	
	WaitTask(task_cam);

	//===============================================
	// ���Ȃ��̏���
	// �u���́@�܂ڂ낵�̐��E����@�������I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_048_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye019", "anmtgt019");				// 8F

	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
	PlaySE_("SE_DEM_026");													// ��SE:�W����

	SetFace_(rena, "Face_default");
	WaitTask(task_cam);
	Wait_(20);	
	DeleteTask_(task_cam);
	DeleteEffect_(efc_cam);
	SetAlpha_(rena, ALPHA_CLEAR);
	SetAlpha_(sancho_after, ALPHA_EXIST);
	
	// ���J�b�g18���T���`�������`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	StartBlurEffect_();
	task_cam = Task_AnimeMoveCamera_("anmeye015", "anmtgt015");				// 60F
	PlaySE_("SE_DEM_233");
	efc_sancho0 = SetSelectBoneEffectSetOffset_("ef804_05_death_sancho02", sancho_after, ATTACH_EFFECT2, Vec3(5.0, 12.0, 0.0));
	Wait_(10);	
	efc_sancho1 = SetSelectBoneEffectSetOffset_("ef804_05_death_sancho02", sancho_after, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));
	Wait_(10);	
	efc_sancho2 = SetSelectBoneEffectSetOffset_("ef804_05_death_sancho02", sancho_after, ATTACH_EFFECT2, Vec3(0.0, 10.0, 0.0));
	Wait_(30);	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
	SetMotion_(sancho_after, sancho_death, BLEND_M);
	efc_sancho0 = SetBoneEffect_("ef804_06_death_sancho03", sancho_after);
	Wait_(5);
	DeleteEffect_(efc_cam);
	Wait_(15);
	SetMotionSpeed_(sancho_after, 0.5);		
	EndDemo(FADE_COLOR_WHITE, 60);
	EndBlurEffect_();
}
