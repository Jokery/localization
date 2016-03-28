//=============================================
//
//		demo644[�K���}�U�[�h�폟��_3(�V�ϒn��-����)]
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
	local task_cam, task_nocho;
	local efc_catastrophe000, efc_para01, efc_para02, efc_para00;
	local efc_thunder00, efc_thunder01,efc_thunder02 ,efc_thunder03 ,efc_thunder04 ,efc_thunder05;

	// �M�~�b�N�ǂݍ���
	local obj_water = ReadGimmick_("o_A00_02");	
	local obj_center = ReadGimmick_("o_A00_04");			// �Z���^�[�r���@�Ɩ�

//	���G�t�F�N�g
	LoadEffect_("ef864_04_catastrophe01");					// �V�ϒn��
	LoadEffect_("ef725_02_nat_thunder");					// ���i�J�ƃZ�b�g�j
	LoadEffect_("ef800_09_crash_reactor02");				// ���i���A�N�^�[�ɗ�����j
	LoadEffect_("ef832_01_fire");							// ��
	LoadEffect_("ef852_03_explosion_db");					// ����
	LoadEffect_("ef725_01_nat_rain_hard");					// ��J

// ���z�u
	local center = ArrangePointGimmick_("o_A00_04",obj_center, "center000");			// �Z���^�[�r���@�Ɩ�
	SetMotion_(center, MOT_GIMMICK_1, 1);

// ���J�����ݒ�
	SetTime_(0);																		// ��
	ReadWaitingLod("cameye000", "camtgt000");
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

// ���V��E�����G�t�F�N�g�ݒ�
	StartEarthQuake_(-1, 3, 3);															// �n�k
	SetWeather_(WEATHER.BAD);															// �V�� �J
	SetCameraEffect_("ef725_01_nat_rain_hard", 100);									// ��J
	efc_catastrophe000 = SetCameraEffect_("ef864_04_catastrophe01", 100);				// ᏋC

	PlayBgm_("BG_AMBI_020");
	PlaySE_("SE_DEM_189");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	efc_thunder00 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder000");		// �T���_�[
	SetEffectScale_(efc_thunder00, 2.5);
	Wait_(40);
	efc_thunder01 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder001");
	SetEffectScale_(efc_thunder01, 1.5);
	Wait_(30);
	efc_thunder02 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder002");
	SetEffectScale_(efc_thunder02, 5.0);
	Wait_(10);
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);											//�t�F�[�h�A�E�g
	WaitFade_();
	StopEarthQuake_();
	ReadWaitingLod("cameye001", "camtgt001");											//Lod�Ǎ�


	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	StartEarthQuake_(-1, 3, 0.3);														//�n�k
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);											//�t�F�[�h�C��
	//...........................................................................
	Wait_(30);
	local efc_crash = SetPointWorldEffect_("ef800_09_crash_reactor02", "efc_fire002");		//�؂ɗ�
	SetEffectScale_(efc_crash, 1.5);
	StartEarthQuake_(12, 3, 15.0);															//�傫���n�k
	Wait_(12);
	StartEarthQuake_(-1, 3, 1.0);															//�n�k
	local efc_fire02 = SetPointWorldEffect_("ef832_01_fire", "efc_fire002");				//�t�@�C�A�[
	SetEffectScale_(efc_fire02, 6.0);
	ChangeColorTone_(1.5, 0.5, 0.5, 30);													//��ʐԂ�
	Wait_(30);
	efc_thunder03 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder003");
	SetEffectScale_(efc_thunder03, 4.0);
	Wait_(20);
	efc_thunder04 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder004");
	SetEffectScale_(efc_thunder04, 6.5);
	Wait_(30);

	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);												//���t���b�V���@�t�F�[�h�A�E�g
	Wait_(10);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);												//�t�F�[�h�C��
	local efc_crash = SetPointWorldEffect_("ef800_09_crash_reactor02", "efc_fire001");		//�r���ɗ�
	//...........................................................................

	local efc_fire01 = SetPointWorldEffect_("ef852_03_explosion_db", "efc_fire001");		//�r���Ƀ{���o�[
	SetEffectScale_(efc_fire01, 4.0);
	ChangeColorTone_(2.5, 0.5, 0.5, 20);													//��ʐԂ�
	StartEarthQuake_(21, 3, 20.0);															//�傫���n�k
	Wait_(21);
	StartEarthQuake_(-1, 3, 1.5);															//�n�k
	local efc_fire01 = SetPointWorldEffect_("ef832_01_fire", "efc_fire001");				//�t�@�C�A�[
	SetEffectScale_(efc_fire01, 20.0);
	Wait_(80);

	EndDemo(FADE_COLOR_BLACK);
}
