//=============================================
//
//		demo420[�C�b�^�u���폟��]
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
	local task_cam, task_player, task_dark, task_rukiya00, task_rukiya01;
	local task_toge00, task_toge01, task_toge02, task_togeSE00, task_togeSE01, task_togeSE02;
	local efc_player, efc_ittaburu, efc_rukiya, efc_cam00, efc_cam01;
	local efc_foce, efc_smoke00, efc_smoke01, efc_smoke02, efc_smoke03, efc_explosion;
	
// ���t���O�ݒ�
	local bit_ruler2 = GetEventFlg_("BFG_RULER_ADD_019");			// Bit_219  ���[���ǉ��t���O ���S�̊č����@���͋�
	
// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local model_rukiya = ReadNpc_("n009");					// ���L��
	local model_ittaburu = ReadNpc_("m205_00");				// �C�b�^�u��
	local model_dark = ReadNpc_("n008");					// �_�[�N�}�X�^�[
	local model_toge = ReadNpc_("m195_00");					// ���g�Q�W���{�[
	// �M�~�b�N
	local model_control = ReadGimmick_("o_S02_09");			// ���䑕�u�i�ʏ�j
	local model_reactor = ReadGimmick_("o_dem_23");			// ���L���̃��A�N�^�[
	local model_bomb = ReadGimmick_("o_dem_17");			// ���e
	local model_bombswitch = ReadGimmick_("o_dem_18");		// �N�����u�X�C�b�`
	local model_ruler = ReadGimmick_("o_com_08");			// ���[���|�C���g
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");					// �u�I�v
	LoadEffect_("ef721_03_nat_smoke_n03");					// �C�b�^�u���̉�
	LoadEffect_("ef733_01_sym_shuchusen01");				// �W����
	LoadEffect_("ef842_04_dark_foce");						// �_�[�N�}�X�^�[�̎肩��o���
	LoadEffect_("ef721_05_nat_smoke_s01");					// �ėp���@������������
	LoadEffect_("ef721_04_nat_smoke_psps");					// ���Ղ��Ղ��i�d������j
	LoadEffect_("ef842_02_light_alert");					// �Ԃ������v
	LoadEffect_("ef842_03_explosion_brkmcn01");				// �u���C�N�����u�̔���

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// ���L��
	local rukiya = ArrangePointNpc_(model_rukiya, "npc_rukiya000");
	SetPointPosNoFit_(rukiya, "npc_rukiya000");
	SetFace_(rukiya, "bom_default");
	SetMeshVisible_(rukiya, "Model_3", false);
	// �C�b�^�u��
	local ittaburu = ArrangePointNpc_(model_ittaburu, "npc_ittaburu000");
	SetScale_(ittaburu, SCALE.M);
	// �_�[�N�}�X�^�[
	local dark = ArrangePointNpc_(model_dark, "npc_dark000");
	SetVisible(dark, false);
	SetStepSe_(dark, "SE_FLD_021");
	// ���g�Q�W���{�[�P�Q�R
	local toge00 = ArrangePointNpc_(model_toge, "npc_toge000");
	local toge01 = ArrangePointNpc_(model_toge, "npc_toge100");
	local toge02 = ArrangePointNpc_(model_toge, "npc_toge200");
	SetVisible(toge00, false);
	SetVisible(toge01, false);
	SetVisible(toge02, false);
	// ���䑕�u�i�ʏ�j
	local control = ArrangePointGimmick_("o_S02_09", model_control, "obj_control000");
	// ���L���̃��A�N�^�[
	local reactor = ArrangePointGimmick_("o_dem_07", model_reactor, "npc_rukiya000");
	SetMotion_(reactor, MOT_GIMMICK_0, BLEND_N);
	SetAlpha_(reactor, ALPHA_CLEAR);
	// ���e
	local bomb = ArrangePointGimmick_("o_dem_17", model_bomb, "obj_control000");
	SetMotion_(bomb, MOT_GIMMICK_0, BLEND_N);
	// �N�����u�X�C�b�`
	local bombswitch = ArrangePointGimmick_("o_dem_18", model_bombswitch, "npc_rukiya000");
	SetAlpha_(bombswitch, ALPHA_CLEAR);
	SetScale_(bombswitch, 1.2);
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// �����[���|�C���g�����ɋN�����Ă����ꍇ
	if (bit_ruler2) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
// ����풓���[�V�����Ǎ�
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// ��l���@�퓬�ҋ@
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		// ��l���@�������ҋ@L
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");		// ��l���@�x��L
	local player_back_L = ReadMotion_(player, "Player_back_L");					// ��l���@�ジ����
	local player_get_reactor = ReadMotion_(player, "Player_get_reactor");		// ��l���@���A�N�^�[�󂯎�遨�ҋ@
	local player_caution01_up_L = ReadMotion_(player, "Player_caution01_up_L");	// ��l���@�x���i���L��������jL
	local player_vix = ReadMotion_(player, "Player_vix");						// ��l���@����������
	local player_reactor_stand = ReadMotion_(player, "Player_reactor_stand");	// ��l���@���A�N�^�[�t�ҋ@
	local player_reactor_run = ReadMotion_(player, "Player_reactor_run");		// ��l���@���A�N�^�[�t����
	local player_reactor_caution01_L = ReadMotion_(player, "Player_reactor_caution01_L");	// ��l���@���A�N�^�[�t�x��
	local player_reactor_caution_turn_L = ReadMotion_(player, "Player_reactor_caution_turn_L");// ��l���@���A�N�^�[�t�x���i�U������j

	local rukiya_bomb_L = ReadMotion_(rukiya, "n009_bomb_L");					// ���L���@�N�����u�����ҋ@L
	local rukiya_bomb = ReadMotion_(rukiya, "n009_bomb");						// ���L���@�N�����u�X�C�b�`����
	local rukiya_look_right_L = ReadMotion_(rukiya, "n009_look_right_L");		// ���L���@�E�����ҋ@L
	local rukiya_look_left_L = ReadMotion_(rukiya, "n009_look_left_L");			// ���L���@�������ҋ@L
	local rukiya_pass_reactor = ReadMotion_(rukiya, "n009_pass_reactor");		// ���L���@���A�N�^�[���O���������o��
	local rukiya_pass_reactor_L = ReadMotion_(rukiya, "n009_pass_reactor_L");	// ���L���@���A�N�^�[�������o��L
	local rukiya_blast_on = ReadMotion_(rukiya, "n009_blast_on");				// ���L���@�֎q�X�C�b�`�I��
	local rukiya_blast_L = ReadMotion_(rukiya, "n009_blast_L");					// ���L���@�֎q�X�C�b�`�I��L
	local rukiya_look_down_L = ReadMotion_(rukiya, "n009_look_down_L");			// ���L���@�������ҋ@L
	local rukiya_look_up_L = ReadMotion_(rukiya, "n009_look_up_L");				// ���L���@������ҋ@L

	local ittaburu_one_knee = ReadMotion_(ittaburu, "m205_00_one_knee");		// �C�b�^�u���@�ҋ@���G����
	local ittaburu_one_knee_L = ReadMotion_(ittaburu, "m205_00_one_knee_L");	// �C�b�^�u���@�G����L

	local dark_summon = ReadMotion_(dark, "n008_summon");						// �_�[�N�}�X�^�[�@�ҋ@�������X�^�[����
	local dark_summon_L = ReadMotion_(dark, "n008_summon_L");					// �_�[�N�}�X�^�[�@�����X�^�[����L
	local dark_laugh_L = ReadMotion_(dark, "n008_laugh_L");						// �_�[�N�}�X�^�[�@�΂�L
	local dark_surprise_L = ReadMotion_(dark, "n008_surprise_L");				// �_�[�N�}�X�^�[�@����L

	local toge_after_break00 = ReadMotion_(toge00, "m195_00_after_break");		// ���g�Q�W���{�[�P�@�g�Q�t���ҋ@
	local toge_break_walk00 = ReadMotion_(toge00, "m195_00_break_walk");		// ���g�Q�W���{�[�P�@�g�Q�t������
	local toge_after_break01 = ReadMotion_(toge01, "m195_00_after_break");		// ���g�Q�W���{�[�Q�@�g�Q�t���ҋ@
	local toge_break_walk01 = ReadMotion_(toge01, "m195_00_break_walk");		// ���g�Q�W���{�[�Q�@�g�Q�t������
	local toge_after_break02 = ReadMotion_(toge02, "m195_00_after_break");		// ���g�Q�W���{�[�R�@�g�Q�t���ҋ@
	local toge_break_walk02 = ReadMotion_(toge02, "m195_00_break_walk");		// ���g�Q�W���{�[�R�@�g�Q�t������


	//��������������������������������������
	//���J�b�g1�@�C�b�^�u���@�G����
	//��������������������������������������

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	SetMotion_(player, player_battle_L, BLEND_N);			// ��l���@�퓬�ҋ@
	PlaySE_("SE_DEM_092");
	SetMotion_(ittaburu, ittaburu_one_knee, BLEND_XL);		// �C�b�^�u���@�ҋ@���G����


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	WaitMotion(ittaburu);
	SetMotion_(ittaburu, ittaburu_one_knee_L, BLEND_XL);	// �C�b�^�u���@�G����L
	efc_ittaburu = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "npc_ittaburu000");// ����
	SetEffectScale_(efc_ittaburu, 1.5);
	StartEarthQuake_(9, 3, 2);
	Wait_(22);
	DeleteTask_(task_cam);

	//===============================================
	// ���C�b�^�u��
	// �u����قǂƂ́c�c�I
	// �@���̃C�b�^�u���@�ꐶ�̕s�o�ł���c�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_420_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	task_dark = Task_AnimeMove_(dark, "anm_dark000");
	Wait_(5);


	//��������������������������������������
	//���J�b�g2�@�_�[�N�}�X�^�[�@�o��@�J�������������w��
	//��������������������������������������

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	PlayBgm_("BGM_008");
	SetMotionSpeed_(player, 0.9);
	SetScale_(ittaburu, 0.6);// �J�����Ɏ��܂�Ȃ��̂ňꎞ�I�ɏk��
	SetPointPosNoFit_(ittaburu, "npc_ittaburu001");
	SetPointPos_(rukiya, "npc_rukiya001");
	SetVisible(dark, true);
	DeleteEffect_(efc_ittaburu);
	SetPos_(player, Vec3(-8.8, 5.0, 141.13576));
	SetDir_(player, 16);
	SetMotion_(dark, MOT_WALK, BLEND_L);					// �_�[�N�}�X�^�[�@����
	Wait_(84);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g3�@�_�[�N�}�X�^�[�@�������ҋ@
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetPos_(player, Vec3(-4.8, 5.0, 141.13576));
	Wait_(52);
	SetMotion_(dark, MOT_WAIT, 26);							// �_�[�N�}�X�^�[�@�ҋ@
	SetMotionSpeed_(dark, 1.0);
	WaitTask(task_dark);
	DeleteTask_(task_dark);
	task_dark = Task_RotateToDir_(dark, 215, 3.0);
	Wait_(15);
	DeleteTask_(task_dark);

	//===============================================
	// *�_�[�N�}�X�^�[
	// �u���������B������@�C�b�^�u���B
	// �@���납�҂��c�c�䂪����@�킸��킹�����āB
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_420_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	// ���L���@�u�I�v
	efc_rukiya = SetPointWorldEffect_("ef712_10_emo_surprise01", "efc_surprise000");// �u�I�v
	SetEffectScale_(efc_rukiya, 2.4);
	PlaySE_("SE_DEM_053");									// �u�I�v��
	Wait_(30);


	//��������������������������������������
	//���J�b�g4�@���L���@�����@�Y�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetVisible(player, false);
	SetMotion_(player, MOT_WAIT, BLEND_N);					// ��l���@�ҋ@
	SetMotionSpeed_(player, 1.0);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam00 = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// �W����
	Wait_(7);
	DeleteEffectEmitter_(efc_cam00);
	

	//===============================================
	// �����L��
	// �u���O�́c�c�_�[�N�}�X�^�[�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_030");
	SetFace_(rukiya, "Face_anger");
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);


	//��������������������������������������
	//���J�b�g5�@�C�b�^�u���@�G���@�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetVisible(dark, false);
	SetScale_(ittaburu, SCALE.M);//�T�C�Y�߂�
	Wait_(10);

	//===============================================
	// ���C�b�^�u��
	// �u�_�c�c�_�[�N�}�X�^�[���܂��I
	// �@�ʖڎ�����@�������܂��ʁc�c�̂ł���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_420_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);


	//��������������������������������������
	//���J�b�g6�@�_�[�N�}�X�^�[�@��b�@�������o�X�g�A�b�v���Y�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetVisible(dark, true);
	SetVisible(ittaburu, false);
	SetDir_(dark, 185);
	Wait_(135);

	//===============================================
	// ���_�[�N�}�X�^�[
	// �u���L���Ɂ@�A���Z�X�c�c���̉������u��
	// �@�ڂ��������Ɓ@�܂��́@�ق߂Ă������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_420_MSG_050");
	KeyInputWait_();
	//===============================================

	//===============================================
	// ���_�[�N�}�X�^�[
	// �u�����@���̑��u�́@�}�U�[�̉��l����
	// �@�u���C�N�����X�^�[���@���o���v���B
	//-----------------------------------------------
	ShowMsg_("DEMO_420_MSG_060");
	KeyInputWait_();
	//===============================================

	//===============================================
	// ���_�[�N�}�X�^�[
	// �u���̐��E���@�}�U�[�̖��̂��ƂɁ@�܂Ƃ߂���
	// �@�ЂƂɂ���c�c���̎ז��́@�����񂼁I
	//-----------------------------------------------
	ShowMsg_("DEMO_420_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_cam);
	Wait_(10);
	SetFace_(rukiya, "Face_eyes_close");

	//��������������������������������������
	//���J�b�g7�@���L���@�N�����u�X�C�b�`�����������@�o�X�g�A�b�v(���J�����A�E�g)
	//��������������������������������������

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetDir_(rukiya, 10);
	SetMotion_(rukiya, rukiya_bomb_L, BLEND_N);				// ���L���@�N�����u�����ҋ@L
	SetAlpha_(bombswitch, ALPHA_EXIST);
	AttachObject_(rukiya, bombswitch, ATTACH_EFFECT2);

	//===============================================
	// �����L��
	// �u�x����@�_�[�N�}�X�^�[�I
	// �@���̃X�C�b�`�����@�����΁c�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rukiya, rukiya_bomb, BLEND_XL);				// ���L���@�N�����u�X�C�b�`����
	Wait_(24);												// �X�C�b�`������SE�^�C�~���O����
	PlaySE_("SE_DEM_029");									// �|�`���Ƃ�
	Wait_(6);


	//��������������������������������������
	//���J�b�g8�@�N�����u�@�`�J�`�J
	//��������������������������������������

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	DetachObject_(rukiya);
	Wait_(5);
	PlaySE_("SE_DEM_070");
	SetMotion_(bomb, MOT_GIMMICK_1, BLEND_N);				// ���e�@�_��
	Wait_(45);


	//��������������������������������������
	//���J�b�g9�@�_�[�N�}�X�^�[�@�ҋ@�������@�o�X�g�A�b�v���΂ߑO��
	//��������������������������������������

	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	//===============================================
	// ���_�[�N�}�X�^�[
	// �u�ӂ�c�c�o�J�߁B
	// �@����ȁ@�P���Ȕ��e�Ȃǁc�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_420_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(dark, dark_summon, BLEND_L);					// �_�[�N�}�X�^�[�@�ҋ@�������X�^�[����
	SetMotionSpeed_(dark, 1.33);
	Wait_(40);
	PlaySE_("SE_DEM_071");
	SetMotion_(dark, dark_summon_L, BLEND_L);				// �_�[�N�}�X�^�[�@�����X�^�[����L
	SetMotionSpeed_(dark, 1.00);
	efc_foce = SetPointWorldEffect_("ef842_04_dark_foce", "efc_foce000");// �_�[�N�}�X�^�[�̎肩��o���
	SetEffectScale_(efc_foce, 0.7);

	Wait_(30);
	DeleteEffect_(efc_foce);


	//��������������������������������������
	//���J�b�g10�@�N�����u�@�Ղ���
	//��������������������������������������

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	Wait_(15);
	PlaySE_("SE_DEM_072");
	efc_smoke00 = SetPointWorldEffect_("ef721_05_nat_smoke_s01", "efc_smoke000");// �ėp���@������������
	efc_smoke01 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke001");// ���Ղ��Ղ��i�d������j
	SetMotion_(bomb, MOT_GIMMICK_0, BLEND_N);				// ���e�@��~
	Wait_(45);
	SetFace_(rukiya, "Face_default");


	//��������������������������������������
	//���J�b�g11�@��l���ƃ��L���ƋN�����u�@�N�����u�֐U�������l�@�E�΂ߑO��
	//��������������������������������������

	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	DeleteEffect_(efc_smoke00);
	DeleteEffect_(efc_smoke01);
	efc_smoke02 = SetPointWorldEffect_("ef721_05_nat_smoke_s01", "efc_smoke002");// �ėp���@������������
	efc_smoke03 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke003");// ���Ղ��Ղ��i�d������j
	SetEffectScale_(efc_smoke02, 3.0);
	SetEffectScale_(efc_smoke03, 3.0);
	SetVisible(player, true);
	SetPointPos_(player, "player001");
	SetPointPos_(rukiya, "npc_rukiya002");
	SetMotion_(player, player_look_left_L, BLEND_L);		// ��l���@�������ҋ@L
	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ���L���@�ҋ@
	SetMotion_(rukiya, rukiya_look_right_L, BLEND_L);		// ���L���@�E�����ҋ@L
	Wait_(8);
	efc_player = SurpriseDispSetOffset(player, Vec3(1.0, 1.5, 0.0), 0.9);
	Wait_(60);


	//��������������������������������������
	//���J�b�g12�@�_�[�N�}�X�^�[���S���@�_�[�N�}�X�^�[�������������@�o�X�g�A�b�v���Y�[���A�E�g
	//��������������������������������������

	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");

	SetVisible(ittaburu, true);
	SetPointPos_(ittaburu, "npc_ittaburu002");
	SetPointPos_(player, "player002");
	SetPointPos_(rukiya, "npc_rukiya003");
	SetDir_(ittaburu, 165);
	SetMotion_(dark, dark_laugh_L, BLEND_N);				// �_�[�N�}�X�^�[�@�΂�L
	SetMotion_(player, player_caution01_L, BLEND_N);		// ��l���@�x��L
	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ���L���@�ҋ@
	DeleteEffect_(efc_smoke02);
	DeleteEffect_(efc_smoke03);

	//===============================================
	// ���_�[�N�}�X�^�[
	// �u�N�b�N�b�N�c�c�c�O�������ȁ@���L���B
	// �@�V�т́@�����܂����c�c�ϔO���邪�����I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_420_MSG_100");
	Wait_(45);
	SetMotion_(dark, MOT_WAIT, 16);							// �_�[�N�}�X�^�[�@�ҋ@
	Wait_(16);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	SetMotion_(dark, dark_summon, BLEND_L);					// �_�[�N�}�X�^�[�@�ҋ@�������X�^�[����
	PlaySE_("SE_DEM_073");
	Wait_(60);
	DeleteTask_(task_cam);
	SetMotion_(dark, dark_summon_L, BLEND_L);				// �_�[�N�}�X�^�[�@�����X�^�[����L
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 25);
	Wait_(30);
	SetVisible(toge00, true);
	SetVisible(toge01, true);
	SetVisible(toge02, true);
	SetMotion_(toge00, toge_after_break00, BLEND_N);		// ���g�Q�W���{�[�P�@�g�Q�t���ҋ@
	SetMotion_(toge01, toge_after_break01, BLEND_N);		// ���g�Q�W���{�[�Q�@�g�Q�t���ҋ@
	SetMotion_(toge02, toge_after_break02, BLEND_N);		// ���g�Q�W���{�[�R�@�g�Q�t���ҋ@
	
	SetStepSe_(toge00, SILENT_STEP_SE);
	SetStepSe_(toge01, SILENT_STEP_SE);
	SetStepSe_(toge02, SILENT_STEP_SE);
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 25);
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(75);
	
	SetMotion_(toge00, toge_break_walk00, 24);				// ���g�Q�W���{�[�P�@�g�Q�t������
	task_toge00 = Task_AnimeMoveNoDir_(toge00, "anm_toge000");
	SetMotionSpeed_(toge00, 0.49);
	task_togeSE00=Task_PlaySe_("SE_FLD_021", 18);	
	Wait_(1);
	
	SetMotion_(toge01, toge_break_walk00, 24);				// ���g�Q�W���{�[�Q�@�g�Q�t������
	task_toge01 = Task_AnimeMoveNoDir_(toge01, "anm_toge100");
	SetMotionSpeed_(toge01, 0.50);
	task_togeSE01=Task_PlaySe_("SE_FLD_021", 18);	
	Wait_(1);
	
	SetMotion_(toge02, toge_break_walk00, 24);				// ���g�Q�W���{�[�R�@�g�Q�t������
	task_toge02 = Task_AnimeMoveNoDir_(toge02, "anm_toge200");
	SetMotionSpeed_(toge02, 0.51);
	task_togeSE02=Task_PlaySe_("SE_FLD_021", 18);
	Wait_(40);
	
	task_player = Task_AnimeMoveNoDir_(player, "anm_player000");
	SetMotion_(player, player_back_L, 12);					// ��l���@�ジ����
	SetMotionSpeed_(player, 1.80);
	Wait_(2);
	
	task_rukiya00 = Task_AnimeMoveNoDir_(rukiya, "anm_rukiya000");
	Wait_(57);
	
	DeleteTask_(task_cam);
	
	DeleteTask_(task_toge00);
	DeleteTask_(task_toge01);
	DeleteTask_(task_toge02);
	
	DeleteTask_(task_togeSE00);
	DeleteTask_(task_togeSE01);
	DeleteTask_(task_togeSE02);
		
	DeleteTask_(task_player);
	DeleteTask_(task_rukiya00);


	//��������������������������������������
	//���J�b�g13�@��l���ƃ��L���@�ジ����@����
	//��������������������������������������

	SetPointCameraEye_("cameye008");
	SetPointCameraTarget_("camtgt008");

	SetDir_(toge00, 165);
	SetDir_(toge01, 170);
	SetDir_(toge02, 180);
	SetScale_(toge00, 0.6);// �J�����Ɏ��܂�Ȃ��̂ŏk��
	SetScale_(toge01, 0.6);// �J�����Ɏ��܂�Ȃ��̂ŏk��
	SetScale_(toge02, 0.6);// �J�����Ɏ��܂�Ȃ��̂ŏk��
	InitSilhouetteWidth_(toge00, 0.6);
	InitSilhouetteWidth_(toge01, 0.6);
	InitSilhouetteWidth_(toge02, 0.6);
	task_toge00 = Task_AnimeMoveNoDir_(toge00, "anm_toge001");
	task_toge01 = Task_AnimeMoveNoDir_(toge01, "anm_toge101");
	task_toge02 = Task_AnimeMoveNoDir_(toge02, "anm_toge201");
	task_player = Task_AnimeMoveNoDir_(player, "anm_player001");
	task_rukiya00 = Task_AnimeMoveNoDir_(rukiya, "anm_rukiya001");
	SetMotionSpeed_(toge00, 0.30);
	SetMotionSpeed_(toge01, 0.31);
	SetMotionSpeed_(toge02, 0.29);
	SetMotionSpeed_(player, 1.80);
	Wait_(85);
	DeleteTask_(task_toge00);
	DeleteTask_(task_toge01);
	DeleteTask_(task_toge02);
	DeleteTask_(task_player);
	DeleteTask_(task_rukiya00);


	//��������������������������������������
	//���J�b�g14�@��l���ƃ��L���@�\���@�o�X�g�A�b�v���Y�[���A�E�g
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	SetMotion_(toge00, toge_after_break00, BLEND_N);		// ���g�Q�W���{�[�P�@�g�Q�t���ҋ@
	SetMotion_(toge01, toge_after_break01, BLEND_N);		// ���g�Q�W���{�[�Q�@�g�Q�t���ҋ@
	SetMotion_(toge02, toge_after_break02, BLEND_N);		// ���g�Q�W���{�[�R�@�g�Q�t���ҋ@
	SetMotion_(player, player_caution01_L, BLEND_N);		// ��l���@�x��L
	SetMotionSpeed_(player, 1.00);
	SetPointPos_(player, "player003");
	Wait_(60);
	task_rukiya00 = Task_RotateToDir_(rukiya, 80, 7.5);
	Wait_(2);
	SetMotion_(rukiya, rukiya_look_left_L, 10);				// ���L���@�������ҋ@L
	Wait_(30);
	DeleteTask_(task_rukiya00);


	//��������������������������������������
	//���J�b�g15�@�p�C�v�@�Y�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");

	Wait_(60);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g16�@��l���ƃ��L���@���A�N�^�[��n��
	//��������������������������������������

	SetPointCameraEye_("cameye009");
	SetPointCameraTarget_("camtgt009");

	SetPointPosNoFit_(rukiya, "npc_rukiya004");
	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ���L���@�ҋ@
	task_rukiya00 = Task_RotateToDir_(rukiya, 180, 5);
	Wait_(15);
	DeleteTask_(task_rukiya00);
	task_rukiya00 = Task_AnimeMoveNoFit_(rukiya, "anm_rukiya002");
	Wait_(15);
	DeleteTask_(task_rukiya00);

	SetMotion_(rukiya, rukiya_pass_reactor, BLEND_XL);		// ���L���@���A�N�^�[���O���������o��
	SetMotionSpeed_(rukiya, 1.25);
	Wait_(26);
	SetAlpha_(reactor, ALPHA_EXIST);
	AttachObject_(rukiya, reactor, ATTACH_EFFECT2);
	SetMeshVisible_(rukiya, "Model_2", false);
	WaitMotion(rukiya);
	SetMotion_(rukiya, rukiya_pass_reactor_L, BLEND_XL);	// ���L���@���A�N�^�[�������o��L

	//===============================================
	// �����L��
	// �u<name_player/>�c�c���񂽂�
	// �@����������ā@��������@�������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");

	SetMotion_(player, MOT_WAIT, 13);						// ��l���@�ҋ@
	SetScale_(toge00, 0.8);// �J�������܂���l���Ē���
	SetScale_(toge01, 0.8);// �J�������܂���l���Ē���
	SetScale_(toge02, 0.8);// �J�������܂���l���Ē���
	task_toge00 = Task_AnimeMove_(toge00, "anm_toge002");
	task_toge01 = Task_AnimeMove_(toge01, "anm_toge102");
	task_toge02 = Task_AnimeMove_(toge02, "anm_toge202");
	SetMotionSpeed_(toge00, 0.30);
	SetMotionSpeed_(toge01, 0.32);
	SetMotionSpeed_(toge02, 0.28);
	SetMotion_(toge00, toge_break_walk00, BLEND_N);			// ���g�Q�W���{�[�P�@�g�Q�t������
	Wait_(1);
	SetMotion_(toge01, toge_break_walk00, BLEND_M);			// ���g�Q�W���{�[�Q�@�g�Q�t������
	Wait_(1);
	SetMotion_(toge02, toge_break_walk00, BLEND_L);			// ���g�Q�W���{�[�R�@�g�Q�t������
	Wait_(13);
	SetMotion_(player, player_get_reactor, BLEND_L);		// ��l���@���A�N�^�[�󂯎�遨�ҋ@
	SetMotionSpeed_(player, 1.25);
	Wait_(12);
	DetachObject_(rukiya);
	AttachObject_(player, reactor, ATTACH_EFFECT2);
	SetMotion_(rukiya, MOT_WAIT, BLEND_L);					// ���L���@�ҋ@
	Wait_(24);
	WaitMotion(player);
	SetMotion_(player, player_reactor_stand, 5);			// ��l���@���A�N�^�[�t�ҋ@
	Wait_(69);
	DeleteTask_(task_cam);
	SetMotion_(toge00, toge_after_break00, BLEND_N);		// ���g�Q�W���{�[�P�@�g�Q�t���ҋ@
	SetMotion_(toge01, toge_after_break01, BLEND_N);		// ���g�Q�W���{�[�Q�@�g�Q�t���ҋ@
	SetMotion_(toge02, toge_after_break02, BLEND_N);		// ���g�Q�W���{�[�R�@�g�Q�t���ҋ@


	//��������������������������������������
	//���J�b�g17�@��l���ƃ��L���@�U��������X�C�b�`���Ԃ��Ȃ�@�Y�[���C�����Y�[���A�E�g
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");

	SetMotionSpeed_(player, 1.00);
	SetMotionSpeed_(rukiya, 1.00);
	SetMotion_(player, player_reactor_caution01_L, BLEND_N);// ��l���@���A�N�^�[�t�x��
	SetPointPos_(rukiya, "npc_rukiya005");
	task_rukiya00 = Task_RotateToDir_(rukiya, 1, 10);
	Wait_(18);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam00 = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// �W����
	Wait_(7);
	DeleteTask_(task_rukiya00);
	DeleteEffectEmitter_(efc_cam00);

	//===============================================
	// �����L��
	// �u�c�c����Ȃ��Ƃ��@���낤���Ɓ@�p�ӂ��Ă�����
	// �@�Ō�̐؂�D���@�g���Ƃ����@�����悤���ˁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);

	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");
	Wait_(60);

	StopBgm_(60);
	SetMotion_(rukiya, rukiya_blast_on, BLEND_XL);			// ���L���@�֎q�X�C�b�`�I��
	WaitMotion(rukiya);
	SetMotion_(rukiya, rukiya_blast_L, BLEND_L);			// ���L���@�֎q�X�C�b�`�I��L
	PlaySE_("SE_DEM_093");
	SetFace_(rukiya, "bom_loop");							// ���L���@���e�N��
	SetMeshVisible_(rukiya, "Model_3", true);
	Wait_(25);
	efc_cam01 = SetCameraEffect_("ef842_02_light_alert", CAMERA_DEF);// �Ԃ������v
	Wait_(60);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g18�@�_�[�N�}�X�^�[�@����(�x���H)�@�o�X�g�A�b�v�Y�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");
	PlayBgm_("BGM_023");
	SetMotion_(dark, MOT_WAIT, BLEND_N);					// �_�[�N�}�X�^�[�@�ҋ@
	SetMotion_(dark, dark_surprise_L, 6);					// �_�[�N�}�X�^�[�@����L
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam00 = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// �W����
	Wait_(7);
	DeleteEffectEmitter_(efc_cam00);

	//===============================================
	// ���_�[�N�}�X�^�[
	// �u���̋���ȁ@�M�����́c�c�܂���
	// �@���L�����@����Ă���@�B�́@�������u���I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_420_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g19�@���L���Ǝ�l���@��b�@�o�X�g�A�b�v�Y�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");

	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ���L���@�ҋ@
	SetMotion_(rukiya, MOT_TALK, BLEND_L);					// ���L���@��b
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam00 = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// �W����
	Wait_(7);
	DeleteEffectEmitter_(efc_cam00);

	//===============================================
	// �����L��
	// �u�������I�@�������g����
	// �@�������u���炢�@������΂���͂��I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_140");
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_L);				// ���L���@��bL
	SetFace_(rukiya, "Face_anger");							// ���L���@�}��
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g20�@�_�[�N�}�X�^�[�@�o�X�g�A�b�v���΂ߑO��
	//��������������������������������������

	SetPointCameraEye_("cameye010");
	SetPointCameraTarget_("camtgt010");

	SetMotion_(dark, MOT_TALKLOOP, BLEND_N);				// �_�[�N�}�X�^�[�@��bL
	SetMotionSpeed_(dark, 1.75);

	//===============================================
	// ���_�[�N�}�X�^�[
	// �u���L���@�M�l�c�c�I
	// �@���u�̔j��Ɓ@�Ђ������Ɂ@���ʋC���I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_420_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);


	//��������������������������������������
	//���J�b�g21�@���L���@�ҋ@���E�����ҋ@�@�o�X�g�A�b�v���΂ߑO��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye012", "anmtgt012");

	SetFace_(rukiya, "Face_default");
	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ���L���@�ҋ@
	SetDir_(rukiya, 90);
	task_rukiya00 = Task_AnimeMoveNoDirNoFit_(rukiya, "anm_rukiya003");
	Wait_(25);
	task_rukiya01 = Task_RotateToDir_(rukiya, 70, 0.4);
	Wait_(25);
	SetMotion_(rukiya, rukiya_look_right_L, 14);			// ���L���@�E�����ҋ@L
	WaitTask(task_rukiya00);
	DeleteTask_(task_rukiya00);
	DeleteTask_(task_rukiya01);

	//===============================================
	// �����L��
	// �u����ȁ@�������u�́@���̐��E��
	// �@���݂����Ă����킯�ɂ�@�����Ȃ���łˁI
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye013", "anmtgt013");
	SetMotion_(rukiya, rukiya_look_left_L, 12);				// ���L���@�������ҋ@L
	Wait_(36);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g22�@��l���@�x���������]��������@�o�X�g�A�b�v�E�΂ߑO�������Y�[���C��
	//��������������������������������������

	SetPointCameraEye_("cameye011");
	SetPointCameraTarget_("camtgt011");

	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ���L���@�ҋ@
	SetDir_(rukiya, 40);
	SetPointPos_(player, "player004");
	Wait_(15);

	//===============================================
	// �����L��
	// �u������Ă񂾂��I
	// �@�����������ā@�����@������񂾂�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(player, player_caution01_up_L, 5);			// ��l���@�x���i���L��������jL
	Wait_(60);
	SetMotion_(player, player_vix, BLEND_M);				// ��l���@����������
	SetFace_(player, "Face_loop_close");
	Wait_(30);
	task_cam = Task_AnimeMoveCamera_("anmeye014", "anmtgt014");
	Wait_(70);

	SetMotion_(player, player_reactor_caution01_L, BLEND_M);// ��l���@���A�N�^�[�t�x��L
	SetFace_(player, "Face_default");
	Wait_(50);

	SetMotion_(player, player_reactor_run, BLEND_L);		// ��l���@���A�N�^�[�t����
	task_player = Task_RotateToDir_(player, 165, 12);
	WaitTask(task_player);
	DeleteTask_(task_player);

	task_player = Task_AnimeMoveNoDirNoFit_(player, "anm_player002");
	Wait_(20);
	SetMotion_(player, player_reactor_stand, BLEND_N);		// ��l���@���A�N�^�[�t�ҋ@
	DeleteTask_(task_cam);
	DeleteTask_(task_player);


	//��������������������������������������
	//���J�b�g23�@���L���@���E�΂ߑO�����Y�[���A�E�g
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye015", "anmtgt015");

	Wait_(30);
	SetFace_(rukiya, "bom_loop02");
	Wait_(20);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 40);
	Wait_(45);
	DeleteTask_(task_cam);

	SetFace_(player, "Face_right");
	
	//��������������������������������������
	//���J�b�g24�@�_�[�N�}�X�^�[�ƃC�b�^�u���@�_�[�N�}�X�^�[�ҋ@���x���@���΂ߑO��
	//��������������������������������������

	SetPointCameraEye_("cameye012");
	SetPointCameraTarget_("camtgt012");

	StartBlurEffect_();
	SetPointPosNoFit_(ittaburu, "npc_ittaburu003");
	SetMotion_(dark, MOT_WAIT, BLEND_N);					// �_�[�N�}�X�^�[�@�ҋ@
	SetMotionSpeed_(dark, 0.1);
	SetMotionSpeed_(ittaburu, 0.1);
	Wait_(1);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 1);
	SetMotion_(dark, dark_surprise_L, 64);					// �_�[�N�}�X�^�[�@����L
	Wait_(19);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 35);
	Wait_(45);


	//��������������������������������������
	//���J�b�g25�@��l���@�U�����������@���΂ߌ��
	//��������������������������������������

	SetPointCameraEye_("cameye013");
	SetPointCameraTarget_("camtgt013");
	
//	DetachObject_(player);//�������񃊃A�N�^�[�O��(�t������Ԃ�����Ƃ��͂�����CO)
	SetPointPos_(player, "player005");
	SetMotion_(player, player_reactor_caution_turn_L, BLEND_N);// ��l���@���A�N�^�[�t�x���i�U�����������j
	SetMotionSpeed_(player, 0.2);
	
	Wait_(1);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 1);
	SetStepSe_(player, SILENT_STEP_SE);
	Wait_(30);
	SetMotionSpeed_(player, 0.1);
//	SetMotion_(player, player_reactor_run, 32);				// ��l���@���A�N�^�[�t����
	task_player = Task_MoveForward_(player, 0.5, false);
	Wait_(50);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 40);
	Wait_(40);
	SetMotion_(player, player_reactor_stand, BLEND_N);		// ��l���@���A�N�^�[�t�ҋ@
	Wait_(10);
	DeleteTask_(task_player);


	//��������������������������������������
	//���J�b�g26�@���L���@�������ҋ@��������ҋ@���ڂ��Ԃ�@���ՉE�΂ߑO��
	//��������������������������������������

	SetPointCameraEye_("cameye014");
	SetPointCameraTarget_("camtgt014");

	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ���L���@�������ҋ@L
	SetMotionSpeed_(rukiya, 0.2);
	SetStepSe_(rukiya, SILENT_STEP_SE);
	Wait_(1);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 1);
	Wait_(15);
	SetMotion_(rukiya, rukiya_look_up_L, 32);				// ���L���@������ҋ@L
	Wait_(35);

	//===============================================
	// �����L��
	// �u����Ł@�����c�c�B
	// �@�}�U�[�̂��Ɓ@���񂽂Ɂ@�܂�������c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_180");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 80);
	SetFace_(rukiya, "Face_loop_close");
	StopBgm_(80);
	Wait_(80);


	//��������������������������������������
	//���J�b�g27�@���u�@�唚��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye016", "anmtgt016");
	PlaySE_("SE_DEM_094");

	Wait_(1);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 1);

	Wait_(5);
	PlaySE_("SE_SKL_021");									// ������
	Wait_(15);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 60);
	efc_explosion = SetPointWorldEffect_("ef842_03_explosion_brkmcn01", "efc_explosion000");// �u���C�N�����u�̔���
	StartEarthQuake_(30, 3, 12);
	Wait_(60);
	
	EndBlurEffect_();

	EndDemo(FADE_COLOR_WHITE);
}
