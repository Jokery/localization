//=============================================
//
//		demo824[�X�^�[�V�[�h����]
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
	local task_cam, task_player, task_aroma;
	local efc_player, efc_seed, efc_green, efc_blue, efc_red, efc_pollen;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_aroma = ReadNpc_("n018");				// �A���}

	// �G�t�F�N�g
	LoadEffect_("ef732_22_star_seed_m_g");				// �X�^�[�V�[�h�΁@�O��
	LoadEffect_("ef732_23_star_seed_m_b");				// �X�^�[�V�[�h�@�O��
	LoadEffect_("ef732_24_star_seed_m_r");				// �X�^�[�V�[�h�ԁ@�O��
	LoadEffect_("ef732_25_star_seed_base01");			// �X�^�[�V�[�h�x�[�X�@�����O
	LoadEffect_("ef732_26_star_seed_base02");			// �X�^�[�V�[�h�x�[�X�@������
	LoadEffect_("ef732_28_star_seed_comp");				// �X�^�[�V�[�h�x�[�X�@�������o
	LoadEffect_("ef882_04_smoke_dark");					// ����
	LoadEffect_("ef340_06_star_seed_case");				// �X�^�[�V�[�h�̓��ꕨ
	LoadEffect_("ef340_07_star_seed_shaton_u");			// �d�C�G�t�F�N�g�@��
	LoadEffect_("ef340_08_star_seed_shaton_d");			// �d�C�G�t�F�N�g�@��

	// �M�~�b�N
	local model_base = ReadGimmick_("o_effect_base");	// �G�t�F�N�g�x�[�X
	local model_pod = ReadGimmick_("o_U00_02");			// �E�o�|�b�h
	local model_alias = ReadGimmick_("o_U00_11");		// �G�C���A�X���u
	
	local model_warp_center = ReadGimmick_("o_com_35");		// ���������O(��)
	local model_warp_right = ReadGimmick_("o_com_36");		// ���������O(��)
	local model_warp_left = ReadGimmick_("o_com_37");		// ���������O(��)

	// ���C�A�E�g
	LoadLayout_("memories");

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	//�A���}
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, "SE_FLD_021");

	//�M�~�b�N
	local seed = ArrangePointGimmick_("o_effect_base", model_base, "obj_seed000");				//�X�^�[�V�[�h�i�G�t�F�N�g�x�[�X�j
	SetPointPosNoFit_(seed, "obj_seed000");

	local warp_center = ArrangePointGimmick_("o_com_35", model_warp_center, "obj_warp_center000");		// ���������O(��)
	local warp_right = ArrangePointGimmick_("o_com_36", model_warp_right, "obj_warp_right000");			// ���������O(��)
	local warp_left = ArrangePointGimmick_("o_com_37", model_warp_left, "obj_warp_left000");			// ���������O(��)

// ����풓���[�V�����Ǎ�
	//��l��
	local player_nod = ReadMotion_(player, "Player_nod");										// ���ȂÂ�
	local player_right = ReadMotion_(player, "Player_look_right_L");							// �E������
	local player_look_up = ReadMotion_(player, "Player_look_up_L");								// ������ҋ@L

	//�A���}
	local aro_look_up_L = ReadMotion_(aroma, "n018_look_up_L");									// ������ҋ@L
	local star_seed_look_L = ReadMotion_(aroma, "n018_star_seed_look_L");						// �X�^�[�V�[�h������
	local star_seed_look_left_L = ReadMotion_(aroma, "n018_star_seed_left_L");					// �X�^�[�V�[�h������(������)
	local aro_send_up_L = ReadMotion_(aroma, "n018_star_seed_send_up_L");						// �X�^�[�V�[�h���}����
	local star_seed_look_up_L = ReadMotion_(aroma, "n018_star_seed_look_up_L");					// �X�^�[�V�[�h������(�����)

// ���������[�V����
	SetMotion_(player, player_look_up, BLEND_N); 
	SetMotion_(aroma, aro_look_up_L, BLEND_N); 

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

// �������G�t�F�N�g
	efc_seed = SetSelectBoneEffect_("ef732_28_star_seed_comp", seed, ATTACH_GLOBAL);			//�X�^�[�V�[�h�������o
	local efc_case = SetSelectBoneEffect_("ef340_06_star_seed_case", seed, ATTACH_GLOBAL);		//�X�^�[�V�[�h�̓��ꕨ
	local efc_shaton_u = SetPointWorldEffect_("ef340_07_star_seed_shaton_u", "efc_shaton_d000");//�d�C�@��
	local efc_shaton_d = SetPointWorldEffect_("ef340_08_star_seed_shaton_d", "efc_shaton_u000");//�d�C�@��


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	PlaySE_("SE_DEM_201");
	StartDemo(FADE_COLOR_BLACK);

	//��������������������������������������
	//���J�b�g1 �X�^�[�V�[�h����
	//��������������������������������������

	Wait_(155);
	Wait_(50);
	DeleteEffectEmitter_(efc_case);								//���ꕨ�E�d�C����
	DeleteEffectEmitter_(efc_shaton_u);
	DeleteEffectEmitter_(efc_shaton_d);
	Wait_(150);
	SetMotion_(aroma, aro_send_up_L, BLEND_N);					// �A���} �X�^�[�V�[�h���}����
	SetVisible(player, false);


	//��������������������������������������
	//���J�b�g2 �A���}�@��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	Task_AnimeMoveNoDirNoFit_(seed, "anm_seed000");
	uChangeEffectScale(efc_seed, 1.0, 0.3, 120)					// ���񂾂�G�t�F�N�g�������Ȃ�
	Wait_(50);
	SetMotionSpeed_(aroma, 0.1);
	SetMotion_(aroma, star_seed_look_L, BLEND_XL);				// �A���} �X�^�[�V�[�h������

	WaitTask(task_cam);
	SetMotionSpeed_(aroma, 0.5);

	//===============================================
	// *�A���}
	// �u�悵�c�c���܂������Ă�B
	//�@�V�����@�X�^�[�V�[�h�́@������I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_824_MSG_010");
	SetMotionSpeed_(aroma, 0.5);
	KeyInputWait_();
	//===============================================
	// *�A���}
	// �u����Ł@���i�[�e�������o����c�c�B
	//�@���̎q���@������̂́@����łQ��ڂ���B
	//-----------------------------------------------
	ShowMsg_("DEMO_824_MSG_020");
	SetMotion_(aroma, star_seed_look_up_L, 25);					// �A���} �X�^�[�V�[�h�����i��ҋ@�j
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(50);


	//��������������������������������������
	//���J�b�g3 �ߋ���z���̂P
	//��������������������������������������

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();

	SetLayoutAnime_("ev824_00_loop", true);//�ߋ���z�P�J�n
	Wait_(5);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();

	//===============================================
	// *�A���}
	// �u���Ԃ�@�o���ĂȂ��ł��傤����
	//�@���i�[�e���������̂��ā@�A���^�������̂�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_824_MSG_030");
	KeyInputWait_();
	//===============================================
	// *�A���}
	// �u���̎q�c�c�������Ƃ��́@�L���r���������B
	//�@�}�U�[�{�̂���@�؂藣���ꂽ�V���b�N�łˁB
	//-----------------------------------------------
	ShowMsg_("DEMO_824_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetLayoutAnime_("ev824_00_out", false);//�ߋ���z�P�I��

	WaitLayoutAnime();

	SetLayoutAnime_("ev824_01_loop", true);//�ߋ���z�Q�J�n
	Wait_(5);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();


	//��������������������������������������
	//���J�b�g4 �ߋ���z���̂Q
	//��������������������������������������

	//===============================================
	// *�A���}
	// �u�������@�N�Ȃ̂������@�Y��Ă����B
	//�@�ł��@�₪�Ĕޏ��́@�v���������c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_824_MSG_050");
	KeyInputWait_();
	//===============================================
	// *�A���}
	// �u�}�U�[���@���퉻����Ƃ���
	//�@�����̎g�����c�c�ˁB
	//-----------------------------------------------
	ShowMsg_("DEMO_824_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetLayoutAnime_("ev824_01_out", false);//�ߋ���z�Q�I��

	WaitLayoutAnime();
	SetVisible(player, true);
	SetMotion_(player, MOT_WAIT, BLEND_N);						// ��@�ҋ@
	SetPointPos_(player, "player001");


	//��������������������������������������
	//���J�b�g5 �A���}�A�b�v
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	Wait_(10);
	SetMotion_(aroma, star_seed_look_L, BLEND_XL);				//�A���}�@���ҋ@�i�X�^�[�V�[�h����j

	//===============================================
	// *�A���}
	// �u�����ā@�����m�����Ƃ�����@�A�^�V����
	//�@���W�X�^���X�̐킢�́@�n�܂����̂�c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_824_MSG_070");
	KeyInputWait_();
	//===============================================

	SetMotion_(aroma, star_seed_look_left_L, BLEND_XL);			//�A���}�@���ҋ@�i�X�^�[�V�[�h����j
	Wait_(10);

	//===============================================
	// *�A���}
	// �u�c�c�v���o�b�́@�܂����x�ɂ��܂���B
	//�@�܂��́@���i�[�e���@�����Ȃ��ƂˁB
	//-----------------------------------------------
	ShowMsg_("DEMO_824_MSG_080");
	Wait_(5);
	SetMotion_(player, player_right, BLEND_XL);					// ��@�E����
	KeyInputWait_();
	//===============================================
	// *�A���}
	// �u�R�A�Ł@���̎q���҂��Ă����B
	//�@���n�ō���������@����l���̖��O���I
	//-----------------------------------------------
	ShowMsg_("DEMO_824_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(40);
	DeleteTask_(task_cam);
	SetVisible(player, false);


	//��������������������������������������
	//���J�b�g7 �Ӗ����肰�ɃX�^�[�V�[�h���f��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	WaitTask(task_cam);
	PlaySE_("SE_DEM_202");			// ���E�̃L��SE
	efc_pollen = SetSelectBoneEffectSetOffset_("ef882_04_smoke_dark", seed, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_pollen, 0.4);
	Wait_(70);
	DeleteEffectEmitter_(efc_pollen); 
	Wait_(70);

	EndDemo(FADE_COLOR_BLACK);
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
