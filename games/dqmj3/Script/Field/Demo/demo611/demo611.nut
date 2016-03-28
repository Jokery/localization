//=============================================
//
//		demo611[�����̃K���r���X]
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
	local task_cam, task_player, task_rena, task_antibody, task_grbrs, task_beto;
	local efc_cam, efc_player, efc_rena, efc_antibody0, efc_antibody1, efc_drain, efc_grbrs;
	local bone_efc0, bone_efc1, bone_efc2, bone_efc3, bone_efc4;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_mother = ReadGimmick_("o_C03_02");		// �}�U�[
	local model_decoration = ReadGimmick_("o_C03_03");	// �}�U�[����
	local model_ground = ReadGimmick_("o_dem_20");		// �K���r���X�i�n�ʂׂƂׂƁj
	local model_base = ReadGimmick_("o_effect_base");	// �G�t�F�N�g�x�[�X
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_rena = ReadNpc_("n007");				// ���i�[�e
	local model_grbrs = ReadNpc_("m184_00");			// �K���r���X
	local model_beto = ReadNpc_("n038");				// �K���r���X�i�ׂƂׂƁj
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");				// �u�I�v
	LoadEffect_("ef733_01_sym_shuchusen01");			// �W����
	LoadEffect_("ef733_02_sym_black_mist01");			// ������
	LoadEffect_("ef732_17_antibody_m");					// M�R�̂̌�
	LoadEffect_("ef861_03_m_draw");						// M�R�̋z�����܂��
	LoadEffect_("ef861_04_m_vomit");					// M�R�̂͂����o�����
	LoadEffect_("ef861_05_galvirus_appear01");			// �ˏo��
	LoadEffect_("ef861_06_galvirus_appear02");			// �o�Y
	LoadEffect_("ef861_07_galvirus_appear03");			// ����
	LoadEffect_("ef861_08_galvirus_appear04");			// �H��
	LoadEffect_("ef861_09_galvirus_appear05");			// ��юU��
	LoadEffect_("ef861_16_galvirus_appear06");			// �H�� ���`
	LoadEffect_("ef861_17_galvirus_appear07");			// �H�� �K�`
	LoadEffect_("ef861_18_galvirus_appear08");			// �H�� ���`
	LoadEffect_("ef731_01_mag_light01");				// �����L���L��
	LoadEffect_("ef732_27_shock_wave01");				// �Ռ��g
	LoadEffect_("ef732_13_light_reactor01");			// ���A�N�^�[�̌�
	// ���C�A�E�g
	LoadLayout_("memories");

// ���z�u
	// �}�U�[
	local mother = ArrangePointGimmick_("o_C03_02", model_mother, "obj_mothier000");
	// �}�U�[����
	local decoration = ArrangePointGimmick_("o_C03_03", model_decoration, "obj_mothier000");
	// �K���r���X�i�n�ʂׂƂׂƁj
	local ground = ArrangeGimmick_("o_dem_20", model_ground, "npc_grbrs000");
	SetScaleSilhouette(ground, SCALE.G, SILHOUETTE_WIDTH.G);
	SetMotion_(ground, MOT_GIMMICK_0, BLEND_N);
	// �l�R�́i�G�t�F�N�g�x�[�X�j
	local antibody = ArrangeGimmick_("o_effect_base", model_base, false);

	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena001");
	// �K���r���X
	local grbrs = ArrangePointNpc_(model_grbrs, "npc_grbrs000");
	SetScaleSilhouette(grbrs, SCALE.G, SILHOUETTE_WIDTH.G);
	SetAlpha_(grbrs, ALPHA_CLEAR);
	AttachObject_(grbrs, ground, ATTACH_GLOBAL);
	// �K���r���X�i�ׂƂׂƁj
	local beto = ArrangePointNpc_(model_beto, "npc_grbrs000");
	SetScaleSilhouette(beto, SCALE.G, SILHOUETTE_WIDTH.G);
	SetAlpha_(beto, 0.5);
	SetVisible(beto, false);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// �x��L
	local player_guard = ReadMotion_(player, "Player_guard");				// �x�����g�\����
	local player_guard_L = ReadMotion_(player, "Player_guard_L");			// �g�\����L
	local player_guard_turn = ReadMotion_(player, "Player_guard_turn");		// �g�\���遨�U�����
	local player_guard_turn_L = ReadMotion_(player, "Player_guard_turn_L");	// �g�\���U�����L
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// ���聨�퓬�ҋ@
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// �퓬�ҋ@L
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// �퓬�ҋ@�i�������jL
	// ���i�[�e
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");			// ��������L
	local rena_show01 = ReadMotion_(rena, "n007_show01");					// �ҋ@��������̍����ʂ܂ŏグ��
	local rena_show_L = ReadMotion_(rena, "n007_show_L");					// ������̍����ʂ܂ŏグ��L
	local rena_show02 = ReadMotion_(rena, "n007_show02");					// ������̍����ʂ܂ŏグ�遨�ҋ@
	local rena_talk01 = ReadMotion_(rena, "n007_talk01");					// ��b
	local rena_talk01_L = ReadMotion_(rena, "n007_talk01_L");				// ��bL
	local rena_attack_start = ReadMotion_(rena, "n007_attack_start");		// �ҋ@���U���J�n
	local rena_attack_start_L = ReadMotion_(rena, "n007_attack_start_L");	// �U���J�nL
	local rena_guard = ReadMotion_(rena, "n007_guard");						// �ҋ@���K�[�h
	local rena_weaken = ReadMotion_(rena, "n007_weaken");					// �e����΂���遨���
	local rena_weaken_L = ReadMotion_(rena, "n007_weaken_L");				// ���L
	local rena_show_send_L = ReadMotion_(rena, "n007_show_send_L");			// ������̍����ʂ܂ŏグ�O�֏o��L
	// �K���r���X
	local grbrs_grow = ReadMotion_(grbrs, "m184_00_grow");					// �}�U�[����o�Ă���
	local grbrs_grow_L = ReadMotion_(grbrs, "m184_00_grow_L");				// �}�U�[����o�Ă���L
	local grbrs_born = ReadMotion_(grbrs, "m184_00_born");					// �}�U�[����o�Ă��遨�ҋ@
	local grbrs_shout = ReadMotion_(grbrs, "m184_00_shout");				// �ҋ@�����K���ҋ@
	// �K���r���X�i�ׂƂׂƁj
	local beto_grow = ReadMotion_(beto, "n038_grow");						// �}�U�[����o�Ă���
	local beto_grow_L = ReadMotion_(beto, "n038_grow_L");					// �}�U�[����o�Ă���L
	local beto_born = ReadMotion_(beto, "n038_born");						// �}�U�[����o�Ă��遨�ҋ@
	local beto_shout = ReadMotion_(beto, "n038_shout");						// �ҋ@�����K���ҋ@
	local beto_m_attack = ReadMotion_(beto, "n038_m_attack");				// ���@�U��

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");				// 225F


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemoNoFade(FADE_COLOR_BLACK);

	// ���J�b�g�P���}�U�[�Y�[���A�E�g�`�`�`�`�`�`�`�`�`�`�`�`�`
	Wait_(100);
	// �n�k�P��� 100F-120F
	PlayLoopSE_("SE_DEM_148");
	Wait_(10);
	StopLoopSE_(10);
	Wait_(40);

	// �n�k�Q��� 150F-170F
	PlayLoopSE_("SE_DEM_148");
	Wait_(10);
	StopLoopSE_(10);
	Wait_(40);

	// �n�k�R��� 200F-220F
	PlayLoopSE_("SE_DEM_148");
	Wait_(10);
	StopLoopSE_(10);

	WaitTask(task_cam);
	Wait_(30);


	// ���J�b�g�Q�����i�[�e�Ǝ�l���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	SetMotion_(rena, rena_look_left_L, BLEND_XL);		// ��������L
	Wait_(5);
	SetFace_(rena, "Face_left");
	Wait_(10);
	//===============================================
	// �����i�[�e
	// �u���肪�Ƃ��c�c�@<name_player/>�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetAlpha_(player, ALPHA_CLEAR);


	// ���J�b�g�R�����i�[�e�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	SetFace_(rena, "Face_eyes_close");
	Wait_(15);

	//===============================================
	// �����i�[�e
	// �u���������́@���̖����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, rena_show01, BLEND_L);		// ������̍����ʂ܂ŏグ��
	WaitMotion(rena);
	Wait_(2);
	SetMotion_(rena, rena_show_L, BLEND_M);
	PlaySE_("SE_DEM_142");											//���̌��pSE
	SetPointPosNoFit_(antibody, "obj_antibody000");
	efc_antibody0 = SetSelectBoneEffect_("ef732_17_antibody_m", antibody, ATTACH_GLOBAL);

	//===============================================
	// �����i�[�e
	// �u�c�c�S�z�͂���Ȃ��B���Ȃ�@�l�R�̂�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_antibody = Task_AnimeMoveNoFit_(antibody, "anm_antibody000");
	SetMotion_(rena, rena_show_send_L, 20);
	PlaySE_("SE_DEM_149");											//M�R�̂����ł����S�����ɓ��荞��
	Wait_(60);
	SetAlpha_(player, ALPHA_EXIST);


	// ���J�b�g�S���l�R�̂��}�U�[�֌������`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 240F

	SetMotion_(rena, MOT_WAIT, BLEND_N);
	WaitTask(task_cam);


	// ���J�b�g�T���}�U�[�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye009");
	SetPointCameraTarget_("camtgt009");
	SetFace_(rena, "Face_default");
	
	WaitTask(task_antibody);
	SetDir_(antibody, 180);
	StopBgm_(90);
	efc_drain = SetSelectBoneEffect_("ef861_03_m_draw", antibody, ATTACH_GLOBAL);
	SetEffectScale_(efc_drain, 3.0);
	Wait_(10);
	SetEffectScale_(efc_antibody0, 5.0);
	WaitTask(task_cam);
	Wait_(60);
	PlaySE_("SE_DEM_150");											//�S����������P��

	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 195F�}�U�[�Y�[���A�E�g

	uChangeEffectScale(efc_antibody0, 5.0, 35.0, 150)				// ���񂾂�G�t�F�N�g�傫���Ȃ�
	Wait_(50);
	WaitTask(task_cam);
	efc_drain = SetSelectBoneEffectSetOffset_("ef732_13_light_reactor01", antibody, ATTACH_GLOBAL, Vec3(0.0, 0.0, 50.0));
	SetEffectScale_(efc_drain, 6.0);
	Wait_(40);
	//���t���b�V���̂悤�ȃt�F�[�h�A�E�g
	DeleteEffectEmitter_(efc_antibody0);
	DeleteEffectEmitter_(efc_drain);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	Wait_(80);


	// ���J�b�g�U�����i�[�e�Ǝ�l���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetMotion_(rena, rena_talk01, BLEND_M);		// ��b
	WaitMotion(rena);
	SetMotion_(rena, rena_talk01_L, BLEND_M);	// ��bL

	//===============================================
	// �����i�[�e
	// �u���������c�c�́H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	PlayLoopSE_("SE_DEM_013");
	StartEarthQuake_(60, 3, 0.5);
	Wait_(5);
	SurpriseDisp(rena, 0.6);								//�u!�v
	local pos = Vec3(0, 1, 0);
	efc_player = SurpriseDispSetOffset(player, pos, 0.7);
	SetMotion_(rena, rena_attack_start_L,  BLEND_XL);		// �U���J�nL
	Wait_(2);
	SetMotion_(player, player_caution01_L, BLEND_L);		// �x��L
	Wait_(53);
	StopLoopSE_(30);
	StartDecayEarthQuake_(30, 3, 0.5);
	Wait_(30);


	// ���J�b�g�V���}�U�[�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);		// ������
	SetDir_(antibody, 180);
	efc_antibody1 = SetPosWorldEffect_("ef861_04_m_vomit", GetPos_(antibody));
	PlaySE_("SE_DEM_151");									//M�R�̂��͂������
	Wait_(60);
	SetPointPos_(player, "player001");
	SetMotion_(rena, rena_guard, BLEND_N);		// �K�[�h
	SetFace_(rena, "Face_loop_close");


	// ���J�b�g�W�����i�[�e�K���������`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	efc_rena = SetSelectBoneEffect_("ef732_27_shock_wave01", rena, ATTACH_EFFECT1);
	PlayLoopSE_("SE_DEM_013");
	StartEarthQuake_(-1, 3, 0.5);
	SetMotion_(rena, rena_weaken, BLEND_M);				// �e����΂���遨���
	task_rena = Task_AnimeMoveNoDir_(rena, "anm_rena000");

	SetMotion_(player, player_guard_L, BLEND_M);	// �g�\����
	SetFace_(player, "Face_loop_close");

	//===============================================
	// �����i�[�e
	// �u�c�c�����I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_050");
	StopEarthQuake_();
	StopLoopSE_(15);
	StartDecayEarthQuake_(15, 3, 0.5);
	Wait_(70);
	CloseMsgWnd_();
	//===============================================

	SetFace_(player, "Face_default");
	SetMotion_(player, player_guard_turn, BLEND_L);		// �g�\���遨�U�����
	WaitMotion(player);
	SetMotion_(player, player_guard_turn_L, BLEND_M);	// �g�\���U�����L
	DeleteTask_(task_rena);


	// ���J�b�g�X����l���A���i�[�e�����΂��`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");				// 20F

	SetMotionSpeed_(player, 0.8);
	SetMotion_(player, player_run_battle, BLEND_M);
	task_player = Task_AnimeMoveNoDir_(player, "anm_player000");
	for (local i=1; i <= 20; i++) {
		SetDir_(player, GetDir_(player) + 1.5);
		Wait_(1);
	}
	SetMotionSpeed_(player, 1.0);
	SetMotion_(player, player_battle_L, BLEND_M);		// �퓬�ҋ@L
	Wait_(69);
	SetMotion_(rena, rena_weaken_L, BLEND_M);			// ���L
	Wait_(18);
	SetFace_(rena, "Face_default");		// 150F��ɖڂ��J����
	Wait_(45);
	PlaySE_("SE_DEM_152");									//�K���r���X�������
	SetAlpha_(grbrs, ALPHA_EXIST);
	SetMotion_(grbrs, grbrs_grow, BLEND_N);		// �}�U�[����o�Ă���
	SetVisible(beto, true);
	SetMotion_(beto, beto_grow, BLEND_N);
	efc_grbrs = SetSelectBoneEffect_("ef861_05_galvirus_appear01", grbrs, ATTACH_GLOBAL);
	task_grbrs = Task_ChangeMotion_(grbrs, grbrs_grow_L, BLEND_M);
	DeleteEffect_(efc_cam);
	DeleteTask_(task_cam);
	bone_efc0 = SetSelectBoneEffectSetBoneName_("ef861_08_galvirus_appear04", grbrs, "R_Finger1_03", Vec3(0.0, 0.0, 0.0));
	bone_efc1 = SetSelectBoneEffectSetBoneName_("ef861_08_galvirus_appear04", grbrs, "R_Finger2_03", Vec3(0.0, 0.0, 0.0));
	bone_efc2 = SetSelectBoneEffectSetBoneName_("ef861_08_galvirus_appear04", grbrs, "R_Finger3_03", Vec3(0.0, 0.0, 0.0));
	bone_efc3 = SetSelectBoneEffectSetBoneName_("ef861_16_galvirus_appear06", beto, "Effect_up_mouth", Vec3(0.0, 0.0, 0.0));
	SetEffectFrame_(bone_efc1, 10);
	SetEffectFrame_(bone_efc2, 20);


	// ���J�b�g10���K���r���X�o��`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");				// 170F

	WaitMotion(grbrs);
	SetMotion_(grbrs, grbrs_grow_L, BLEND_M);
	SetMotion_(beto, beto_grow_L, BLEND_M);
	WaitTask(task_cam);
	PlayBgm_("BGM_007");

	//===============================================
	// *�K���r���X
	// �u�ɂ�͂͂́I�@�ɂ��������ˁB
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_611_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_grbrs);
	SetAlpha_(player, ALPHA_CLEAR);


	// ���J�b�g11�����i�[�e�Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");			// 8F
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����

	//===============================================
	// �����i�[�e
	// �u�ȁc�c�Ȃ�Ȃ́c�c����́c�c�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------

	DeleteTask_(task_cam);
	DeleteEffect_(efc_cam);


	// ���J�b�g12���K���r���X�Y�[���C���`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");				// 300F

	//===============================================
	//  �K���r���X
	// �u�ɂ�͂͂́I�@�{�N���@�Ȃ�Ȃ̂����āH
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_611_MSG_080");
	KeyInputWait_();
	//-----------------------------------------------
	// *�K���r���X
	// �u�c�c���ā@�}�f���������@���E�̔����J��
	//-----------------------------------------------
	ShowMsg_("DEMO_611_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();


	// ���J�b�g13���ߋ���z�`�`�`�`�`�`�`�`�`�`�`�`

	SetLayoutAnime_("ev611_00_loop", true);//�ߋ���z�J�n
	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	Wait_(45);

	//===============================================
	// *�K���r���X
	// �u�₪�ăJ���}�b�\�́@���郂���X�^�[�}�X�^�[��
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_611_MSG_100");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u���ӂ́@�}�f�ɏh���ā@���E�ւƊg�U�B
	//-----------------------------------------------
	ShowMsg_("DEMO_611_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetLayoutAnime_("ev611_00_out", false);//�ߋ���z�I��

	WaitLayoutAnime();
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_EXIST);
	SetMotion_(player, player_battle01_L, BLEND_N);
	SetDir_(player, 15);


	// ���J�b�g14����l���ƃ��i�[�e�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);
	Wait_(20);

	//===============================================
	// �����i�[�e
	// �u����ȁc�c�}�U�[�𓮂����@�}�f�����C�g�̒���
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	// ���J�b�g15���K���r���X�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	//===============================================
	// *�K���r���X
	// �u�����I�@���������o����@�}�U�[�̃`�J����
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_611_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteEffectEmitter_(bone_efc0);
	DeleteEffectEmitter_(bone_efc1);
	DeleteEffectEmitter_(bone_efc2);
	DeleteEffectEmitter_(bone_efc3);


	// ���J�b�g16���K���r���X�A�}�U�[���痎����`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");				// 450F

	PlaySE_("SE_DEM_153");													//�K���r���X���S�����痎����
	efc_grbrs = SetSelectBoneEffect_("ef861_06_galvirus_appear02", grbrs, ATTACH_GLOBAL);
	SetSelectBoneEffectSetBoneName_("ef861_18_galvirus_appear08", grbrs, "Waist_Root", Vec3(0.0, 0.0, 0.0));
	SetMotion_(grbrs, grbrs_born, BLEND_M);
	SetMotion_(beto, beto_born, BLEND_M);
	SetMotion_(ground, MOT_GIMMICK_1, BLEND_N);
	Wait_(280);
	PlaySE_("SE_DEM_154");													//�K���r���X�������オ��
	Wait_(120);
	SetSelectBoneEffectSetBoneName_("ef861_17_galvirus_appear07", grbrs, "Hip2", Vec3(0.0, 0.0, 0.0));
	Wait_(20);
	task_grbrs = Task_RotateToDir_(grbrs, -160, 1);
	task_beto = Task_RotateToDir_(beto, -160, 1);
	Wait_(10);
	SetMotion_(grbrs, MOT_SPELL_ACTUATE, BLEND_XL);
	SetMotion_(beto, beto_m_attack, BLEND_XL);
	Wait_(35);
	StartEarthQuake_(9, 3, 3);

	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
	SetMotionSpeed_(grbrs, 0.1);
	SetMotionSpeed_(beto, 0.1);

	//===============================================
	// *�K���r���X
	// �u�{�N�́@�J���}�b�\�̈��ӂ���@���܂ꂵ�ҁB
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_611_MSG_140");
	bone_efc0 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "R_Mouth7", Vec3(0.0, 0.0, 0.0));
	bone_efc1 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "R_Mouth9", Vec3(0.0, 0.0, 0.0));
	bone_efc2 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "L_Mouth4", Vec3(0.0, 0.0, 0.0));
	bone_efc3 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "L_Mouth12", Vec3(0.0, 0.0, 0.0));
	Wait_(75);
	efc_grbrs = SetSelectBoneEffectSetBoneName_("ef861_07_galvirus_appear03", beto, "Effect_lo_mouth", Vec3(0.0, 0.0, 0.0));
	SetMotion_(grbrs, MOT_WAIT, BLEND_XL);
	SetMotion_(beto, MOT_WAIT, BLEND_XL);
	SetMotionSpeed_(grbrs, 1.0);
	SetMotionSpeed_(beto, 1.0);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteEffect_(efc_cam);
	DeleteTask_(task_grbrs);

	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");				// 170F

	WaitTask(task_cam);
	Wait_(50);
	SetAlpha_(player, ALPHA_CLEAR);
	SetPointPos_(grbrs, "npc_grbrs001");
	SetPointPos_(beto, "npc_grbrs001");


	// ���J�b�g17���K���r���X�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye008");
	SetPointCameraTarget_("camtgt008");

	//===============================================
	// ���K���r���X
	// �u�}�U�[���@�򉻂Ȃ�Ă����Ȃ���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUBIRUSU");
	ShowMsg_("DEMO_611_MSG_160");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u�{�N�́@�J���}�b�\���������@���ׂĂ𒴉z����
	//-----------------------------------------------
	ShowMsg_("DEMO_611_MSG_170");
	KeyInputWait_();
	//-----------------------------------------------
	// ��
	// �u���̎ז��́@�����Ȃ�����I�I
	//-----------------------------------------------
	ShowMsg_("DEMO_611_MSG_180");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteEffectEmitter_(efc_grbrs);

	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");				// 60F�K���r���X���K

	task_beto = Task_ObjectFadeOut_(beto, 60);
	SetMotion_(grbrs, grbrs_shout, BLEND_M);		// �ҋ@�����K���ҋ@
	SetMotion_(beto, beto_shout, BLEND_M);
	PlaySE_("SE_DEM_155");
	Wait_(55);
	bone_efc0 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "R_Mouth7", Vec3(0.0, 0.0, 0.0));
	bone_efc1 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "R_Mouth9", Vec3(0.0, 0.0, 0.0));
	bone_efc2 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "L_Mouth4", Vec3(0.0, 0.0, 0.0));
	bone_efc3 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "L_Mouth12", Vec3(0.0, 0.0, 0.0));
	bone_efc4 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "Down_Mouth2", Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(bone_efc4, 3.0);
	Wait_(15);

	EncountEndDemo(ENCOUNT_BOSS);
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�G�t�F�N�g�T�C�Y�����X�ɕύX
//
//----------------------------------------------------------------------------
//	����	: efc			�G�t�F�N�g�h�c
//			: start_size	�����G�t�F�N�g�T�C�Y
//			: end_size		�ŏI�G�t�F�N�g�T�C�Y
//			: frm			�t���[����
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uChangeEffectScale(efc, start_size, end_size, frm)
{
	local change_size;		// �P�t���[���ŕύX����T�C�Y

	change_size = (end_size - start_size) / frm;		// (�ŏI�T�C�Y �| �����T�C�Y) �� �t���[����

	for (local i=1; i<=frm; i++) {
		SetEffectScale_(efc, start_size + (change_size * i));
		Wait_(1);
	}

	SetEffectScale_(efc, end_size);
}
