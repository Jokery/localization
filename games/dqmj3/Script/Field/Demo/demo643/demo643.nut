//=============================================
//
//		demo643[�K���}�U�[�h�폟��_2(�V�ϒn��-�ΎR)]
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
	local task_cam, task_player, task_birdy, task_kimera1, task_kimera2, task_kimera3;
	local efc_player, efc_catastrophe000;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_birdy = ReadNpc_("n019");			// �o�[�f�B

	//�G�t�F�N�g
	local model_base = ReadGimmick_("o_effect_base");	// �G�t�F�N�g�x�[�X
	LoadEffect_("ef864_04_catastrophe01");				// ᏋC
	LoadEffect_("ef800_11_crash_reactor03");			// �Ή�
	LoadEffect_("ef800_10_crash_reactor01");			// �Ήԁi���A�N�^�[�̗������j
	LoadEffect_("ef723_01_nat_explosion_n01");			// ����

// ���z�u
	// 覐΁i�G�t�F�N�g�x�[�X�j
	local mateor1 = ArrangePointGimmick_("o_effect_base", model_base, "obj_mateor000");
	local mateor2 = ArrangePointGimmick_("o_effect_base", model_base, "obj_mateor001");
	local mateor3 = ArrangePointGimmick_("o_effect_base", model_base, "obj_mateor002");

// ���V��E���Ԑݒ�
	SetTime_(7000);														//�[�Ă�

// ���J�����ݒ�
	ReadWaitingLod("cameye000", "camtgt000");

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);

	Wait_(10);
	StartEarthQuake_(-1, 3, 1.5);											//�n�k
	PlayBgm_("BG_AMBI_020");
	Wait_(30);
	efc_catastrophe000 = SetCameraEffect_("ef864_04_catastrophe01", 100);	// ᏋC
	ChangeTime(8000, 30, 7000);												//�[������
	ChangeColorTone_(0.5, 0.5, 0.5, 30);
	Wait_(30);
	StopEarthQuake_();
	StartEarthQuake_(-1, 3, 3);											//�n�k
	Wait_(30);

	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//�t�F�[�h�A�E�g
	WaitFade_();
	StopEarthQuake_();
	ReadWaitingLod("cameye001", "camtgt001");


	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	StartEarthQuake_(-1, 3, 0.8);											//�n�k
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//�t�F�[�h�C��
	PlaySE_("SE_DEM_188");
	//...........................................................................
	Wait_(10);

	//覐�
	local efc_mateor1 = SetSelectBoneEffect_("ef800_11_crash_reactor03", mateor1, ATTACH_GLOBAL);	//���e�I�P
	SetEffectScale_(efc_mateor1, 6.0);
	task_kimera3 = Task_AnimeMoveNoFit_(mateor1, "anm_mateor000");
	Wait_(30);
	StartEarthQuake_(9, 3, 10.0);											//�傫���n�k
	local efc_bomb = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", mateor1, ATTACH_GLOBAL);	//���e�I�P����
	SetEffectScale_(efc_bomb, 2.0);
	Wait_(9);
	StartEarthQuake_(-1, 3, 0.8);							//�n�k
	local efc_mateor2 = SetSelectBoneEffect_("ef800_11_crash_reactor03", mateor2, ATTACH_GLOBAL);	//���e�I�Q
	SetEffectScale_(efc_mateor2, 1.0);
	task_kimera2 = Task_AnimeMoveNoFit_(mateor2, "anm_mateor001");
	Wait_(16);
	local efc_mateor3 = SetSelectBoneEffect_("ef800_11_crash_reactor03", mateor3, ATTACH_GLOBAL);	//���e�I�R
	SetEffectScale_(efc_mateor3, 5.0);	
	task_kimera1 = Task_AnimeMoveNoFit_(mateor3, "anm_mateor002");
	Wait_(13);
	StartEarthQuake_(6, 3, 8.0);											//�傫���n�k
	local efc_bomb = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", mateor2, ATTACH_GLOBAL);	//���e�I�Q����
	SetEffectScale_(efc_bomb, 1.5);
	Wait_(6);
	StartEarthQuake_(-1, 3, 1.0);							//�n�k
	Wait_(10);
	StartEarthQuake_(12, 3, 15);											//�傫���n�k
	local efc_bomb = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", mateor3, ATTACH_GLOBAL);	//���e�I�R����
	SetEffectScale_(efc_bomb, 2.5);
	Wait_(12);
	StartEarthQuake_(-1, 3, 1.5);							//�n�k
	Wait_(50);

	EndDemo(FADE_COLOR_BLACK);
}
