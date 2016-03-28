//=============================================
//
//		demo820[�C�̃X�^�[�s�[�X�g�ݍ���]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
// ���t���O�ݒ�
	local bit_green = GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_GREEN");		// Bit_1361 �΁F���`�z�R���j�t���O
	local bit_red = GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_RED");			// Bit_1363 �ԁF�z�A�J�����j�t���O
	local bit_open_green = GetEventFlg_("BFG_PLAYED_YATIHOKO_SEALED_DEMO");	// Bit_1373 �΂̔����J������
	local bit_open_red = GetEventFlg_("BFG_PLAYED_HOAKARI_SEALED_DEMO");	// Bit_1375 �Ԃ̔����J������

// ���ϐ���`
	local task_cam, task_player, task_aroma;
	local task_aroma_step;
	local efc_player, efc_seed00, efc_seed01, efc_seed02, efc_kirakira00, efc_kirakira01;
	local efc_green, efc_red;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_base = ReadGimmick_("o_effect_base");		// �G�t�F�N�g�x�[�X
	local model_pod = ReadGimmick_("o_U00_02");				// �E�o�|�b�h
	local model_red_door = ReadGimmick_("o_U00_05");		// ��:�Ԕ�
	local model_green_door = ReadGimmick_("o_U00_09");		// ��:�Δ�

	local model_warp_center = ReadGimmick_("o_com_35");		// ���������O(��)
	local model_warp_right = ReadGimmick_("o_com_36");		// ���������O(��)
	local model_warp_left = ReadGimmick_("o_com_37");		// ���������O(��)

	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local model_aroma000 = ReadNpc_("n018");				//�A���}
	// �G�t�F�N�g
	LoadEffect_("ef732_20_star_seed_b");					// �X�^�[�V�[�h ��
	LoadEffect_("ef731_01_mag_light01");					// �����L���L��
	LoadEffect_("ef732_25_star_seed_base01");				// �X�^�[�V�[�h ��������O
	LoadEffect_("ef732_23_star_seed_m_b");					// �X�^�[�V�[�h �O�� ��
	LoadEffect_("ef340_06_star_seed_case");					// �X�^�[�V�[�h�̓��ꕨ
	LoadEffect_("ef340_07_star_seed_shaton_u");				// �d�C�G�t�F�N�g�@��
	LoadEffect_("ef340_08_star_seed_shaton_d");				// �d�C�G�t�F�N�g�@��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	// �A���}
	local aroma = ArrangePointNpc_(model_aroma000, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);

	//�X�^�[�V�[�h ��������O
	local seed_before = ArrangePointGimmick_("o_effect_base", model_base, "obj_seed000");
	SetPointPosNoFit_(seed_before, "obj_seed000");
	efc_seed01 = SetSelectBoneEffect_("ef732_25_star_seed_base01", seed_before, ATTACH_GLOBAL);

	// �����`�z�R�����j���Ă���ꍇ��
	if (bit_green)
	{
		// �X�^�[�V�[�h �O�� ��
		LoadEffect_("ef732_22_star_seed_m_g");
		efc_green = SetSelectBoneEffect_("ef732_22_star_seed_m_g" seed_before, ATTACH_GLOBAL);
	}

	// ���z�A�J�������j���Ă���ꍇ��
	if (bit_red)
	{
		// �X�^�[�V�[�h �O�� ��
		LoadEffect_("ef732_24_star_seed_m_r");
		efc_red = SetSelectBoneEffect_("ef732_24_star_seed_m_r", seed_before, ATTACH_GLOBAL);
	}

	// �����`�z�R�̎w�ւ������Ă��Ȃ��ꍇ��
	if (!bit_open_green)
	{
		// �Δ�
		local green_door = ArrangePointGimmick_("o_U00_09", model_green_door, "obj_U00_09");
	}

	// ���z�A�J���̎w�ւ������Ă��Ȃ��ꍇ��
	if (!bit_open_red)
	{
		// �Ԕ�
		local red_door = ArrangePointGimmick_("o_U00_05", model_red_door, "obj_U00_05");
	}

	//�X�^�[�V�[�h ��
	local starseed = ArrangePointGimmick_("ef732_20_star_seed_b", model_base, "obj_starseed00");
	SetPointPosNoFit_(starseed, "obj_starseed00");
	efc_seed00 = SetSelectBoneEffect_("ef732_20_star_seed_b", starseed, ATTACH_GLOBAL);

	//�X�^�[�V�[�h�̓��ꕨ
	local efc_case = SetSelectBoneEffect_("ef340_06_star_seed_case", seed_before, ATTACH_GLOBAL);
	local efc_shaton_u = SetPointWorldEffect_("ef340_07_star_seed_shaton_u", "efc_shaton_d000");		//�d�C�@��
	local efc_shaton_d = SetPointWorldEffect_("ef340_08_star_seed_shaton_d", "efc_shaton_u000");		//�d�C�@��

	// �|�b�h
	local pod00 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod000");
	local pod01 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod001");
	local pod02 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod002");
	
	local warp_center = ArrangePointGimmick_("o_com_35", model_warp_center, "obj_warp_center000");		// ���������O(��)
	local warp_right = ArrangePointGimmick_("o_com_36", model_warp_right, "obj_warp_right000");			// ���������O(��)
	local warp_left = ArrangePointGimmick_("o_com_37", model_warp_left, "obj_warp_left000");			// ���������O(��)

// ����풓���[�V�����Ǎ�
	local aroma_star_seed_L = ReadMotion_(aroma, "n018_star_seed_L");						//�X�^�[�V�[�h������L
	local aroma_star_seed_look_L = ReadMotion_(aroma, "n018_star_seed_look_L");				//�X�^�[�V�[�h������L
	local aroma_star_seed_send = ReadMotion_(aroma, "n018_star_seed_send");					//�X�^�[�V�[�h��O��
	local aroma_star_seed_send_L = ReadMotion_(aroma, "n018_star_seed_send_L");				//�X�^�[�V�[�h��O��L
	local aroma_star_seed_look_up_L = ReadMotion_(aroma, "n018_star_seed_look_up_L");		//�X�^�[�V�[�h������(�����)L
	local aroma_star_seed_look_left_L = ReadMotion_(aroma, "n018_star_seed_look_left_L");	//�X�^�[�V�[�h������(������)L
	local aroma_look_right_L = ReadMotion_(aroma, "n018_look_right_L");						//�A���} ������
	local aroma_look_up_L = ReadMotion_(aroma, "n018_look_up_L");							//�A���} �����
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");						//��l�� �����

// �����[�V�����ݒ�
	SetMotion_(aroma, aroma_star_seed_L, BLEND_N);				//�X�^�[�V�[�h������L

// ���J�����ݒ�
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//===============================================
	// ���A���}
	// �u�C�̃X�^�[�s�[�X���c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_820_MSG_010");
	KeyInputWait_();

	SetMotion_(aroma, aroma_star_seed_look_left_L, BLEND_XL);	//�X�^�[�V�[�h������L
	local task_starseed = Task_AnimeMoveNoDirNoFit_(starseed, "anm_starseed00");//�X�^�[�V�[�h00

	//-----------------------------------------------
	// ��
	// �u�A���^�ɂ́@�B���Ă��݂��������ǁc�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_820_MSG_020");
	KeyInputWait_();

	//-----------------------------------------------
	// ��
	// �u�ł��ˁ@���_�c�~�Ɛ�����Ƃ��́@�A�C�c�́c�c
	//-----------------------------------------------
	ShowMsg_("DEMO_820_MSG_030");
	KeyInputWait_();

	//-----------------------------------------------
	// ��
	// �u�A���^�����́@����ς�Z��ˁc�c���������B
	//-----------------------------------------------
	ShowMsg_("DEMO_820_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_cam);
	Wait_(20);

	//��������������������������������������
	//���J�b�g2
	//��������������������������������������

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	SetAlpha_(player, 0);
	Wait_(40);

	SetMotion_(aroma, aroma_star_seed_look_L, BLEND_XL);		//�X�^�[�V�[�h������L
	Wait_(1);
	DeleteTask_(task_starseed);
	local task_starseed = Task_AnimeMoveNoDirNoFit_(starseed, "anm_starseed01");//�X�^�[�V�[�h01
	Wait_(19);

	//===============================================
	// ���A���}
	// �u�S�̂���悤���@�A���Z�X����
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_820_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, aroma_star_seed_send, BLEND_XL);				//�X�^�[�V�[�h��O��
	Wait_(10);
	
	DeleteTask_(task_starseed);
	PlaySE_("SE_DEM_199");
	local task_starseed = Task_AnimeMoveNoDirNoFit_(starseed, "anm_starseed02");		//�X�^�[�V�[�h02
	WaitMotion(aroma);
	SetMotion_(aroma, aroma_star_seed_send_L, BLEND_M);				//�X�^�[�V�[�h��O��
	
	Wait_(90);
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������

	local task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	PlaySE_("SE_DEM_200");

	DeleteTask_(task_starseed);

	local task_starseed = Task_AnimeMoveNoFit_(starseed, "anm_starseed03");		//�X�^�[�V�[�h03

	SetAlpha_(player, 1);

	SetDir_(player, -120);
	SetDir_(aroma, -90);

	Wait_(90);

	SetFade_(FADE_OUT, FADE_COLOR_WHITE , 30);
	WaitFade_();

	DeleteEffectEmitter_(efc_seed00);
	SetMotion_(player, player_look_up_L, BLEND_XL);				//��l�� �����
	SetMotion_(aroma, aroma_look_up_L, BLEND_XL);				//�A���} �����
	Wait_(60);

	efc_seed02 = SetSelectBoneEffect_("ef732_23_star_seed_m_b" seed_before, ATTACH_GLOBAL);
	if (bit_green)
	{
		DeleteEffect_(efc_green);
		efc_green = SetSelectBoneEffect_("ef732_22_star_seed_m_g" seed_before, ATTACH_GLOBAL);
	}
	if (bit_red)
	{
		DeleteEffect_(efc_red);
		efc_red = SetSelectBoneEffect_("ef732_24_star_seed_m_r" seed_before, ATTACH_GLOBAL);
	}


	SetFade_(FADE_IN, FADE_COLOR_WHITE , 30);
	WaitFade_();
	//-----

	Wait_(90);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g4
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(aroma, MOT_WALK, BLEND_XL);							//�A���} ����
	task_aroma = Task_RotateToPos_(aroma, GetPos_(player), 2.0);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	Wait_(20);

	SetMotion_(aroma, MOT_WAIT, BLEND_XL);							//�A���} �ҋ@
	DeleteTask_(task_aroma_step);
	Wait_(20);

	//===============================================
	// ���A���}
	// �u�悵�I�@�������̃X�^�[�V�[�h��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_820_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(20);

	EndDemo(FADE_COLOR_BLACK);
}
