//=============================================
//
//		demo318[��]�̐���_1]
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
	local task_cam, task_player, task_aza, task_reactor;						// �^�X�N�֌W�̕ϐ�
	local efc_cam, efc_player, efc_aza01, efc_aza02;							// �G�t�F�N�g�֌W�̕ϐ�1
	local efc_reactor01, efc_reactor02, efc_attack, efc_smoke01, efc_smoke02;	// �G�t�F�N�g�֌W�̕ϐ�2

// ���t���O�ݒ�
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_016");						// Bit_216 ���[���ǉ��t���O

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();
	local model_azamuku = ReadNpc_("m204_00")								// ���ω��A�[�U���[�N
	// �M�~�b�N
	local model_reactor = ReadGimmick_("o_dem_15");							// �������A�N�^�[
	local model_tenmetu = ReadGimmick_("o_I02_16");							// ���䑕�u�̓_��
	local model_display = ReadGimmick_("o_I02_17");							// �f�B�X�v���C���
	local model_daiza = ReadGimmick_("o_I02_19");							// ���A�N�^�[���
	local model_ruler = ReadGimmick_("o_com_08");							// ���[���|�C���g
	//�G�t�F�N�g
	LoadEffect_("ef730_01_oth_dark_aura01");								// �܂��܂������I�[��
	LoadEffect_("ef732_09_light_reactor_c");								// ���A�N�^�[����
	LoadEffect_("ef733_01_sym_shuchusen01");								// �W����
	LoadEffect_("ef723_01_nat_explosion_n01");								// ����
	LoadEffect_("ef831_01_atc_yetas");										// �����U��
	LoadEffect_("ef721_04_nat_smoke_psps");									// ���Ղ��Ղ��i�d������j
	//���C�A�E�g
	LoadLayout_("black");

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	
	// �A�[�U���[�N
	local azamuku = ArrangePointNpc_(model_azamuku, "npc_azamuku000");
	SetScaleSilhouette(azamuku, SCALE.AZAMUKU, SILHOUETTE_WIDTH.S);
	
	// �f�B�X�v���C���
	local display = ArrangePointGimmick_("o_I02_17", model_display, "obj_display000");
	SetManualCalcAlpha_(display, true);
	SetAlpha_(display, ALPHA_CLEAR);
	
	// ���䑕�u�̓_��
	local tenmetu = ArrangePointGimmick_("o_I02_16", model_tenmetu, "obj_tenmetu000");
	
	// �������A�N�^�[
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");
	SetMotion_(reactor, MOT_GIMMICK_0, BLEND_N);
	
	// ���A�N�^�[���
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");
	SetMotion_(daiza, MOT_GIMMICK_0, BLEND_N);
	
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// �����[���|�C���g�����ɋN�����Ă����ꍇ
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }

// ����풓���[�V�����Ǎ�
	// ��l��
	local pl_walk02_L = ReadMotion_(player, "Player_walk02_L");				// �����ŕ���
	local pl_caution01_L = ReadMotion_(player, "Player_caution01_L");		// �x��L
	local pl_battle_run = ReadMotion_(player, "Player_run_battle");			// ���遨�퓬�ҋ@
	local pl_battle_L = ReadMotion_(player, "Player_battle_L");				// �퓬�ҋ@
	
	// �A�[�U���[�N
	local aza_appearance = ReadMotion_(azamuku, "m204_00_appearance");		// �o��
	local aza_bow = ReadMotion_(azamuku, "m204_00_bow");					// �����������A�N�^�[�����o��
	local aza_talk_L = ReadMotion_(azamuku, "m204_00_talk_L");				// ��b�i��jL
	local aza_take_L = ReadMotion_(azamuku, "m204_00_take_reactor_L");		// ���A�N�^�[�����o��L
	local aza_fly = ReadMotion_(azamuku, "m204_00_fly");					// �ҋ@���H���L���Ĕ��
	local aza_hold_L = ReadMotion_(azamuku, "m204_00_hold_reactor_L");		// ���A�N�^�[������L
	local aza_turn_L = ReadMotion_(azamuku, "m204_00_turn_L");				// ��������L
	local aza_g_wait = ReadMotion_(azamuku, "m204_00_g_wait_L");			// �n��ҋ@L
	local aza_arm_L= ReadMotion_(azamuku, "m204_00_arm_folde_L");			// �r�g�݂��ȂÂ�L
	local aza_hurry = ReadMotion_(azamuku, "m204_00_hurry");				// �r�g�݁��ł�
	local aza_hurry_L = ReadMotion_(azamuku, "m204_00_hurry_L");			// �ł�L
	local aza_angry_L = ReadMotion_(azamuku, "m204_00_anger_L");			// �{��L
	local aza_strike = ReadMotion_(azamuku, "m204_00_strike_L");			// ���u��������L
	local aza_ret = ReadMotion_(azamuku, "m204_00_retreat");				// �ジ����
	local aza_ret_L = ReadMotion_(azamuku, "m204_00_retreat_L");			// �ジ����L
	local aza_ret_fly = ReadMotion_(azamuku, "m204_00_retreat_fly");		// �ジ���遨���֏オ��
	local aza_spr_hand = ReadMotion_(azamuku, "m204_00_spread_hand");		// �ҋ@��������L����
	local aza_spr_hand_L = ReadMotion_(azamuku, "m204_00_spread_hand_L");	// ������L����L
	local aza_typing = ReadMotion_(azamuku, "m204_00_typing_L");			// �^�C�s���OL
	
// ���������[�V����
	SetMotion_(azamuku, aza_g_wait, BLEND_N)								// �A�U�@�n��ҋ@
	SetMotion_(player, MOT_RUN, BLEND_N)									// ��l������
	task_player = Task_MoveForward_(player, 1.0, true);						// ��l������

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	//��������������������������������������
	//���J�b�g�P�@��l�������ɓ���
	//��������������������������������������
	
	StartDemo(FADE_COLOR_BLACK);											// �t�F�[�h�C��
	Wait_(15);
	
	DeleteTask_(task_player);
	SetMotion_(player, pl_caution01_L, BLEND_L)								// ��@�x��
	
	Wait_(60);
	
	//��������������������������������������
	//���J�b�g2�@�؂̕c�˃A�[�U���[�N���f��
	//��������������������������������������
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	WaitTask(task_cam);
	Wait_(60);
	
	//��������������������������������������
	//���J�b�g3�@�A�[�U���[�N�A�b�v
	//��������������������������������������
	DeleteTask_(task_cam);
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	Wait_(30);
	SetMotion_(azamuku, aza_turn_L, BLEND_XL)												// �A�U�@��������
	task_aza = Task_RotateToPos_(azamuku, GetPos_(player), 3.0);
	Wait_(25);
	DeleteTask_(task_aza);
	
	Wait_(30);
	//===============================================
	//���A�[�U���[�N
	//�u�z�[�b�z�b�z�b�z�b�I
	//�@�x�������ł��˂��B�܂��Ȃ��@��]�͉䂪��ɁI
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_318_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//���A�[�U���[�N
	//�u���W�X�^���X�̍ŏI���킾�Ƃ����@��]�c�c
	//�@���̂��肩�@�q�܂��Ă��������f�X�I
	//-----------------------------------------------
	ShowMsg_("DEMO_318_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(azamuku, aza_g_wait, BLEND_XL)												// �A�U�@�n��ҋ@
	task_aza = Task_RotateToDir_(azamuku, 90, 3.0);
	Wait_(50);
	DeleteTask_(task_aza);
	
	//��������������������������������������
	//���J�b�g4�@���j�^�N��
	//��������������������������������������
	SetVisible(azamuku, false);																// �A�U��\��

	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	Wait_(10);
	PlaySE_("SE_FLD_135");																	// ������
	efc_reactor01 = SetPointWorldEffect_("ef732_09_light_reactor_c", "obj_reactor000");		//�����A�N�^�[�N���G�t�F�N�g
	SetEffectScale_(efc_reactor01, 0.5);
	Wait_(10);
	SetMotion_(daiza, MOT_GIMMICK_1, BLEND_XL);												// ����N���O�ҋ@�Ɉڍs
	Wait_(20);	
	SetMotion_(daiza, MOT_GIMMICK_2, BLEND_XL);												// ����N��
	Wait_(30);
	
	Task_ObjectFadeIn_(display, 30);
	PlaySE_("SE_DEM_055"); //�f�B�X�v���C�_��
	
	Wait_(90);
	
	//��������������������������������������
	//���J�b�g5�@���j�^PANUP
	//��������������������������������������
	SetLayoutAnime_("fade_in", false);											// ��������
	Wait_(30);
	SetLayoutAnime_("loop", false);												// ��������
	
	//===============================================
	//*�������u
	//�c�c�S���߁B
	//�V�����������́@�����ɉғ����Ă���B
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_030", false);
	//===============================================
	
	//===============================================
	//*�������u
	//�͂̓d�����@���p�����̂́@�����������B
	//����Ł@��]�̊J���ɂ��@�͂��݂����͂����B
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_040", false);
	//===============================================

	WaitTask(task_cam);
	
	//��������������������������������������
	//���J�b�g6�@�A�U���N����l��
	//��������������������������������������
	SetVisible(azamuku, true);												// �A�U�\��
	SetPointPos_(player , "player001");
	SetMotion_(player, MOT_RUN, BLEND_N)									// ��l������
	task_player = Task_MoveForward_(player, 1.0, true);						// ��l������
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	Wait_(40);
	
	SetMotion_(player, pl_battle_run, BLEND_M)								// ��@�퓬�ҋ@
	Wait_(15);
	DeleteTask_(task_player);
	SetMotion_(player, pl_caution01_L, BLEND_L)								// ��@�x��
	
	//===============================================
	//*�������u
	//�c�c�X�T���߁B
	//�V�����c�́@�J���ɐ����B
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_050", false);
	//===============================================
	
	//===============================================
	//*�������u
	//���̕c���@��]�ւ̑����Ɓ@�Ȃ�͂��B
	//���܂��@����Ăق����Ǝv���B
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_060", false);

	SetLayoutAnime_("fade_out", false);											// ��������
	//===============================================

	WaitTask(task_cam);
	Wait_(20);
	
	//��������������������������������������
	//���J�b�g7�@�A�[�U���[�N�@�r�g��
	//��������������������������������������
	
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	SetMotion_(azamuku, aza_arm_L, BLEND_XL)									// �A�U�@�r�g��
	
	//===============================================
	//���A�[�U���[�N
	//�u�Ȃ�قǁ@�c�f�X���c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_318_MSG_070");
	KeyInputWait_();
	//===============================================
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);					// �W����
	SetMotionSpeed_(azamuku, 3);											// ���[�V�����������Ȃ�
	SetMotion_(azamuku, aza_hurry, BLEND_L)									//�A�U�@�ł�i���u�ɒ݂͂�����j
	
	//===============================================
	//���A�[�U���[�N
	//�u�c�c���ā@�Ȃ��c���o�Ă���̃f�X�I�H
	//�@�ŏI����Ɓ@�ǂ�Ȋ֌W�����H
	//-----------------------------------------------
	ShowMsg_("DEMO_318_MSG_080");

	WaitMotion(azamuku); 
	SetMotion_(azamuku, aza_hurry_L, BLEND_L)								// �A�U�@�ł�L
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffectEmitter_(efc_cam);
	
	SetMotionSpeed_(azamuku, 1);												// ���[�V�����@���ɖ߂�
	SetMotion_(azamuku, aza_angry_L, BLEND_XL)									// �A�U�@�{��ӂ邦��
	
	//��������������������������������������
	//���J�b�g8�@�A�[�U���[�N�@�Y�[���A�b�v
	//��������������������������������������	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	//===============================================
	//*�������u
	//�c�c�P�S�S���߁B
	//�ϊ��A���̕c�́@�����ɐ��璆�B
	//-----------------------------------------------
	SetLayoutAnime_("fade_in", false);											// ��������
	Wait_(30);
	SetLayoutAnime_("loop", false);												// ��������

	ShowScreenMessage_("DEMO_318_MSG_090", false);
	//==============================================

	//===============================================
	//*�������u
	//���̂܂܂����΁@�g�[�h�[��@�V���o�[��
	//�F��Ɂ@�񂢂邱�Ƃ��@�ł���͂����B
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_100", false);
	//===============================================
	
	//===============================================
	//*�������u
	//�c�c�P�U�U���߁B
	//�����������u�Ɂ@���C���@�������������B
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_110", false);
	//===============================================
	WaitTask(task_cam);

	//��������������������������������������
	//���J�b�g9�@�c�Y�[���C��
	//��������������������������������������
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	
	//===============================================
	//*�������u
	//�g�[�h�[�����ɂ́@������@��]��
	//���E���@�ς���Ɓ@�����Ă������B
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_120", false);

	
	//===============================================
	//*�������u
	//���΂��@�ς��Ăق����B���̕X����
	//�ΖL���ȓy�n�ɕς��@���̓����@����܂ŁB
	//-----------------------------------------------	
	ShowScreenMessage_("DEMO_318_MSG_130", false);

	WaitTask(task_cam);
	
	SetLayoutAnime_("fade_out", false);											// ��������
	//===============================================
	Wait_(20);
	
	//��������������������������������������
	//���J�b�g10�@�A�[�U���[�N�u���ׂ�v
	//��������������������������������������
	SetPointPos_(azamuku , "npc_azamuku002");
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");
	
	//===============================================
	//���A�[�U���[�N
	//�u�z�[�b�z�b�z�c�c�z�H
	//�@�ϊ��A���c�c�H�@�ΖL���ȓy�n�c�c�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_318_MSG_140");
	KeyInputWait_();
	//===============================================
	PlayLoopSE_("SE_DEM_121");
	SetMotion_(azamuku, aza_typing, BLEND_L)									// �A�U�@�^�C�s���O
	
	//===============================================
	//���A�[�U���[�N
	//�u�o�J�Ȃ��I�@����Ł@�I���̂͂����Ȃ��f�X�I
	//�@�����ɂ́@���W�X�^���X�̊�]���c�c
	//-----------------------------------------------
	ShowMsg_("DEMO_318_MSG_150");	
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//���A�[�U���[�N
	//�u���W�X�^���X�̍�����@�ŏI���킪
	//�@�B����Ă���͂��Ȃ�f�X�I
	//-----------------------------------------------
	ShowMsg_("DEMO_318_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(40);

	//��������������������������������������
	//���J�b�g11�@�A�U	�A�b�v
	//��������������������������������������
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);						// �W����
	//===============================================
	//���A�[�U���[�N
	//�u�����Ɓ@�悭���ׂȂ����I
	//�@�ŏI������@��΂Ɂ@������̃f�F�F�X�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_318_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffectEmitter_(efc_cam);
	StopLoopSE_(5);
	//��������������������������������������
	//���J�b�g12�@���u�@�Y�[���A�b�v
	//��������������������������������������
	SetVisible(azamuku, false);
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");
	
	StopBgm_(90);
	//===============================================
	//*�������u
	//�������ʂ́@�P���@�ł��B
	//���e���@��ʂɕ\���������܂��B
	//-----------------------------------------------
	SetLayoutAnime_("fade_in", false);											// ��������
	Wait_(30);
	SetLayoutAnime_("loop", false);												// ��������
	ShowScreenMessage_("DEMO_318_MSG_180", false);

	//===============================================
	WaitTask(task_cam);
	SetVisible(azamuku, true);
	
	//��������������������������������������
	//���J�b�g13�@�A�[�U���[�N�@�Y�[���A�E�g
	//��������������������������������������
	SetPointPos_(azamuku , "npc_azamuku002");
	SetMotion_(azamuku, aza_g_wait, BLEND_N)								// �A�U�@�n��ҋ@

	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");
	WaitTask(task_cam);
	//===============================================
	//*�������u
	// �����Ɂ@���O�̋��߂Ă�����̂́@�Ȃ��B
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_190", false);
	
	Wait_(30);	
	//===============================================

	
	//��������������������������������������
	//���J�b�g14�@��l���A�b�v
	//��������������������������������������
	SetPointPos_(azamuku , "npc_azamuku000");
	SetPointPos_(player , "player002");
	SetMotion_(player, pl_battle_L, BLEND_N)								// ��@�퓬�ҋ@
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");
	WaitTask(task_cam);
	//===============================================
	//*�������u
	//��]�́@���łɗ����オ�����B
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_200", false);
	SetLayoutAnime_("fade_out", false);											// ��������

	//===============================================
	Wait_(40);
	
	//��������������������������������������
	//���J�b�g15�@�@�B��j�󂷂�A�U���N
	//��������������������������������������
	SetMotion_(azamuku, aza_angry_L, BLEND_N)									// �A�U�@�{��ӂ邦��

	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");
	//===============================================
	//���A�[�U���[�N
	//�u�Ȃ�c�c���Ɓc�c�I
	//�@���^�N�V���@�x�炳�ꂽ�Ƃ����̃f�X���I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");	
	ShowMsg_("DEMO_318_MSG_210");
	KeyInputWait_();
	//===============================================
	
//	PlaySE_("SE_SKL_018");					// ���y���v�]��SE���J�b�g
	PlayBgm_("BGM_007");					//�����BGM����������X�^�[�g
	efc_aza01 = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", azamuku, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));		// ���I�[��	
	
	//===============================================
	//���A�[�U���[�N
	//�u����Ă���܂����˂��@���L������I
	//�@���̂��I�@���̂��̂��̂��I�I
	//-----------------------------------------------
	ShowMsg_("DEMO_318_MSG_220");
	KeyInputWait_();
	CloseMsgWnd_();

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");

	SetMotion_(azamuku, aza_strike, BLEND_L)														// �A�U�@���u��������
	PlaySE_("SE_DEM_122");
	Wait_(10);
	efc_aza02 = SetSelectBoneEffectSetOffset_("ef831_01_atc_yetas", azamuku, ATTACH_EFFECT1, Vec3(0.0, -10.0, 15.0));				// �����U��ef
	SetEffectScale_(efc_aza02, 0.4);
	Wait_(25);
	
	efc_attack = SetPointWorldEffect_("ef723_01_nat_explosion_n01", "efc_attack000");
	SetEffectScale_(efc_attack, 0.8);
	StartEarthQuake_(6, 3, 1.5)
	
	efc_aza02 = SetSelectBoneEffectSetOffset_("ef831_01_atc_yetas", azamuku, ATTACH_EFFECT1, Vec3(0.0, -10.0, 15.0));				// �����U��ef
	SetEffectScale_(efc_aza02, 0.4);
	Wait_(25);
	
	efc_smoke01 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke001");					// ��
	SetEffectScale_(efc_smoke01, 2.0);
	
	efc_attack = SetPointWorldEffect_("ef723_01_nat_explosion_n01", "efc_attack001");
	SetEffectScale_(efc_attack, 0.5);
	StartEarthQuake_(6, 3, 1.2)
	
	efc_aza02 = SetSelectBoneEffectSetOffset_("ef831_01_atc_yetas", azamuku, ATTACH_EFFECT1, Vec3(0.0, -10.0, 15.0));				// �����U��ef
	SetEffectScale_(efc_aza02, 0.4);
	Wait_(25);
	
	efc_attack = SetPointWorldEffect_("ef723_01_nat_explosion_n01", "efc_attack000");
	SetEffectScale_(efc_attack, 0.7);
	StartEarthQuake_(6, 3, 1.4)
	
	efc_aza02 = SetSelectBoneEffectSetOffset_("ef831_01_atc_yetas", azamuku, ATTACH_EFFECT1, Vec3(0.0, -10.0, 15.0));				// �����U��ef
	SetEffectScale_(efc_aza02, 0.4);
	Wait_(25);
	
	efc_smoke01 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");					// ��
	SetEffectScale_(efc_smoke01, 2.3);
	
	efc_attack = SetPointWorldEffect_("ef723_01_nat_explosion_n01", "efc_attack000");
	SetEffectScale_(efc_attack, 1.2);
	StartEarthQuake_(6, 3, 2)
	
	efc_aza02 = SetSelectBoneEffectSetOffset_("ef831_01_atc_yetas", azamuku, ATTACH_EFFECT1, Vec3(0.0, -10.0, 15.0));				// �����U��ef
	SetEffectScale_(efc_aza02, 0.4);
	Wait_(20);
	
	EndDemoBgmFade_(25);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 25);
	
	Wait_(5);
	
	efc_attack = SetPointWorldEffect_("ef723_01_nat_explosion_n01", "efc_attack000");
	SetEffectScale_(efc_attack, 1.2);
	StartEarthQuake_(6, 3, 2)
	
	Wait_(20);
	DeleteAllTask_();
	SetSepiaColor_(false);
	End_();

}
