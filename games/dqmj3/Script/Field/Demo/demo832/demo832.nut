//=============================================
//
//		demo832[�A���}�Ƃ̕ʂ�]
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
	local task_cam, task_player, task_aroma, task_rena, task_man, task_woman, task_base00, task_base01, task_base02;
	local efc_player, efc_rena, efc_pod00, efc_pod01, efc_pod02;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_rena = ReadNpc_("n007");				// ���i�[�e
	local model_aroma = ReadNpc_("n018");				// �A���}
	local model_man = ReadNpc_("n021");					// ���W�X�^���X��
	local model_woman = ReadNpc_("n023");				// ���W�X�^���X��
	
	// �G�t�F�N�g
	LoadEffect_("EF712_10_EMO_SURPRISE01");				// �т�����
	LoadEffect_("ef732_25_star_seed_base01");			// �X�^�[�V�[�h�x�[�X�@�����O
	LoadEffect_("ef883_04_flying_pod01");				// �t���C���O�|�b�h�O��
	LoadEffect_("ef883_05_flying_pod02");				// �t���C���O�|�b�h����
	LoadEffect_("ef883_06_flying_pod03");				// �t���C���O�|�b�h�̂܂Ԃ�����
	
	// �M�~�b�N
	local model_base = ReadGimmick_("o_effect_base");	// �G�t�F�N�g�x�[�X
	local model_pod = ReadGimmick_("o_U00_02");			// �E�o�|�b�h
	local model_alias = ReadGimmick_("o_U00_11");		// �G�C���A�X���u

	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetStepSe_(player, SILENT_STEP_SE);
	//���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetStepSe_(rena, SILENT_STEP_SE);
	//�A���}
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	
	//���W�X�^���X
	local man = ArrangePointNpc_(model_man, "npc_man000");					//��
	SetStepSe_(man, SILENT_STEP_SE);
	local woman = ArrangePointNpc_(model_woman, "npc_woman000");			//��
	SetStepSe_(woman, SILENT_STEP_SE);

	
	//�M�~�b�N
	local base00 = ArrangePointGimmick_("o_effect_base", model_base, "efc_base000");					//�G�t�F�N�g�x�[�X1
	local base01 = ArrangePointGimmick_("o_effect_base", model_base, "efc_base001");					//�G�t�F�N�g�x�[�X2
	local base02 = ArrangePointGimmick_("o_effect_base", model_base, "efc_base002");					//�G�t�F�N�g�x�[�X3

	
	local pod00 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod000");							//�E�o�|�b�h�R��
	local pod01 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod001");
	local pod02 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod002");
	SetMotion_(pod00, MOT_GIMMICK_2, BLEND_N);															//�J�������
	SetMotion_(pod01, MOT_GIMMICK_2, BLEND_N);
	SetMotion_(pod02, MOT_GIMMICK_2, BLEND_N);
	SetManualCalcAlpha_(pod00, true);																	//���l��L��
	SetManualCalcAlpha_(pod01, true);
	SetManualCalcAlpha_(pod02, true);
	
		
// ����풓���[�V�����Ǎ�
	//��l��
	local player_look_up = ReadMotion_(player, "Player_look_up_L");								//������ҋ@L
	local player_nod = ReadMotion_(player, "Player_nod");										//���ȂÂ�
	local player_left = ReadMotion_(player, "Player_look_left_L");								//��������
	local player_talk = ReadMotion_(player, "Player_talk");										//�b��
	local player_talk_L = ReadMotion_(player, "Player_talk_L");									//�b��L
	local player_nod2 = ReadMotion_(player, "Player_nod02");									//���������
	local player_walk_up = ReadMotion_(player, "Player_walk_up_L");								//���������L

	//���i�[�e
	local rena_look_up = ReadMotion_(rena, "n007_look_up_L");									//������ҋ@L
	local rena_talk = ReadMotion_(rena, "n007_talk01_L");										//���i�b��
	local rena_look_down_L = ReadMotion_(rena, "n007_look_right_L");							//���i�E�����ҋ@
	local rena_nod = ReadMotion_(rena, "n007_nod");												//���i���ȂÂ�
	local rena_look_up02 = ReadMotion_(rena, "n007_look_up02_L");								//���i������ҋ@02L

	//�A���}
	local aro_look_right_L = ReadMotion_(aroma, "n018_look_right_L");							//�E�����ҋ@L
	local aro_look_left_L = ReadMotion_(aroma, "n018_look_left_L");								//�������ҋ@L
	local aro_look_up_L = ReadMotion_(aroma, "n018_look_up_L");									//������ҋ@L
	local aro_look_down_L = ReadMotion_(aroma, "n018_look_down_L");								//�������ҋ@L
	local aro_stretch = ReadMotion_(aroma, "n018_stretch");										//�X�g���b�`
	local aro_star_L = ReadMotion_(aroma, "n018_star_seed_L");									//�X�^�[�V�[�h�����i�b�����[�V�����̃p�^�[���ǉ��j
	local aro_sit_L = ReadMotion_(aroma, "n018_sit_L");											//�|�b�h�ɍ���L	�|�b�h�̈֎q�ɍ���B���|�b�h�Ɠ������W�ɔz�u
	local aro_sit_left_L = ReadMotion_(aroma, "n018_sit_left_L");								//�|�b�h�ɍ���L�i�������j
	local aro_operate_L = ReadMotion_(aroma, "n018_operation_L");								//�|�b�h����L
	local aro_sit_left_nod = ReadMotion_(aroma, "n018_sit_left_nod");							//�|�b�h�ɍ��肤�ȂÂ�
	
// ���������[�V����
	SetMotion_(rena, rena_talk, BLEND_N);														//���i�E�A���}�Ȃ񂩘b���Ă���
	SetMotion_(aroma, aro_star_L, BLEND_N);
	
// ���J�����ݒ�
	local density = GetFogDensity_();
	SetFogDensity_(5.0);
	local distmax = GetFogDistMax_();
	SetFogDistMax_(10000.0);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);
	//��������������������������������������
	//���J�b�g1 �E�o�|�b�h���ږ������ړ�
	//��������������������������������������
	Wait_(210);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(20);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);					//���i�@�E�ҋ@


	task_man = Task_WalkAroundToDir(man, 0, 5.7);			//�ږ������ړ�
	WaitTask(task_man);
	task_man = Task_MoveForward_(man, 0.9, false);
//	SetMotionSpeed_(woman, 0.7); 
	task_woman = Task_WalkAroundToDir(woman, 0, 5.7);
	WaitTask(task_woman);
	task_woman = Task_MoveForward_(woman, 0.7, false);
	Wait_(20);
	MotionTalk(aroma);										//�A���}�Ȃ񂩘b��
	Wait_(40);
	
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	
	SetMotion_(player, player_nod, BLEND_XL);				//��@���ȂÂ�
	SetMotion_(rena, rena_nod, BLEND_XL);					//���i�@���ȂÂ�
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	WaitMotion(rena);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);	
	
	SetMotion_(man, MOT_WAIT, BLEND_N);
	SetMotion_(woman , MOT_WAIT, BLEND_N);
	DeleteTask_(task_man);
	DeleteTask_(task_woman);
	Wait_(50);
	
	task_aroma = Task_WalkAroundToDir(aroma, 90, 5.7);		//�A���}�ړ�
	WaitTask(task_aroma);
	task_aroma = Task_MoveForward_(aroma, 0.8, false);
	
	WaitTask(task_cam);
	Wait_(30);
	//...............................................................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);				//�t�F�[�h�A�E�g
	WaitFade_();
	DeleteTask_(task_aroma);
	DeleteTask_(task_cam);	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//��������������������������������������
	//���J�b�g2 �|�b�h�ɂ̂肱�ރA���}
	//��������������������������������������
	SetPointPos_(player, "player001");
	SetPointPos_(rena, "npc_rena001");
	SetPointPosNoFit_(aroma, "npc_aroma001");
	SetMotion_(aroma, aro_sit_left_L, BLEND_N);				//�A���}��������
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);				//�t�F�[�h�C��
	WaitFade_();
	//...............................................................................................................
	

	SetMotion_(aroma, aro_sit_L, BLEND_XL);
	Wait_(30);
	
	SetMotion_(aroma, aro_operate_L, BLEND_XL);
	Wait_(60);
	
	SetMotionSpeed_(pod00, 0.5);
	SetMotion_(pod00, MOT_GIMMICK_3, BLEND_L); 
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	Wait_(150);
	WaitTask(task_cam);

	//��������������������������������������
	//���J�b�g3 �|�b�h�̒��̃A���}
	//��������������������������������������
	SetMotionSpeed_(pod00, 1.0);
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	Wait_(80);
	StartEarthQuake_(90, 3.5, 0.3)
	Wait_(60);
	
	//...............................................................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);												//�t�F�[�h�A�E�g
	WaitFade_();
	
	//��������������������������������������
	//���J�b�g4 �ł��グ�|�b�h�~3
	//��������������������������������������
	
	local pod03 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod000");				//�E�o�|�b�h�R��i��s�j
	local pod04 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod001");
	local pod05 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod002");
	
	SetMotion_(pod03, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(pod04, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(pod05, MOT_GIMMICK_0, BLEND_N);
	
	local efc_pod03 = SetSelectBoneEffect_("ef883_04_flying_pod01", base00, ATTACH_GLOBAL);	//�|�b�h�̋O��
	SetEffectScale_(efc_pod03, 6.0);
	local efc_pod04 = SetSelectBoneEffect_("ef883_04_flying_pod01", base01, ATTACH_GLOBAL);
	SetEffectScale_(efc_pod04, 6.0);
	local efc_pod05 = SetSelectBoneEffect_("ef883_04_flying_pod01", base02, ATTACH_GLOBAL);
	SetEffectScale_(efc_pod05, 6.0);
	
	local task_anm_player = Task_AnimeMove_(player, "anm_player000");
	SetMotion_(player, MOT_WALK, BLEND_XL);	
	local task_anm_rena = Task_AnimeMove_(rena, "anm_npc_rena000");	
	SetMotion_(rena, MOT_WALK, BLEND_XL);
	
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 60);												//�t�F�[�h�C��
	WaitFade_();
	//...............................................................................................................
	Wait_(60);
	SetMotion_(player, MOT_WAIT, BLEND_XL);	
	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	
	WaitTask(task_cam);
	task_aroma = Task_AnimeMoveNoFit_(pod03, "anm_pod000");
	task_base00 = Task_AnimeMoveNoFit_(base00, "anm_pod000");
	Wait_(10);
	task_man = Task_AnimeMoveNoFit_(pod04, "anm_pod100");
	task_base01 = Task_AnimeMoveNoFit_(base01, "anm_pod100");
	Wait_(10);
	task_woman = Task_AnimeMoveNoFit_(pod05, "anm_pod200");
	task_base02 = Task_AnimeMoveNoFit_(base02, "anm_pod200");
	Wait_(20);
	SetMotion_(player, player_look_up, BLEND_XL);				//��l�ŏ������
	SetMotion_(rena, rena_look_up, BLEND_XL);
	
	Wait_(100);

	//��������������������������������������
	//���J�b�g5 �|�b�h�̒��̃A���}�Q
	//��������������������������������������
	//...............................................................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//�t�F�[�h�A�E�g
	WaitFade_();
	SetMotion_(aroma, aro_sit_L, BLEND_N);
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	StartEarthQuake_(-1, 130, 0.5)
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//�t�F�[�h�C��
	WaitFade_();
	//...............................................................................................................
	Wait_(10);
	SetMotion_(aroma, aro_sit_left_L, BLEND_XL);				//�A���}��������
	
	Wait_(30);
	SetMotion_(aroma, aro_sit_left_nod, BLEND_XL);				//�A���}����
	WaitMotion(aroma);
	SetMotion_(aroma, aro_sit_left_L, BLEND_XL);				//�A���}��������
	Wait_(30);
	SetMotion_(aroma, aro_sit_L, BLEND_XL);						//�A���}�O������
	Wait_(80);

	//��������������������������������������
	//���J�b�g6 ��@���i
	//��������������������������������������
	//...............................................................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//�t�F�[�h�A�E�g
	WaitFade_();
	SetMotion_(player, player_look_up, BLEND_N);
	StopEarthQuake_();
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//�t�F�[�h�C��
	WaitFade_();
	//...............................................................................................................
	SetMotion_(rena, rena_look_up02, 30);						//���i�[�e������ɂ��Ă�B
	
	Wait_(20);
	SetMotion_(player, player_walk_up, BLEND_M);				//��@����O��
	task_player = Task_MoveForward_(player, 1.0, false);
	Wait_(10);
	DeleteTask_(task_player);
	SetMotion_(player, player_look_up, BLEND_XL);
	Wait_(60);
	
	SetMotion_(player, player_nod2, BLEND_XL);					//��@���ȂÂ�
	Wait_(20);
	SetMotion_(player, player_look_up, BLEND_XL);

	Wait_(90);
	//��������������������������������������
	//���J�b�g7 �����Ă䂭�A���}����
	//��������������������������������������
	task_aroma = Task_AnimeMoveNoFit_(pod03, "anm_pod001");
	task_base00 = Task_AnimeMoveNoFit_(base00, "anm_pod001");
	Wait_(5);
	task_man = Task_AnimeMoveNoFit_(pod04, "anm_pod101");
	task_base01 = Task_AnimeMoveNoFit_(base01, "anm_pod101");
	Wait_(5);
	task_woman = Task_AnimeMoveNoFit_(pod05, "anm_pod201");
	task_base02 = Task_AnimeMoveNoFit_(base02, "anm_pod201");
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	Wait_(50);
	
	local efc_kasoku1 = SetSelectBoneEffect_("ef883_05_flying_pod02", base00, ATTACH_GLOBAL);		//�|�b�h����
	SetEffectScale_(efc_kasoku1, 8.5);
	Wait_(5);
	local efc_kasoku2 = SetSelectBoneEffect_("ef883_05_flying_pod02", base01, ATTACH_GLOBAL);
	SetEffectScale_(efc_kasoku2, 8.0);
	Wait_(5);
	local efc_kasoku3 = SetSelectBoneEffect_("ef883_05_flying_pod02", base02, ATTACH_GLOBAL);
	SetEffectScale_(efc_kasoku3, 9.0);
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(30);		
	local efc_flash1 = SetSelectBoneEffect_("ef883_06_flying_pod03", base02, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash1, 10.0);																//�|�b�h�̂܂Ԃ�����1
	SetVisible(pod05, false);
	DeleteEffectEmitter_(efc_pod05);
	Wait_(10);
	
	local efc_flash2 = SetSelectBoneEffect_("ef883_06_flying_pod03", base01, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash2, 8.0);
	SetVisible(pod04, false);
	DeleteEffectEmitter_(efc_pod04);
	Wait_(5);
	
	local efc_flash3 = SetSelectBoneEffect_("ef883_06_flying_pod03", base00, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash3, 7.0);
	SetVisible(pod03, false);
	DeleteEffectEmitter_(efc_pod03);
	Wait_(10);
	
	local efc_flash1 = SetSelectBoneEffect_("ef883_06_flying_pod03", base02, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash1, 6.0);
	Wait_(10);
	
	local efc_flash2 = SetSelectBoneEffect_("ef883_06_flying_pod03", base01, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash2, 8.0);
	Wait_(5);
		
	local efc_flash3 = SetSelectBoneEffect_("ef883_06_flying_pod03", base02, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash3, 7.0);
	Wait_(10);

	local efc_flash1 = SetSelectBoneEffect_("ef883_06_flying_pod03", base00, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash1, 6.0);
	Wait_(5);

	local efc_flash2 = SetSelectBoneEffect_("ef883_06_flying_pod03", base01, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash2, 3.0);
	Wait_(5);

	local efc_flash3 = SetSelectBoneEffect_("ef883_06_flying_pod03", base02, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash3, 2.0);
	
	Wait_(30);
	SetMotion_(rena, MOT_WALK, BLEND_M);											//���i�@����O��
	task_rena = Task_MoveForward_(rena, 0.5, false);
	Wait_(25);
	DeleteTask_(task_rena);
	SetMotion_(rena, rena_look_up, BLEND_L);
	
	Wait_(140);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	Wait_(50);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	LoadLayout_("fin");																//���C�A�E�g�ǂݍ���
	SetLayoutAnime_("fin_in", false);												//fin
	Wait_(110);																		//F�̕������\�������^�C�~���O
	PlaySE_("SE_DEM_231");
	WaitLayoutAnime();

//	EndDemo(FADE_COLOR_BLACK);
	EndDemoBgmFade_(FADE_DEF);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	SetFogDensity_(density);
	SetFogDistMax_(distmax);
	DeleteAllTask_();
	SetSepiaColor_(false);
	End_();
}
