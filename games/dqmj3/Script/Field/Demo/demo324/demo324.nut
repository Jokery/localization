//=============================================
//
//		demo324[�_�[�N�}�X�^�[�̒���_3]
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
	local task_cam, task_player, task_rena;
	local efc_player, efc_exprosion, efc_smoke0, efc_smoke1, efc_holography;
	local rena_on1 = [0.7, 0.3, 0.4, 0.5, 0.3, 0.4, 0.5, 0.2, 0.4, 0.2, 0.3, 0.2, 0.1, 0.2, 0.1];
	local rena_on2 = [1, 1, 1, 1, 1, 5, 1, 1, 1, 1, 15, 1, 1, 1, 1];

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
	LoadEffect_("ef732_16_holography01");			// �z���O�����\���@����
	LoadEffect_("ef723_02_nat_explosion_n02");		// �����G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �I�}�[�N
	LoadEffect_("ef721_04_nat_smoke_psps");

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetManualCalcAlpha_(rena, true);
	// �M�~�b�N
	local display = ArrangePointGimmick_("o_I02_17", model_display, "obj_display000");	// �f�B�X�v���C
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");	// ���A�N�^�[
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// ���A�N�^�[���

// ����풓���[�V�����Ǎ�
	local Player_surprise = ReadMotion_(player, "Player_surprise");
	local Player_surprise_L = ReadMotion_(player, "Player_surprise_L");
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");		// �������L

	SetMotion_(rena, rena_look_up_L, BLEND_N);
	SetMotion_(daiza, MOT_GIMMICK_2, BLEND_N);
	efc_smoke0 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");	// ���u�̉��G�t�F�N�g���p�ӂ��ꂽ�炱���ɓ���ĉ�����
	SetEffectScale_(efc_smoke0, 2.0);
	efc_holography = SetBoneEffect_("ef732_14_holography01", rena);


	//��������������������������������������
	//���J�b�g�P�@��l���@����
	//��������������������������������������

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_WHITE);

	PlaySE_("SE_DEM_127");
	local 	efc_exprosion1 = SetPointWorldEffect_("ef723_02_nat_explosion_n02", "efc_experojen001");
	SetEffectScale_(efc_exprosion1, 1.0);
	local 	efc_exprosion2 = SetPointWorldEffect_("ef723_02_nat_explosion_n02", "efc_experojen002");
	SetEffectScale_(efc_exprosion2, 1.0);
	SetMotion_(daiza, MOT_GIMMICK_0, BLEND_N);
	SurpriseDisp(player);
	SetMotion_(player, Player_surprise, BLEND_M);
	Wait_(5);
	SetMotion_(player, Player_surprise_L, BLEND_M);
	Wait_(30);
	// �f�B�X�v���C������
	SetManualCalcAlpha_(display, true);
	SetAlpha_(display, ALPHA_CLEAR);
	Wait_(60);


	//��������������������������������������
	//���J�b�g�Q�@���i�[�e�@����
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(5);

	for (local i = 0; i< rena_on1.len(); i ++){		// ���i�[�e�_��
		SetAlpha_(rena, rena_on1[i]);
		Wait_(rena_on2[i]);
	}

	SetVisible(rena, false);
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_16_holography01", rena);
	PlaySE_("SE_DEM_048");															//���i�[�e������
	Wait_(90);

	EndDemo(FADE_COLOR_BLACK);
}
