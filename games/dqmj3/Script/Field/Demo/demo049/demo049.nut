//=============================================
//
//		demo049[���i�[�e�o��_2(�c�[)]
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
	local task_cam, task_rena;
	local efc_heavencrash, efc_santyo000, efc_santyo001;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_santyo = ReadGimmick_("o_dem_09");		// �T���`��
	local model_heavencrash = ReadGimmick_("o_dem_10");	// �y������I�u�W�F�N�g
	local model_pod = ReadGimmick_("o_dem_26");			// �y���̎c�[�̃��A�N�^�[
	// �G�t�F�N�g
	LoadEffect_("ef721_04_nat_smoke_psps");				// �� �v�X�v�X
	LoadEffect_("ef804_01_paradise_lost01");			// �y�����󉉏o
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_rena = ReadNpc_("n007");				// ���i�[�e

// ���z�u
	// �T���`��
	local santyo = ArrangePointGimmick_("o_dem_09", model_santyo, "obj_santyo000");
	SetScaleSilhouette(santyo, SCALE.SANCHO_CRASH, SILHOUETTE_WIDTH.SANCHO_CRASH);
	// �y������I�u�W�F�N�g
	local heavencrash = ArrangePointGimmick_("o_dem_10", model_heavencrash, "obj_heavencrash000");
	SetManualCalcAlpha_(heavencrash, true);									//���l���蓮�Őݒ�
	// �y�����󉉏o
	efc_heavencrash = SetPointWorldEffect_("ef804_01_paradise_lost01", "obj_heavencrash000");
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetStepSePan_(rena, false);
	// �y���̎c�[�̃��A�N�^�[
	local pod = ArrangePointGimmick_("o_dem_26", model_pod, "obj_pod000");	//(���_�z�u)
	SetManualCalcAlpha_(pod, true);									//���l���蓮�Őݒ�
	SetAlpha_(pod, ALPHA_CLEAR);
// ����풓���[�V�����Ǎ�
	// ��l��
	local player_guard_L = ReadMotion_(player, "Player_guard_L");			// �g�\����L
	local player_caution = ReadMotion_(player, "Player_caution");			// �g�\���遨�x��
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// �x��L
	// ���i�[�e
	local rena_attack_L = ReadMotion_(rena, "n007_attack_L");				// �U��L
	local rena_sit_L = ReadMotion_(rena, "n007_sit_L");						// ���Ⴊ��L
	local rena_stand01 = ReadMotion_(rena, "n007_stand01");					// ���Ⴊ�݁��ҋ@
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");			// ��������L
	
// �������̃��[�V����
	SetMotion_(player, player_guard_L, BLEND_N);
	
	SetActive_(santyo, false);
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 150F
	SetFace_(player, "Face_loop_close");	
	SetFace_(rena, "Face_eyes_close");
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	//��������������������������������������
	//���J�b�g�P �������
	//��������������������������������������
	StartBlurEffect_();
//	StartDemo(FADE_COLOR_WHITE);	// SE�̍Đ��^�C�~���O�𒲐��������̂�StartDemo�̊֐��𕪉����ċL�q���Ă��܂�

	local bgm = "";
	
	if(bgm != ""){
		PlayBgm_(bgm);
	}
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	PlaySE_("SE_DEM_067");	// ��SE�F�y���̔w�i�������SE

	Wait_(160);	
	local efc_crash = Task_ObjectFadeOut_(heavencrash, 40);								//�j�Ђ��ǂ�ǂ�����Ă���
	
	Wait_(10);
	
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 60);
	WaitFade_();
	DeleteEffect_(efc_heavencrash);
	
	SetActive_(rena, false);
	SetActive_(heavencrash, false);

	SetPointPos_(player, "player002");
	SetPointPos_(rena, "npc_rena002");

	DeleteTask_(task_cam);
	EndBlurEffect_();
	
	//��������������������������������������
	//���J�b�g�Q ��l���A�b�v
	//��������������������������������������

	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 100F
	PlayBgm_("BG_AMBI_008");
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	
	WaitTask(task_cam);
	SetAlpha_(pod, ALPHA_EXIST);
	SetMotion_(player, player_caution, BLEND_M);
	SetFace_(player, "Face_eyes_close");
	WaitMotion(player);
	SetMotion_(player, player_caution01_L, BLEND_M);
	
	Wait_(60);	
	DeleteTask_(task_cam);
	
	SetActive_(player, false);
	SetPointPos_(player, "player001");
	
	//��������������������������������������
	//���J�b�g�R ��̏����A�b�v
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 170F
	SetActive_(rena, true);
	SetDirToObject_(rena, player);

	Wait_(80);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	WaitTask(task_cam);	
	DeleteTask_(task_cam);
	
	Wait_(20);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(rena, rena_look_left_L, BLEND_M);

	SetDir_(player, -25);
	SetActive_(player, true);
	//��������������������������������������
	//���J�b�g�S �s���܂��傤
	//��������������������������������������
	SetPointPos_(rena, "npc_rena001");
	SetDir_(rena, 80);
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 130F

	Wait_(130);

	//===============================================
	// ���Ȃ��̏���
	// �u�s���܂��傤�c�c<name_player/>�B
	//�@����ȏꏊ�ɂ��Ắ@�����Ȃ���c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_049_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	
	DeleteTask_(task_cam);

	efc_santyo000 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_santyocrash000");
	SetEffectScale_(efc_santyo000, 1.15);
	efc_santyo001 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_santyocrash001");
	SetEffectScale_(efc_santyo001, 1.15);
	
	
	SetActive_(santyo, true);
	
	SetMotion_(rena, MOT_WALK, BLEND_L);
	task_rena = Task_RotateToDir_(rena, -10, ROTATE_DEMO_DEF);
	WaitTask(task_rena);
	DeleteTask_(task_rena);
	task_rena = Task_MoveForward_(rena, 0.78, false);
	Wait_(15);

	//��������������������������������������
	//���J�b�g�T
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 120F
	
	Wait_(70);

	EndDemo(FADE_COLOR_BLACK);

}
