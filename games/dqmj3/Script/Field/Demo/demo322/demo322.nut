//=============================================
//
//		demo322[�_�[�N�}�X�^�[�̒���_1]
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
	local efc_holography, efc_smoke0, efc_smoke1;
	local rena_on1 = [0.3, 0.6, 0.4, 0.3, 0.5, 0.3, 0.6, 0.4, 0.3, 0.5, 0.4, 0.3, 0.7];
	local rena_on2 = [1, 1, 15, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1];

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_rena = ReadNpc_("n034");			// ���i�[�e���̉f��
	// �M�~�b�N
	local model_display = ReadGimmick_("o_I02_17");	// �f�B�X�v���C
	local model_reactor = ReadGimmick_("o_dem_15");	// ���L���̃��A�N�^�[
	local model_daiza = ReadGimmick_("o_I02_19");	// ���A�N�^�[���
	// �G�t�F�N�g
	LoadEffect_("ef732_14_holography01");			// �z���O�����\���@�풓
	LoadEffect_("ef732_15_holography01");			// �z���O�����\���@�o��
	LoadEffect_("ef721_04_nat_smoke_psps");			// ���u�̉�

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetManualCalcAlpha_(rena, true);
	SetAlpha_(rena, ALPHA_CLEAR);
	// �M�~�b�N
	local display = ArrangePointGimmick_("o_I02_17", model_display, "display");			// �f�B�X�v���C
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");	// ���A�N�^�[
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// ���A�N�^�[���
	// �G�t�F�N�g
	efc_smoke0 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");		// ���u�̉�
	SetEffectScale_(efc_smoke0, 2.0);					
	efc_smoke1 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke001");		// ���u�̉�
	SetEffectScale_(efc_smoke1, 2.0);	

// ����풓���[�V�����Ǎ�
	local rena_look_down_L = ReadMotion_(rena, "n007_look_down_L");	// ���ނ��ҋ@L
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");		// �������L

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 240F

// ���M�~�b�N�̏������
	SetMotion_(daiza, MOT_GIMMICK_2, BLEND_N);

	task_rena = Task_AnimeMoveNoFitSetMotion_(rena, "anm_rena000", MOT_WALK, MOT_WAIT);	// 150F
	SetStepSe_(rena, SILENT_STEP_SE);								// ���i�[�e�@�����𖳉��ɂ���


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	PlaySE_("SE_DEM_047");											// ���i�[�e�����
	Wait_(5);
	efc_holography = SetBoneEffect_("ef732_15_holography01", rena);

	for (local i = 0; i< rena_on1.len(); i ++){		// ���i�[�e�_��
		SetAlpha_(rena, rena_on1[i]);
		Wait_(rena_on2[i]);
	}

	SetAlpha_(rena, 1);								// ���i�[�e���l
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_14_holography01", rena);
	Wait_(40);

	//===============================================
	//���Ȃ��̏���
	//�u���̃��b�Z�[�W���@�Đ����ꂽ�Ƃ������Ƃ�
	//�@���Ȃ��́@�����̕X���Ɂ@�������̂ˁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_322_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);

	//��������������������������������������
	//���J�b�g2
	//��������������������������������������

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	SetPointPos_(rena, "npc_rena001");

	Wait_(20);

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 210F

	SetMotion_(rena, rena_look_down_L, BLEND_XL);

	//===============================================
	//���Ȃ��̏���
	//�u���Ȃ����@���L���̂���Ă����@������
	//�@����Ă��ꂽ�Ƃ������Ƃˁc�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_322_MSG_020");
	KeyInputWait_();
	//===============================================
	//�u�Ȃ�΁c�c�X�����@�Βn�ɂ��錤����
	//�@�����Ɂ@�i��ł���͂��c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_322_MSG_030");
	KeyInputWait_();
	//===============================================
	//�u���L���́c�c�����@�G�Ɛ키�����ł͂Ȃ�
	//�@���̐��E���@�L���ɂ��邱�Ƃ��@�l���Ă����B
	//----------------------------------------------- 
	ShowMsg_("DEMO_322_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);


	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	DeleteEffect_(efc_smoke1);															//�E�[�̉�����
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 150F

	SetPointPos_(rena, "npc_rena002");
	Wait_(20);
	SetMotion_(rena, rena_look_up_L, BLEND_XL);

	//===============================================
	//���Ȃ��̏���
	//�u�������́@���̕c�̂悤�Ɂ@��]�̎���܂����B
	//�@���ꂪ�@���Ȃ���c�c<name_player/>�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_322_MSG_050");
	KeyInputWait_();
	//===============================================
	//�u���́@�҂��Ă���c�c���Ȃ���
	//�@���E��m��@��]�Ƃ��ā@�傫����̂��c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_322_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(30);
	SetActive_(player, false);


	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	efc_smoke1 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke002");		// �E�[�̉��@�ʒu����
	SetEffectScale_(efc_smoke1, 2.0);	

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	// 120F

	WaitTask(task_cam);
	PlaySE_("SE_DEM_050");															//���j�^�[�Ƀm�C�Y������
	SetMotion_(display, MOT_GIMMICK_1, BLEND_N);
	Wait_(30);

	EndDemo(FADE_COLOR_WHITE);
}
