//=============================================
//
//		demo645[�K���}�U�[�h�폟��_4(�V�ϒn��-����)]
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
	local task_cam, task_player;
	local efc_player, efc_catastrophe000;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	// �G�t�F�N�g
	local model_base = ReadGimmick_("o_effect_base");	// �G�t�F�N�g�x�[�X
	LoadEffect_("ef864_04_catastrophe01");				// ᏋC
	LoadEffect_("ef725_01_nat_rain_hard");				// ��J
	LoadEffect_("ef800_11_crash_reactor03");			// �Ή�
	LoadEffect_("ef723_01_nat_explosion_n01");			// ����

// ���z�u
	// 覐΁i�G�t�F�N�g�x�[�X�j
	local mateor1 = ArrangePointGimmick_("o_effect_base", model_base, "obj_mateor000");
	local mateor2 = ArrangePointGimmick_("o_effect_base", model_base, "obj_mateor001");
	local mateor3 = ArrangePointGimmick_("o_effect_base", model_base, "obj_mateor002");	

// ���J�����ݒ�
	SetWeather_(WEATHER.BAD);												//�V�� �J
	SetTime_(8000);															//��
	ChangeColorTone_(0.5, 0.5, 0.5, 30);
	efc_catastrophe000 = SetCameraEffect_("ef864_04_catastrophe01", 100);	//ᏋC
	SetCameraEffect_("ef725_01_nat_rain_hard", 100);						//��J
	ReadWaitingLod("cameye000", "camtgt000");

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	StartEarthQuake_(-1, 3, 0.2);											//�n�k
	PlayBgm_("BG_AMBI_020");
	PlaySE_("SE_DEM_190");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	Wait_(120);

	local efc_mateor1 = SetSelectBoneEffect_("ef800_11_crash_reactor03", mateor1, ATTACH_GLOBAL);	//覐�
	SetEffectScale_(efc_mateor1, 3.0);
	local task_meteor01 = Task_AnimeMoveNoFit_(mateor1, "anm_mateor000");
	Wait_(40);
	local efc_mateor1 = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", mateor1, ATTACH_GLOBAL);	//����
	SetEffectScale_(efc_mateor1, 8.0);
	StopEarthQuake_();
	StartEarthQuake_(-1, 3, 5);											//�傫���h�炷
	Wait_(3);
	StopEarthQuake_();
	StartEarthQuake_(-1, 3, 0.2);											//�n�k
	local efc_mateor2 = SetSelectBoneEffect_("ef800_11_crash_reactor03", mateor2, ATTACH_GLOBAL);	//覐�
	SetEffectScale_(efc_mateor2, 6.5);
	local task_meteor02 = Task_AnimeMoveNoFit_(mateor2, "anm_mateor001");
	Wait_(20);
	ChangeColorTone_(1.5, 0.5, 0.5, 30);
	local efc_mateor3 = SetSelectBoneEffect_("ef800_11_crash_reactor03", mateor3, ATTACH_GLOBAL);	//覐�
	SetEffectScale_(efc_mateor3, 15.0);	
	local task_meteor03 = Task_AnimeMoveNoFit_(mateor3, "anm_mateor002");
	Wait_(20);
	local efc_mateor2 = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", mateor2, ATTACH_GLOBAL);	//����
	SetEffectScale_(efc_mateor2, 7.0);
	StopEarthQuake_();
	StartEarthQuake_(-1, 3, 3);											//�傫���h�炷
	Wait_(9);
	StopEarthQuake_();
	StartEarthQuake_(-1, 3, 0.2);											//�n�k
	Wait_(11);
	local efc_mateor3 = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", mateor3, ATTACH_GLOBAL);	//����
	SetEffectScale_(efc_mateor3, 10.0);
	StopEarthQuake_();
	StartDecayEarthQuake_(100, 3, 1);
	Wait_(80);

	EndDemo(FADE_COLOR_BLACK);
}
