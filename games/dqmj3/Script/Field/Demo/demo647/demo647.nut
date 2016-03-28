//=============================================
//
//		demo647[�K���}�U�[�h�폟��_6(��-�ΎR)]
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
	local task_cam, task_player, task_birdy;
	local efc_cam, efc_player, efc_catastrophe000;

// �����Ԑݒ�
	SetTime_(18000);								//���Ă�

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_birdy = ReadNpc_("n019");			// �o�[�f�B

	//�G�t�F�N�g
	LoadEffect_("ef864_05_catastrophe02");			// �V�g�̂͂���
	LoadEffect_("ef864_04_catastrophe01");			// ᏋC
	LoadEffect_("ef860_01_release");				// ���Ă��g��
	LoadEffect_("ef220_08_hikarinohadou");			// �Ђ���̔g��

// ���z�u
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");						// �o�[�f�B
	SetPointPosNoFit_(birdy, "npc_birdy000");
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);								// �T�C�YN
	SetVisible(birdy, false);															// �o�[�f�B��\��

// ����풓���[�V�����Ǎ�
	local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");		// ��s(�z�o�����O)L

// ���J�����ݒ�
	ReadWaitingLod("lodeye000", "lodtgt000");											//Lod�Ǎ�

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

// �������G�t�F�N�g
	efc_catastrophe000 = SetCameraEffect_("ef864_04_catastrophe01", 100);				// ᏋC


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_cam); 

	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//�t�F�[�h�A�E�g
	WaitFade_();

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	SetVisible(birdy, true);															// �o�[�f�B�\��
	SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_N);								// �o�[�f�B�z�o�����OL

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//�t�F�[�h�C��
	//...........................................................................	

	Wait_(60);

	//...........................................................................
	efc_cam = SetCameraEffect_("ef220_08_hikarinohadou", 100);					//�g��
	SetEffectScale_(efc_cam, 4.0);
	PlaySE_("SE_DEM_192");
	Wait_(10);
	StopBgm_(15);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);					//���t�F�[�h�A�E�g
	DeleteEffectEmitter_(efc_catastrophe000);									//ᏋC����
	Wait_(10);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 35);					//���t�F�[�h�C��
	ChangeTime(0, 30, 8700);													//�邩�璋��

	//...........................................................................	

	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy000");					// �o�[�f�B�A�j��
	Wait_(35);
	PlayBgm_("BGM_002");
	Wait_(15);

	// �V�g�̂͂���
	local efc_catastrophe000 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe000");
	local efc_catastrophe001 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe001");
	local efc_catastrophe002 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe002");
	local efc_catastrophe003 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe003");
	local efc_catastrophe004 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe004");

	SetEffectScale_(efc_catastrophe000, 0.8);
	SetEffectScale_(efc_catastrophe001, 0.9);
	SetEffectScale_(efc_catastrophe002, 1.5);
	SetEffectScale_(efc_catastrophe003, 1.1);
	SetEffectScale_(efc_catastrophe004, 0.9);
	WaitTask(task_birdy);
	local efc_catastrophe005 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe005");
	SetEffectScale_(efc_catastrophe005, 1.0);
	Wait_(100);

	EndDemo(FADE_COLOR_WHITE);
}
