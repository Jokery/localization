//=============================================
//
//		demo051[�I�[�v�j���O�f��_2(�ΎR)]
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
	local task_cam, task_reactor;
	local efc_kiseki, efc_kasoku ,efc_ractor02;
	local size_reactor = SCALE.REACTOR;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local model_reactor = ReadGimmick_("o_dem_11");								// ���A�N�^�[
	LoadEffect_("ef800_04_flying_reactor01");									// ���A�N�^�[�O��
	LoadEffect_("ef800_06_flying_reactor03");									// ���A�N�^�[����
	LoadEffect_("ef800_07_flying_reactor04");									// ���A�N�^�[�̂܂Ԃ�����
	
	// ���C�A�E�g
	LoadLayout_("op_credit");

// ���z�u
	local reactor = ArrangeGimmick_("o_dem_11", model_reactor, false);			// ���A�N�^�[
	SetScaleSilhouette(reactor, SCALE.REACTOR, SILHOUETTE_WIDTH.REACTOR);
	efc_kiseki = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_kiseki, size_reactor);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor000");				// 300F

// ���V��E���Ԑݒ�
	SetTime_(13000);															// ��
	SetWeather_(WEATHER.NORMAL); 												// �V�󐰂�
	
// ���J�����ݒ�
	local task = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);									// �G�t�F�N�g�������ʒu�����̂��߃t�F�[�h�C�����蓮�Őݒ肵�Ă��܂��B

	Wait_(20);																					// 20F
	
	//�����G�t�F�N�g1
	efc_kasoku = SetSelectBoneEffect_("ef800_06_flying_reactor03", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_kasoku, size_reactor);
	PlayBgm_("BGM_028")
	
	//�����Y���ʃG�t�F�N�g1
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, size_reactor);
	Wait_(5);																					// 25F
	DeleteEffectEmitter_(efc_ractor02);
	Wait_(5);																					// 30F
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, 3.0);
	Wait_(3);																					// 33F
	DeleteEffectEmitter_(efc_ractor02);
	Wait_(3);																					// 36F
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, 3.0);
	Wait_(3);																					// 39F
	DeleteEffectEmitter_(efc_ractor02);
	Wait_(51);																					// 90F
	
	SetLayoutAnime_("yuji_horii", false);														// �u�x��Y��v
	
	//�����Y���ʃG�t�F�N�g2
	Wait_(38);																					// 128F
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, 8.0);
	Wait_(5);																					// 133F
	DeleteEffectEmitter_(efc_ractor02);

	//�����G�t�F�N�g2
	Wait_(3);																					// 136F
	efc_kasoku = SetSelectBoneEffect_("ef800_06_flying_reactor03", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_kasoku, size_reactor);
	
	//�����Y���ʃG�t�F�N�g3
	Wait_(20);																					// 156F
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, 8.0);
	Wait_(5);																					// 161F
	DeleteEffectEmitter_(efc_ractor02);	
	
	//�����G�t�F�N�g3
	Wait_(55);																					// 216F
	efc_kasoku = SetSelectBoneEffect_("ef800_06_flying_reactor03", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_kasoku, size_reactor);
	
	Wait_(25);																					// 241F
	
	EndDemo(FADE_COLOR_BLACK);
}
