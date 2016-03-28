//=============================================
//
//		demo826[�Ō�̎���]
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
	local task_cam, task_aroma, task_star_seed, task_darsgalma00, task_darsgalma01, task_darsgalma02;
	local task_aroma_step;
	local efc_cam, efc_aroma00, efc_aroma01, efc_star_seed;
	local efc_darkmaster00, efc_darkmaster01, efc_darkmaster02, efc_darsgalma00, efc_darsgalma01;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();
	local model_rena = ReadNpc_("n007");										// ���i�[�e
	local model_aroma = ReadNpc_("n018");										// �A���}
	local model_darkmaster = ReadNpc_("n008");									// �_�[�N�}�X�^�[
	local model_darsgalma = ReadNpc_("m180_00");								// �_�[�X�K���}
	// �M�~�b�N
	local model_mother = ReadGimmick_("o_C03_02");								// �}�U�[
	local model_decoration = ReadGimmick_("o_C03_03");							// �}�U�[����
	local model_reactor = ReadGimmick_("o_dem_07");								// ���A�N�^�[(�A�^�b�`�p)
	//�G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");										// �u�I�v
	LoadEffect_("ef733_01_sym_shuchusen01");									// �W����
	LoadEffect_("ef732_13_light_reactor01");									// ���A�N�^�[�̌�(�܂Ԃ���)
	LoadEffect_("ef732_26_star_seed_base02");									// �X�^�[�V�[�h �x�[�X02
	LoadEffect_("ef882_04_smoke_dark");											// �X�^�[�V�[�h����o��Í�
	LoadEffect_("ef861_01_dm_die01");											// �_�[�N�}�X�^�[���łP
	LoadEffect_("ef861_02_dm_die02");											// �_�[�N�}�X�^�[���łQ
	LoadEffect_("ef730_01_oth_dark_aura01");									// �ЁX�����I�[��
	LoadEffect_("ef861_03_m_draw");												// M�R�̋z��
	//���C�A�E�g
	LoadLayout_("black");														// �u���b�N

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �A���}
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "obj_mother000");
	SetPointPosNoFit_(rena, "obj_mother000");
	SetFace_(rena, "Face_loop_close");
	// �_�[�N�}�X�^�[
	local darkmaster = ArrangePointNpc_(model_darkmaster, "npc_darkmaster000");
	SetPointPosNoFit_(darkmaster, "npc_darkmaster000");
	SetVisible(darkmaster, false);
	// �_�[�X�K���}
	local darsgalma = ArrangePointNpc_(model_darsgalma, "npc_darsgalma000");
	SetPointPosNoFit_(darsgalma, "npc_darsgalma000");
	SetScaleSilhouette(darsgalma, SCALE.G, SILHOUETTE_WIDTH.G);
	SetVisible(darsgalma, false);
	// �}�U�[
	local mother = ArrangePointGimmick_("o_C03_02", model_mother, "obj_mother000");
	// �}�U�[����
	local decoration = ArrangePointGimmick_("o_C03_03", model_decoration, "obj_mother000");
	// ���A�N�^�[(�A�^�b�`�p)
	local reactor = ArrangePointGimmick_("o_com_02", model_reactor, "efc_star_seed000");
	SetAlpha_(reactor, ALPHA_CLEAR);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");			// ������ҋ@L
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");		// �x��L
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// �퓬�ҋ@
	// �A���}
	local aroma_look_up_L = ReadMotion_(aroma, "n018_look_up_L");				// ������ҋ@L
	local aroma_send_up_L = ReadMotion_(aroma, "n018_star_seed_send_up_L");		// �X�^�[�V�[�h���}����
	local star_seed_look_L = ReadMotion_(aroma, "n018_star_seed_look_L");		// �X�^�[�V�[�h������
	local aroma_guard_L = ReadMotion_(aroma, "n018_guard_L");					// �\����L
	// �_�[�N�}�X�^�[
	local darkmaster_fly_L = ReadMotion_(darkmaster, "n008_fly_L");				// ����L
	local darkmaster_fly_summon = ReadMotion_(darkmaster, "n008_fly_summon");	// �����i��������ԁj
	local darkmaster_fly_summon_L = ReadMotion_(darkmaster, "n008_fly_summon_L");// ����L�i��������ԁj
	local darkmaster_fly_laugh_L = ReadMotion_(darkmaster, "n008_fly_laugh_L");	// �΂�L�i��������ԁj
	// ���i�[�e
	local rena_mother_L = ReadMotion_(rena, "n007_mother_L");					// �}�U�[�̒��̃��i�[�e

// ���������[�V�����ݒ�
	SetMotion_(mother, MOT_GIMMICK_1 ,BLEND_N);									// �}�U�[�@���Ȃ�
	SetMotion_(player, player_look_up_L, BLEND_N);								// ��l���@������ҋ@L
	SetMotion_(aroma, MOT_WALK, BLEND_N);										// �A���}�@����
	SetMotion_(rena, rena_mother_L, BLEND_N);									// ���i�[�ein�}�U�[
	SetMotion_(darkmaster, darkmaster_fly_L ,BLEND_N);							// �_�[�N�}�X�^�[�@����L
	SetMotionSpeed_(darkmaster, 0);
	task_aroma = Task_AnimeMove_(aroma, "anm_aroma000");
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);


	//��������������������������������������
	//���J�b�g�P�@��l���ƃA���}�ƃ}�U�[�@�A���}���s����~�@��l���ƃA���}�΂ߌ�����}�U�[�ւo�`�m�A�b�v
	//��������������������������������������

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);

	Wait_(23);
	SetMotion_(aroma, MOT_WAIT, 14);											// �A���}�@�X�^�[�V�[�h������
	Wait_(15);
	DeleteTask_(task_aroma_step);
	Wait_(15);
	DeleteTask_(task_aroma);

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(180);
	DeleteTask_(task_cam);
	ChangeColorTone_(1.0, 0.0, 1.0, 1);											//�F���␳�u���v


	//��������������������������������������
	//���J�b�g�Q�@�ǉ��J�b�g�@���i�[�e�𒍎�
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye012", "anmtgt012");

	WaitTask(task_cam);
	Wait_(60);
	ChangeColorTone_(0.0, 0.0, 0.0, 1);											//�F���␳���ǂ�
	SetVisible(player, false);
	SetMotion_(aroma, aroma_look_up_L, BLEND_N);								// �A���}�@������ҋ@


	//��������������������������������������
	//���J�b�g�R�@�A���}�@������ҋ@��������������ҋ@�@�A���}�΂ߑO��
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	//===============================================
	//���A���}
	//�u���܂����@���i�[�e�B
	//�@�������@���R�ɂ��Ă������c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_826_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, star_seed_look_L, 20);									// �A���}�@�X�^�[�V�[�h������
	Wait_(35);
	PlaySE_("SE_DEM_204");
	efc_aroma00 = SetSelectBoneEffect_("ef732_13_light_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_aroma00, 0.12);
	Wait_(45);

	local size = 0.015;
	local count = 0;
	while(1){//���t���[�����G�t�F�N�g��傫������
		SetEffectScale_(efc_aroma00, 0.12+(count * size));
		count = count + 1;
		Wait_(1);
		if(50 == count){//50�t���[���ŏI��
			break;
		}
	}

	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 1);
	DeleteEffectEmitter_(efc_aroma00);
	SetPointPosNoFit_(reactor, "efc_star_seed001");
	efc_aroma01 = SetSelectBoneEffect_("ef732_26_star_seed_base02", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_aroma01, 0.3);
	Wait_(5);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 25);
	Wait_(45);
	PlaySE_("SE_DEM_205");
	Task_AnimeMoveNoFit_(reactor, "anm_star_seed000");
	Wait_(7);
	SetMotion_(aroma, aroma_send_up_L, 43);										// �A���}�@�X�^�[�V�[�h���}����
	Wait_(92);


	//��������������������������������������
	//���J�b�g�S�@�}�U�[�@���ڋ߁����i�[�e�A�b�v
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye013", "anmtgt013");

	SetEffectScale_(efc_aroma01, 0.5);
	local task_star = Task_AnimeMoveNoFit_(reactor, "anm_star_seed001");
	WaitTask(task_cam);
	WaitTask(task_star);
	StopBgm_(30);
	SetLayoutAnime_("fade_in", false);											//���������C��
	Wait_(30);
	SetLayoutAnime_("loop", false);												//��������L
	Wait_(5);

	//===============================================
	//*���i�[�e
	//���߁c�c��߂āc�c�I
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_826_MSG_020", false);
	Wait_(50);
	SetLayoutAnime_("fade_out", false);											//���������A�E�g
	//===============================================

	Wait_(30);
	ChangeColorTone_(0.0, 0.0, 0.0, 1);											//�F���␳�߂�


	//��������������������������������������
	//���J�b�g�T�@��l���ƃA���}�@�x���E�\���@��l�΂ߑO��
	//��������������������������������������

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetVisible(player, true);
	SetMotion_(player, MOT_WAIT, BLEND_N);										// ��l���@�ҋ@
	SetMotion_(aroma, MOT_WAIT, BLEND_N);										// �A���}�@�ҋ@

	SetMotion_(player, player_caution01_L, 6);									// ��l���@�x��L
	SetMotion_(aroma, aroma_guard_L, 12);										// �A���}�@�\����L

	//===============================================
	//���A���}
	//�u���i�[�e�I�H�@�����@�������́H
	//�@�ǂ��������ƂȂ́c�c�͂����茾���āI
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_826_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//��������������������������������������
	//���J�b�g�U�@�}�U�[�@������ԕ����������@���ʁ����Ƃo�`�m�_�E��
	//��������������������������������������

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetPointPosNoFit_(reactor, "efc_star_seed002");
	SetEffectScale_(efc_aroma01, 0.7);

	Wait_(10);
	SetLayoutAnime_("fade_in", false);											//���������C��
	Wait_(30);
	SetLayoutAnime_("loop", false);												//��������L
	Wait_(5);

	//===============================================
	//*���i�[�e
	//������c�c�g���Ắc�c���߁c�c�I
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_826_MSG_040", false);
	Wait_(10);
	SetLayoutAnime_("fade_out", false);											//���������A�E�g
	//===============================================
	PlaySE_("SE_DEM_206");
	efc_star_seed = SetSelectBoneEffect_("ef882_04_smoke_dark", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_star_seed, 3.0);
	Wait_(30);

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	Wait_(60);

	//===============================================
	//*�_�[�N�}�X�^�[
	//�u�Ӂc�c�ӂ͂͂͂͂��I�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_826_MSG_050");
	DeleteTask_(task_cam);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	size = 0.3;
	count = 0;
	while(1){//���t���[�����G�t�F�N�g��傫������
		SetEffectScale_(efc_star_seed, 3.0+(count * size));
		count = count + 1;
		Wait_(1);
		if(55 == count){//55�t���[���ňÓ]�J�n
			PlaySE_("SE_DEM_207");
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);
		}
		if(85 == count){//85�t���[���ŏI��
			break;
		}
	}


	//��������������������������������������
	//���J�b�g�V�@�_�[�N�}�X�^�[�@�΂ߐ��ʑ��������ւo�`�m�A�b�v���o�X�g�A�b�v��������萳�ʊ��ɉ�荞�݂Ȃ���Y�[���A�E�g
	//��������������������������������������

	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	efc_darkmaster00 = SetSelectBoneEffectSetOffset_("ef861_02_dm_die02", darkmaster, ATTACH_GLOBAL, Vec3(0.0, -4.5, 2.0));
	efc_darkmaster01 = SetSelectBoneEffectSetOffset_("ef861_02_dm_die02", darkmaster, ATTACH_GLOBAL, Vec3(0.0, 10.25, 2.0));
	SetEffectScale_(efc_darkmaster00, 1.5);
	SetEffectScale_(efc_darkmaster01, 1.5);
	SetEffectScale_(efc_star_seed, 0.4);
	SetPointPosNoFit_(reactor, "efc_star_seed003");
	SetEffectScale_(efc_aroma01, 0.225);
	SetVisible(darkmaster, true);
	SetMotionSpeed_(darkmaster, 1.0);

	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 20);
	Wait_(10);
	DeleteEffectEmitter_(efc_darkmaster00);
	DeleteEffectEmitter_(efc_darkmaster01);

	StartBlurEffect_();
	Wait_(40);

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);				// �W����
	PlaySE_("SE_DEM_026");															// ��SE:�W����
	Wait_(10);
	PlayBgm_("BGM_008");
	Wait_(6);
	DeleteEffectEmitter_(efc_cam);
	WaitTask(task_cam);
	DeleteTask_(task_cam);

	EndBlurEffect_();

	//===============================================
	//���A���}
	//�u�_�[�N�}�X�^�[�I�H
	//�@<name_player/>���@�|�����͂�����I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_826_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	Wait_(60);

	//===============================================
	//���_�[�N�}�X�^�[
	//�u����ł����Ƃ��c�c���̓I�ɂ͂ȁB
	//�@�M�l�ɔs�ꂽ�@���̂Ƃ��c�c��͎��񂾁B�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_826_MSG_070");
	KeyInputWait_();
	//===============================================

	SetMotion_(darkmaster, darkmaster_fly_summon, 6);							// �_�[�N�}�X�^�[�@�ҋ@�������X�^�[����
	SetMotionSpeed_(darkmaster, 2.5);

	//===============================================
	//���_�[�N�}�X�^�[
	//�u�������@���̏�ɂ������@�K���}�U�[�h�̃}�f��
	//�@��̎v�O���@���̐��Ɂ@�Ƃǂ܂点���̂��I
	//-----------------------------------------------
	ShowMsg_("DEMO_826_MSG_080");
	Wait_(12);
	SetMotion_(darkmaster, darkmaster_fly_summon_L, 16);						// �_�[�N�}�X�^�[�@�����X�^�[����L
	SetMotionSpeed_(darkmaster, 1.0);
	Wait_(16);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g�W�@�A���}�@�A���}�΂ߑO�����Y�[���A�b�v
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	SetMotion_(darkmaster, darkmaster_fly_L ,BLEND_N);							// �_�[�N�}�X�^�[�@����L
	SetVisible(player, false);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);				// �W����
	Wait_(6);
	DeleteEffectEmitter_(efc_cam);
	DeleteTask_(task_cam);

	//===============================================
	//���A���}
	//�u������āc�c�K���}�b�]�Ɓ@��������Ȃ��I
	//�@�}�f�Ɂ@�v�O�������@�h��Ȃ�āc�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_826_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);


	//��������������������������������������
	//���J�b�g�X�@�_�[�N�}�X�^�[�ƃA���}�Ǝ�l���@�_�[�N�}�X�^�[�΂ߑO������l�΂ߌ��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	SetVisible(player, true);
	SetMotion_(aroma, aroma_guard_L, BLEND_N);									// �A���}�@�\����L
	SetPointPosNoFit_(darkmaster, "npc_darkmaster001");
	SetPointPosNoFit_(reactor, "efc_star_seed004");
	Wait_(5);

	//===============================================
	//���_�[�N�}�X�^�[
	//�u�����c�c�������@�v�O�����ł́@�����ł���B
	//�@��́@�V���Ȑg�̂��@���ݏo�����@��T�����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_826_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);

	//===============================================
	//���A���}
	//�u�c�c�����Ł@�|�C���g�[���ɂ�����
	//�@�������X�^�[�V�[�h�Ɂ@�ڂ��������Ă킯�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_826_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);

	//===============================================
	//���_�[�N�}�X�^�[
	//�u�����ɂ��B�X�^�[�V�[�h�ɂ��Ă�
	//�@�}�U�[���^����ꂽ�@�m�����������c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_826_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(25);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g�P�O�@�_�[�N�}�X�^�[���_�[�X�K���}�@�ϐg�@�J�����قڃA�j��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");

	SetDir_(player, 0);
	SetVisible(player, false);
	SetVisible(aroma, false);
	SetPointPosNoFit_(darkmaster, "npc_darkmaster002");
	SetPointPosNoFit_(reactor, "efc_star_seed005");
	SetMotion_(darkmaster, darkmaster_fly_summon, 6);							// �_�[�N�}�X�^�[�@�ҋ@�������X�^�[����
	SetMotionSpeed_(darkmaster, 2.5);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);				// �W����
	Wait_(8);

	//===============================================
	//���_�[�N�}�X�^�[
	//�u�����ā@�ǂ߂Ă����c�c���i�[�e���~������
	//�@�M�l�������@�X�^�[�V�[�h���@�g�����Ƃ͂ȁI�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_826_MSG_130");
	Wait_(4);
	SetMotion_(darkmaster, darkmaster_fly_summon_L, 16);						// �_�[�N�}�X�^�[�@�����X�^�[����L
	SetMotionSpeed_(darkmaster, 1.0);
	Wait_(18);
	DeleteEffectEmitter_(efc_cam);
	DeleteTask_(task_cam);
	KeyInputWait_();
	//===============================================
	//���_�[�N�}�X�^�[
	//�u������@��́@�X�^�[�V�[�h�ɐ���
	//�@�M�l�炪�@�N��������̂��@�҂����̂��B�@��
	//-----------------------------------------------
	ShowMsg_("DEMO_826_MSG_140");
	KeyInputWait_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");
	task_star_seed = Task_AnimeMoveNoFit_(reactor, "anm_star_seed002");
	SetMotion_(darkmaster, darkmaster_fly_L ,32);								// �_�[�N�}�X�^�[�@����L

	//===============================================
	//���_�[�N�}�X�^�[
	//�u�����c�c�M�l��́@�|�����͂��́@���
	//�@���������̎�Ł@���������Ă��܂����킯���B
	//-----------------------------------------------
	ShowMsg_("DEMO_826_MSG_150");
	Wait_(27);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);
	SetMotion_(darkmaster, darkmaster_fly_laugh_L ,12);							// �_�[�N�}�X�^�[�@�΂�L
	SetMotionSpeed_(darkmaster, 1.0);
	Wait_(30);

	//===============================================
	//���_�[�N�}�X�^�[
	//�u�_�E���œ����@���E��n������`�J���c�c
	//�@������@��ɗ^������łȁI
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_826_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	WaitTask(task_star_seed);
	DeleteTask_(task_star_seed);

	task_star_seed = Task_AnimeMoveNoFit_(reactor, "anm_star_seed003");
	Wait_(45);
	efc_aroma00 = SetSelectBoneEffect_("ef732_13_light_reactor01", reactor, ATTACH_GLOBAL);
	PlaySE_("SE_DEM_208");													
	SetEffectScale_(efc_aroma00, 0.6);
	DeleteTask_(task_star_seed);
	Wait_(45);
	DeleteEffectEmitter_(efc_aroma00);
	DeleteEffectEmitter_(efc_aroma01);
	DeleteEffectEmitter_(efc_star_seed);
	Wait_(15);
	efc_darkmaster00 = SetSelectBoneEffectSetOffset_("ef861_03_m_draw", darkmaster, ATTACH_EFFECT2, Vec3(0.0, 1.5, 5.0));
	SetEffectScale_(efc_darkmaster00, 0.3);
	Wait_(5);
	SetPos_(reactor, Vec3(0.0, 0.0, 0.0));
	Wait_(55);

	DeleteEffectEmitter_(efc_darkmaster00);	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(15);

	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");
	StartBlurEffect_();
	PlaySE_("SE_DEM_209");
	efc_darkmaster00 = SetSelectBoneEffectSetOffset_("ef861_01_dm_die01", darkmaster, ATTACH_GLOBAL, Vec3(0.0, -1.5, -3.0));
	SetEffectScale_(efc_darkmaster00, 3);
	Wait_(60);
	efc_darkmaster01 = SetSelectBoneEffectSetOffset_("ef861_02_dm_die02", darkmaster, ATTACH_GLOBAL, Vec3(0.0, -1.5, 0.0));
	Wait_(15);
	SetEffectScale_(efc_darkmaster01, 6);
	Wait_(5);
	efc_darkmaster02 = SetSelectBoneEffectSetOffset_("ef861_02_dm_die02", darkmaster, ATTACH_GLOBAL, Vec3(0.0, 3.0, 0.0));
	SetEffectScale_(efc_darkmaster02, 6);
	Wait_(30);

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);

	Wait_(30);
	DeleteEffectEmitter_(efc_darkmaster02);	
	SetVisible(darkmaster, false);
	SetVisible(darsgalma, true);
	SetMeshVisible_(darsgalma, "Model", true);								// �{��
	SetMeshVisible_(darsgalma, "cover", true);								// ����ĂȂ��J�o�[
	SetMeshVisible_(darsgalma, "arm", false);								// �r
	SetMeshVisible_(darsgalma, "breakCover", false);						// ����Ă�J�o�[
	SetMeshVisible_(darsgalma, "head", false);								// ��
	SetAlphaFade(darsgalma, 0.2, 0);
	SetMotion_(player, player_battle_L, BLEND_N);								// ��l���@�퓬�ҋ@
	efc_darsgalma00 = SetPointWorldEffect_("ef861_02_dm_die02", "efc_darsgalma000");
	SetEffectScale_(efc_darsgalma00, 5.0);
	efc_darsgalma01 = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", darsgalma, ATTACH_GLOBAL, Vec3(0.0, 45.0, 0.0));// �ЁX�����I�[��
	SetEffectScale_(efc_darsgalma01, 1.5);
	DeleteTask_(task_cam);

	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");
	SetMotionSpeed_(darsgalma, 0.5);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	StartBlurEffect_();
	Wait_(5);
	DeleteEffectEmitter_(efc_darsgalma00);
	SetAlphaFade(darsgalma, 1.0, 25);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	SetMotionSpeed_(darsgalma, 1.0);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);				// �W����
	task_darsgalma00 = Task_AnimeMoveNoFit_(darsgalma, "anm_darsgalma000");
	Wait_(5);
	DeleteEffectEmitter_(efc_cam);
	DeleteEffectEmitter_(efc_darkmaster00);
	DeleteEffectEmitter_(efc_darkmaster01);

	WaitTask(task_cam);
	EndBlurEffect_();
	DeleteTask_(task_cam);
	EndBlurEffect_();

	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");
	Wait_(57);
	SetVisible(player, true);
	SetVisible(aroma, true);
	SetMotion_(aroma, aroma_guard_L, BLEND_N);									// �A���}�@�\����L
	Wait_(150);
	DeleteTask_(task_cam);
	DeleteTask_(task_darsgalma00);


	//��������������������������������������
	//���J�b�g�P�P�@�_�[�X�K���}�@���U���@����
	//��������������������������������������

	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	SetPointPosNoFit_(darsgalma, "npc_darsgalma001");
	SetVisible(player, false);
	SetVisible(aroma, false);
	Wait_(10);

	//===============================================
	//���_�[�N�}�X�^�[
	//�u���̎p�����́c�c�_�[�X�K���}�I�I
	//�@�䂪�@�V���ȃ`�J���́@�����ł���I�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_826_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);

	//===============================================
	//���_�[�X�K���}
	//�u�̑�ɂ��ā@��ΓI�ȁ@�`�J���̑O��
	//�@��]���Ȃ��玀�ˁI�@<name_player/>�I�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARSGARUMA");
	ShowMsg_("DEMO_826_MSG_180");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(20);
	task_darsgalma01 = Task_RotateToDir_(darsgalma, 165, 1.0);
	task_darsgalma02 = Task_AnimeMoveNoFit_(darsgalma, "anm_darsgalma001");
	SetMotion_(darsgalma, MOT_SWORD_ACTUATE, 32);
	PlaySE_("SE_DEM_210");
	Wait_(28);

	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");

	EncountEndDemo(ENCOUNT_BOSS);
	SetMotionSpeed_(darsgalma, 0.1);
}
