//=============================================
//
//		demo052[�I�[�v�j���O�f��_3(�č�)]
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
	local efc_kiseki, efc_kasoku;
	local size_reactor = SCALE.REACTOR;

// �����\�[�X�Ǎ�
	local model_reactor = ReadGimmick_("o_dem_11");							// ���A�N�^�[
	LoadEffect_("ef800_04_flying_reactor01");								// ���A�N�^�[�O��
	LoadEffect_("ef800_06_flying_reactor03");								// ���A�N�^�[����

// ���z�u
	local reactor = ArrangeGimmick_("o_dem_11", model_reactor, false);		// ���A�N�^�[
	SetScaleSilhouette(reactor, SCALE.REACTOR, SILHOUETTE_WIDTH.REACTOR);
	efc_kiseki = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_kiseki, size_reactor);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor000");			// 300F

// ���V��E����
	SetTime_(18000);						//����
	SetWeather_(WEATHER.NORMAL); 			//�V�󐰂�
	
// ���J�����ݒ�
	local task = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(160);
	efc_kasoku = SetPointWorldEffect_("ef800_06_flying_reactor03", "efc_flying_reactor000");
	SetEffectScale_(efc_kasoku, 2);
	
	Wait_(50);
	
	EndDemo(FADE_COLOR_BLACK);
}
