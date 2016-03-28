//=============================================
//
//		demo651[�K���}�U�[�h�Đ�]
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
	local task_cam;
	local efc_cam, efc_gal;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_gal = ReadNpc_("m185_00");			// �K���}�U�[�h
	// �M�~�b�N
	local model_sky = ReadGimmick_("o_dem_25");		// ��
	// �G�t�F�N�g
	LoadEffect_("ef733_04_sym_pollen_mist");
	LoadEffect_("ef733_01_sym_shuchusen01");
	LoadEffect_("ef730_01_oth_dark_aura01");
	LoadEffect_("ef864_07_galmotherd02");
	LoadEffect_("ef864_08_galmotherd03");

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetVisible(player, false);
	
	// �K���}�U�[�h
	local gal = ArrangePointNpc_(model_gal, "npc_gal000");
	SetScaleSilhouette(gal, 6, 1);
	
	// ��
	local sky = ArrangePointGimmick_("o_dem_25", model_sky, "sky000");
	SetScale_(sky, 0.2);
	
	// �G�t�F�N�g
	efc_cam = SetCameraEffect_("ef733_04_sym_pollen_mist", CAMERA_DEF);
	efc_gal = SetSelectBoneEffect_("ef730_01_oth_dark_aura01", gal, ATTACH_EFFECT2);
	SetEffectScale_(efc_gal, 0.8);

// �����[�V�����ݒ�
	SetMotion_(gal, MOT_SPELL_CHARGE, BLEND_N);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	ChangeColorTone_(-0.2, -0.3, -0.2,1);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	ChangeColorTone_(0,0,0,30);
	DeleteEffectEmitter_(efc_cam);
	
	PlaySE_("SE_DEM_186");
	SetMotion_(gal, MOT_SPELL_ACTUATE, BLEND_XL);
	StopBgm_(BGM_STOP_DEF);
	Wait_(20);
	
	EncountEndDemo(ENCOUNT_BOSS);
}
