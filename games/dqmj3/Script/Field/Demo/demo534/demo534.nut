//=============================================
//
//		demo534[�ړ����u��ł��グ��_3(�R�A)]
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
	local task_cam, task_rocket, task_efc;
	local efc_cam, efc_rocket, efc_smoke, efc_rocket_light;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	// �M�~�b�N
	local model_rocket = ReadGimmick_("o_V00_04");	// �傫�ȍY
	local model_core = ReadGimmick_("o_dem_19");	// �R�A
	// �G�t�F�N�g
	LoadEffect_("ef853_03_launch03");				// ��s���G���W������o�鉌
	LoadEffect_("ef853_04_launch04");				// ���e�����ۂ̔j�Г�
	LoadEffect_("ef733_01_sym_shuchusen01");				// �W����
	LoadEffect_("ef853_05_launch05");				// �r�[�R��

	local baseResId = ReadGimmick_("o_effect_base");
	local baseObj = ArrangePointGimmick_("o_effect_base", baseResId, "efc_rocket000");
	SetPointPosNoFit_(baseObj, "efc_rocket000");

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetActive_(player, false);
	
	// �傫�ȍY
	local rocket = ArrangePointGimmick_("o_V00_04", model_rocket, "obj_rocket000");
	SetPointPosNoFit_(rocket, "obj_rocket000");
	SetScaleSilhouette(rocket, 0.4, 0.6);
	// �R�A
	local core = ArrangePointGimmick_("o_dem_19", model_core, "obj_core000");
	SetPointPosNoFit_(core, "obj_core000");
	SetScaleSilhouette(core, 0.5, 0.7);

// ���J�����ݒ�
	ReadWaitingLod("cameye000", "camtgt000");
	
	efc_rocket_light = SetSelectBoneEffectSetOffset_("ef853_05_launch05", baseObj, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));	//�r�[�R��
	SetEffectScale_(efc_rocket_light, 0.4);
	efc_rocket = SetSelectBoneEffect_("ef853_03_launch03", baseObj, ATTACH_GLOBAL);
	Wait_(30);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 125F
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	task_rocket = Task_AnimeMoveNoDir_(rocket, "anm_rocket000");	// 150F
	SetMotion_(rocket, MOT_GIMMICK_1, BLEND_N);

	SetEffectScale_(efc_rocket, 0.4);
	task_efc = Task_AnimeMoveNoDir_(baseObj, "anm_efc000");			// 150F
	
//	PlayLoopSE_("SE_DEM_013");
	PlaySE_("SE_DEM_141");											//��SE:�ΎR�E�e�����P�b�g�����X�_���֎h����
	StartDemo(FADE_COLOR_BLACK);
	
	WaitTask(task_cam);
	
	DeleteEffect_(efc_cam);
	
	StopLoopSE_(50);
	DeleteEffect_(efc_rocket_light);
		
	StartDecayEarthQuake_(92, 4, 10)
	
//	PlaySE_("SE_SKL_011");
	
	SetMotion_(rocket, MOT_GIMMICK_2, BLEND_N);	
	
	efc_smoke = SetPointWorldEffect_("ef853_04_launch04", "efc_smoke000");
	SetEffectScale_(efc_smoke, 0.4);
	
	WaitTask(task_rocket);
	WaitTask(task_efc);

	DeleteEffectEmitter_(efc_rocket);	
	Wait_(105);
	
	EndDemo(FADE_COLOR_BLACK);
}
