//=============================================
//
//		demo829[���i�[�e�̉��]
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
	local task_cam, task_player, task_rena, task_aroma, task_seed;
	local task_aroma_step;
	local efc_cam, efc_player, efc_rena, efc_aroma, efc_seed000, efc_seed001;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_core000 = ReadGimmick_("o_C03_02");	// �}�U�[
	local model_core100 = ReadGimmick_("o_C03_03");	// �}�U�[����
	local model_case000 = ReadGimmick_("o_C03_01");	// �R�[���h�X���[�v�̃P�[�X(�J�E�ҋ@)
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_rena = ReadNpc_("n007");			// ���i�[�e
	local model_aroma = ReadNpc_("n018");			// �A���}
	local model_regi_m = ReadNpc_("n012");			// ���W�X�^���X �j��
	local model_regi_f = ReadNpc_("n013");			// ���W�X�^���X ����
	local model_man = ReadNpc_("n015");				// �j
	local model_woman = ReadNpc_("n016");			// ��
	local model_child = ReadNpc_("n017");			// �q��
	// �G�t�F�N�g
	LoadEffect_("ef732_26_star_seed_base02");		// �X�^�[�V�[�h �x�[�X02
	LoadEffect_("ef732_13_light_reactor01");		// ���A�N�^�[�̌�(�܂Ԃ���)
	LoadEffect_("ef710_05_cha_light_ren");			// ���i�[�e�̌�
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef712_01_emo_notice01");			// �C�Â�
	LoadEffect_("ef733_01_sym_shuchusen01");		// �W����

	local baseResId = ReadGimmick_("o_effect_base");
	local baseObj000 = ArrangePointGimmick_("o_effect_base", baseResId, "efc_seed000");
	local baseObj001 = ArrangePointGimmick_("o_effect_base", baseResId, "efc_seed001");

// ���z�u
	// �}�U�[
	local core000 = ArrangePointGimmick_("o_C03_02", model_core000, "obj_core000");
	SetMotion_(core000, MOT_GIMMICK_1, BLEND_N);
	local core100 = ArrangePointGimmick_("o_C03_03", model_core100, "obj_core000");

	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetPointPosNoFit_(rena, "obj_core000");
	SetFace_(rena, "Face_loop_close");
	// �A���}
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	// ���W�X�^���X �j��
	local regi_m = ArrangePointNpc_(model_regi_m, "npc_woman000");
	// ���W�X�^���X ����
	local regi_f = ArrangePointNpc_(model_regi_f, "npc_child000");
	// ��
	local woman = ArrangePointNpc_(model_woman, "npc_woman000");
	// �q��
	local child = ArrangePointNpc_(model_child, "npc_child000");

// ����풓���[�V�����Ǎ�
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");		// ������ҋ@L
	local player_romance = ReadMotion_(player, "Player_romance");			// ���i�[�e�̉��ł��Ⴊ��
	local player_romance_L = ReadMotion_(player, "Player_romance_L");		// ���i�[�e�̉��ł��Ⴊ��L
	local player_romance02_L = ReadMotion_(player, "Player_romance02_L");	// ���i�[�e�̉��ł��Ⴊ��02L�i��̌�����������ɂȂ�j
	local Player_romance03_L = ReadMotion_(player, "Player_romance03_L");	// ���i�[�e�̉��ł��Ⴊ��03L�i�A���}�̕��������j
	local player_stand_up = ReadMotion_(player, "Player_stand_up");			// ���i�[�e���N���オ�点��
	local player_stand_up_L = ReadMotion_(player, "Player_stand_up_L");		// ���i�[�e���N���オ�点��L
	
	local rena_romance = ReadMotion_(rena, "n007_romance");					// �}�U�[������
	local rena_romance_L = ReadMotion_(rena, "n007_romance_L");				// ��l���̉��Ŏ��i�牺�����j
	local rena_romance02_L = ReadMotion_(rena, "n007_romance02_L");			// ��l���̉��Ŏ��i�������j
	local rena_stand_up = ReadMotion_(rena, "n007_stand_up");				// ��l���ƂƂ��ɋN���オ��
	local rena_talk01 = ReadMotion_(rena, "n007_talk01");					// ��b�J�n�i������ɂ��Ă�j
	local rena_talk01_L = ReadMotion_(rena, "n007_talk01_L");				// ��bL�i������ɂ��Ă�j
	local rena_mother_L = ReadMotion_(rena, "n007_mother_L");				// �}�U�[�̒��̃��i�[�e

	local aroma_look_up_L = ReadMotion_(aroma, "n018_look_up_L");			// ������ҋ@L
	local aroma_look_down_L = ReadMotion_(aroma, "n018_look_down_L");		// �������ҋ@L
	local aroma_look_right_L = ReadMotion_(aroma, "n018_look_right_L");		// �E�����ҋ@L
	local aroma_run_L = ReadMotion_(aroma, "n018_run_L");					// ����L
	local aroma_guard_L = ReadMotion_(aroma, "n018_guard_L");				// �\����L
	local aroma_angry = ReadMotion_(aroma, "n018_angry");					// �{��
	local aroma_angry_L = ReadMotion_(aroma, "n018_angry_L");				// �{��L

	local n012_cold_L = ReadMotion_(regi_m, "n012_cold_L");					// �R�[���h����L	
	local n013_cold_L = ReadMotion_(regi_f, "n013_cold_L");					// �R�[���h����L
	local n016_cold_L = ReadMotion_(woman, "n016_cold_L");					// �R�[���h����L
	local n017_cold_L = ReadMotion_(child, "n017_cold_L");					// �R�[���h����L

// ���������[�V����
	SetMotion_(rena, rena_mother_L, BLEND_N);
	SetMotion_(player, player_look_up_L, BLEND_N);
	SetMotion_(aroma, aroma_look_up_L, BLEND_N);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 150F
	DeleteTask_(task_cam);

	efc_seed000 = SetSelectBoneEffect_("ef732_26_star_seed_base02", baseObj000, ATTACH_GLOBAL);
	task_seed = Task_AnimeMoveNoFit_(baseObj000, "anm_seed000");	// 150F
	DeleteTask_(task_seed);


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	//��������������������������������������
	//���J�b�g1
	//��������������������������������������
	
	PlaySE_("SE_DEM_227");
	StartDemo(FADE_COLOR_BLACK);
	
	task_seed = Task_AnimeMoveNoFit_(baseObj000, "anm_seed000");	// 150F
	Wait_(5);

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 70F

	WaitTask(task_cam);
	Wait_(10);
	DeleteTask_(task_seed);
	ChangeColorTone_(1.0, 0.0, 1.0, 1);								//�F���␳�u���v
	SetEffectScale_(efc_seed000, 0.5);


	//��������������������������������������
	//���J�b�g2 �ǉ��J�b�g ���i�A�b�v
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");		// 150F

	task_seed = Task_AnimeMoveNoFit_(baseObj000, "anm_seed003");	// 120F
	Wait_(85);
	WaitTask(task_seed);
	WaitTask(task_cam);
	efc_seed001 = SetSelectBoneEffect_("ef732_13_light_reactor01", baseObj000, ATTACH_GLOBAL);
	SetEffectScale_(efc_seed001, 0.5);
	Wait_(5);

	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	WaitFade_();

	DeleteEffect_(efc_seed000);
	DeleteEffect_(efc_seed001);
	ChangeColorTone_(0.0, 0.0, 0.0, 1);
	SetPointPosNoFit_(rena, "npc_rena000");

	efc_rena = SetSelectBoneEffectSetBoneName_("ef710_05_cha_light_ren", rena, "Waist", Vec3(0.0, -9.5, -0.5));

	efc_seed001 = SetSelectBoneEffectSetBoneName_("ef732_13_light_reactor01", rena, "Waist", Vec3(0.0, -1.0, 7.5));
	SetEffectScale_(efc_seed001, 3.6);
	Wait_(40);


	//��������������������������������������
	//���J�b�g3
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 120F

	SetMotion_(rena, rena_romance, BLEND_N);
	SetMotionSpeed_(rena, 0.005);
	PlaySE_("SE_DEM_228");
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 90);
	WaitFade_();
	Wait_(5);
	DeleteEffectEmitter_(efc_seed001);

	Wait_(20);
	SetMotionSpeed_(rena, 0.07);
	Wait_(10);
	SetMotionSpeed_(rena, 0.10);
	Wait_(10);
	SetMotionSpeed_(rena, 0.15);
	Wait_(10);
	SetMotionSpeed_(rena, 0.20);
	Wait_(10);
	SetMotionSpeed_(rena, 0.25);
	Wait_(10);
	SetMotionSpeed_(rena, 0.28);

	WaitTask(task_cam);
	SetMotion_(rena, MOT_WAIT, BLEND_N);


	//��������������������������������������
	//���J�b�g4
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 180F

	SetMotion_(rena, rena_romance, BLEND_N);
	SetMotionSpeed_(rena, 0.4);
	task_rena = Task_AnimeMoveNoFit_(rena, "anm_rena001");	// 190F
	task_player = Task_AnimeMove_(player, "anm_player000");	// 50F
	task_aroma = Task_AnimeMove_(aroma, "anm_aroma000");	// 50F
	DeleteTask_(task_player);
	DeleteTask_(task_aroma);
	Wait_(150);
	DeleteEffectEmitter_(efc_rena);
	WaitTask(task_cam);
	WaitTask(task_rena);

	SetMotionSpeed_(rena, 0.9);
	WaitMotion(rena);
	SetMotion_(rena, rena_romance_L, BLEND_M);

	Wait_(10);
	task_player = Task_AnimeMoveSetMotion_(player, "anm_player000", MOT_RUN, MOT_WAIT);		// 30F
	task_aroma = Task_AnimeMoveSetMotion_(aroma, "anm_aroma000", aroma_run_L, MOT_WAIT);	// 30F
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 8);
	Wait_(4);

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 25);
	WaitFade_();
	SetMotionSpeed_(aroma, 1.0);
	SetMotionSpeed_(player, 1.0);
	DeleteTask_(task_aroma);
	DeleteTask_(task_player);
	DeleteTask_(task_aroma_step);
	Wait_(35);

	SetPointPos_(player, "player001");
	SetPointPos_(rena, "npc_rena001");
	SetPointPos_(aroma, "npc_aroma001");
	Wait_(30);

	SetMotion_(rena, rena_romance_L, BLEND_N);
	SetMotionSpeed_(rena, 1.0);
	SetMotion_(aroma, aroma_look_down_L, BLEND_N);
	SetMotion_(player, player_romance, BLEND_N);
	SetMotionSpeed_(player, 1.5);
	task_player = Task_ChangeMotion_(player, player_romance_L, BLEND_S);
	Wait_(5);
	SetMotionSpeed_(player, 0.8);


	//��������������������������������������
	//���J�b�g5
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	// 210F

	SetFace_(rena, "Face_loop_close");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(48);
	SetMotion_(rena, rena_romance02_L, 30);
	Wait_(10);
	SetFace_(rena, "Face_eyes_close");
	Wait_(10);
	SetMotion_(player, player_romance02_L, 18);
	SetMotionSpeed_(player, 1.0);
	Wait_(45);

	//===============================================
	// �����i�[�e
	// �u���c�c��c�c�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_829_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(15);
	DeleteTask_(task_player);


	//��������������������������������������
	//���J�b�g6
	//��������������������������������������
	SetFace_(rena, "Face_default");
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	Wait_(10);

	//===============================================
	// ���A���}
	// �u�c�c�Q�ڂ��Ă�́H�@�A�^�V�̂��Ƃ�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);


	//��������������������������������������
	//���J�b�g7
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(15);

	//===============================================
	// �����i�[�e
	// �u�c�c���Ȃ��́@�A���}�E�Q�u�Y�����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_829_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	
	//��������������������������������������
	//���ǉ��J�b�g1 My name is Gevuzrin
	//��������������������������������������
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(rena, ALPHA_CLEAR);
	
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");
	DeleteTask_(task_cam);
	
	SetMotion_(aroma, aroma_angry, BLEND_L);
	Wait_(10);
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");
	
	PlaySE_("SE_DEM_001");													// ���ėp�E�吺�̉��o
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// �W����
	Wait_(10);
	
	WaitMotion(aroma);
	SetMotion_(aroma, aroma_angry_L, BLEND_L);

	//===============================================
	// ���A���}
	// �u�Q�u�Y�������ā@�����Ȃ��I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_032");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	DeleteEffect_(efc_cam);
	SetAlpha_(player, ALPHA_EXIST);
	SetAlpha_(rena, ALPHA_EXIST);
	
	//��������������������������������������
	//���ǉ��J�b�g2 ��@���i�[�e�u�I�v
	//��������������������������������������
	SetAlpha_(aroma, ALPHA_CLEAR);
	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");
	Wait_(4);	
	PlaySE_("SE_DEM_053");																// SE�u�s���b�I�v
	efc_rena = SetPointWorldEffect_("ef712_10_emo_surprise01", "efc_rena000");			//�u�I�v�����[�V�����̓s���ɂ��Blender�Őݒu
	efc_player = SetPointWorldEffect_("ef712_10_emo_surprise01", "efc_player000");		//�u�I�v�����[�V�����̓s���ɂ��Blender�Őݒu
	SetEffectScale_(efc_rena, 0.4);
	SetEffectScale_(efc_player, 0.4);
	
	SetMotion_(player, Player_romance03_L, BLEND_M);						//��@�A���}�̕�������
	
	WaitTask(task_cam);
	Wait_(60);
	SetAlpha_(aroma, ALPHA_EXIST);

	//��������������������������������������
	//���ǉ��J�b�g3 ���ׂ����
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");
	WaitTask(task_cam);
	Wait_(90);

	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���ǉ��J�b�g4 �A���}�@�A�b�v
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");
	Wait_(30);
	efc_aroma = SetSelectBoneEffectSetOffset_("ef712_01_emo_notice01", aroma, ATTACH_EFFECT1, Vec3(0.0, 0.0, 0.0));		//�C�Â�ef
	SetMotion_(aroma, aroma_guard_L, BLEND_L);								//�A���}�x���u�̓b�I�H�v���Ċ�����

	//===============================================
	// ���A���}
	// �u�c�c�͂��I
	// �@�ف@�{�����Ă΂��́@�����Ȃ̂�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_034");
	KeyInputWait_();
	//===============================================
	SetMotion_(aroma, MOT_TALK, BLEND_L);
	//===============================================
	// ���A���}
	// �u�Ƃ������I�@�A�^�V�́@�����ɂ�
	// �@���L���搶�́@��Ԓ�q�������@�A���}��
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_036");
	WaitMotion(aroma);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ���A���}
	// �u�����ā@���W�X�^���X�̃��[�_�[������
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_aroma);
//	SetMotion_(aroma, aroma_look_down_L, BLEND_XL);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(30);
	SetMotionSpeed_(aroma, 1.0);
	//��������������������������������������
	//���ǉ��J�b�g5 ���i�@�A�b�v
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	DeleteTask_(task_cam);
	
	SetMotion_(rena, rena_romance_L, 14);
	Wait_(15);
	//===============================================
	// �����i�[�e
	// �u�����c�c���L�����@�G�C���A�X�������̂ˁc�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_829_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);

	//��������������������������������������
	//���J�b�g8
	//��������������������������������������

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	Wait_(10);
	SetMotionSpeed_(aroma, 0.8);
	SetMotion_(aroma, MOT_TALK, BLEND_L);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	Wait_(20);
	SetMotionSpeed_(aroma, 1.0);

	//===============================================
	// ���A���}
	// �u�܂��c�c�F�X�Ɓ@��������ĂˁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_060");
	KeyInputWait_();
	//===============================================
	// ���A���}
	// �u���Ă����c�c�Ȃ�Ƃ��@�A���^�����������ǁc�c
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_070");
	KeyInputWait_();
	DeleteTask_(task_aroma);
	SetMotion_(aroma, aroma_look_down_L, 16);
	//===============================================
	// ���A���}
	// �u�_�[�N�}�X�^�[�̌��́@�������Ɂ@�\�z�O�łˁB
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);

	//��������������������������������������
	//���J�b�g9
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");	// 130F

	DeleteTask_(task_cam);
	SetMotion_(player, player_romance_L, BLEND_XL);
	SetActive_(aroma, false);
	Wait_(30);

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");	// 130F

	SetMotion_(player, player_stand_up, BLEND_L);
	task_player = Task_ChangeMotion_(player, player_stand_up_L, BLEND_M);
	SetMotion_(rena, rena_stand_up, BLEND_L);
	SetMotionSpeed_(player, 0.75);
	SetMotionSpeed_(rena, 0.75);
	WaitMotion(rena);
	SetMotionSpeed_(player, 1.0);
	SetMotionSpeed_(rena, 1.0);
	SetMotion_(rena, rena_talk01, BLEND_L);
	WaitMotion(rena);
	SetMotion_(rena, rena_talk01_L, BLEND_M);

	//===============================================
	// �����i�[�e
	//�u�c�c���v�̂悤����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_829_MSG_090");
	KeyInputWait_();
	//===============================================
	// �����i�[�e
	// �u���肪�Ƃ��c�c<name_player/>�@�A���}�B
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, 12);
	Wait_(40);
	SetActive_(aroma, true);
	DeleteTask_(task_cam);
	DeleteTask_(task_player);


	//��������������������������������������
	//���J�b�g10
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");	// 210F

	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(aroma, MOT_WAIT, BLEND_N);
	SetPointPos_(player, "player002");
	SetPointPos_(rena, "npc_rena002");
	Wait_(20);
	SetMotionSpeed_(aroma, 0.8);
	SetMotion_(aroma, MOT_TALK, BLEND_L);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	Wait_(20);
	SetMotionSpeed_(aroma, 1.0);

	PlayBgm_("BGM_001");
	//===============================================
	// ���A���}
	// �u���N�@���ɐ킢�����Ă������u��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_110");
	KeyInputWait_();
	//===============================================
	// ���A���}
	// �u����Ɂ@�]�������Ă̏����Ȃ�ā@�S������B
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_120");
	KeyInputWait_();
	//===============================================
	// ���A���}
	// �u����Ɂc�c�}�U�[���@�ǂ��ɂ����Ȃ���
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_aroma);
	SetMotion_(aroma, MOT_WAIT, 12);
	Wait_(25);
	SetMotion_(aroma, aroma_look_right_L, 12);
	Wait_(40);
	WaitTask(task_cam);
	Wait_(30);
	SetMotion_(child, n017_cold_L, BLEND_N);
	SetMotion_(woman, n016_cold_L, BLEND_N);
	SetMotion_(regi_f, n013_cold_L, BLEND_N);
	SetMotion_(regi_m, n012_cold_L, BLEND_N);


	//��������������������������������������
	//���J�b�g11
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");	// 260F

	Wait_(30);

	//===============================================
	// ���A���}
	// �u�ނ�́@�R�[���h�X���[�v�����܂�
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(30);


	//��������������������������������������
	//���J�b�g12
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetActive_(player, false);
	SetActive_(rena, false);
	SetDir_(aroma, -110);
	SetMotion_(aroma, aroma_look_right_L, BLEND_N);

	//===============================================
	// ���A���}
	// �u�ނ���c�c�����Ԃ�҂����Ă��܂�����ˁc�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WALK, 10);
	task_aroma = Task_RotateToDir_(aroma, 0, 2.85);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	WaitTask(task_aroma);
	DeleteTask_(task_aroma_step);

	SetMotionSpeed_(aroma, 0.8);
	SetMotion_(aroma, MOT_TALK, 10);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	Wait_(20);
	SetMotionSpeed_(aroma, 1.0);
	SetFace_(aroma, "Face_smile");
	//===============================================
	// ���A���}
	// �u�����I�@���ꂩ��́@�Z�����Ȃ���H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_160");
	KeyInputWait_();
	//===============================================
	// ���A���}
	// �u���񂽂����ɂ��@�������񓭂��Ă��炤��I
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_aroma);
	SetMotion_(aroma, MOT_WAIT, 10);
	Wait_(35);

	EndDemo(FADE_COLOR_BLACK);
}
