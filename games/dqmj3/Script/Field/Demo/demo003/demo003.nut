//=============================================
//
//		demo003[�I�[�v�j���O�f��_6(����)�j]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
	SetTime_(15120);		// ��
	ChangeColorTone_(0.0, 0.0, 0.0, 0);
	
// ���ϐ���`
	local task_cam, task_reactor;
	local efc_ractor00, efc_ractor01, efc_ractor02;
	local size_reactor = SCALE.REACTOR;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_reactor = ReadGimmick_("o_dem_11");						// ���A�N�^�[
	local model_shelter = ReadGimmick_("o_A00_03");	//�V�F���^�[
	local model_door = ReadGimmick_("o_A00_01");	//��
	local model_window = ReadGimmick_("o_A00_04");	//�Z���^�[�r���̑��M�~�b�N
	// �G�t�F�N�g
	LoadEffect_("ef800_04_flying_reactor01");							// ���A�N�^�[�̋O��
	LoadEffect_("ef800_06_flying_reactor03");							// ���A�N�^�[����
	LoadEffect_("ef800_07_flying_reactor04");							// ���A�N�^�[�̂܂Ԃ�����
	// ���C�A�E�g
	LoadLayout_("op_credit");

// ���z�u
	local shelter000 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter000");
	local shelter001 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter001");
	local shelter002 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter002");
	local door000 = ArrangePointGimmick_("o_A00_01", model_door, "obj_door000");
	local door001 = ArrangePointGimmick_("o_A00_01", model_door, "obj_door001");
	local window = ArrangePointGimmick_("o_A00_04", model_window, "obj_window000");
	// ���A�N�^�[
	local reactor = ArrangeGimmick_("o_dem_11", model_reactor, false);
	SetScaleSilhouette(reactor, SCALE.REACTOR, SILHOUETTE_WIDTH.REACTOR);
	efc_ractor00 = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor00, size_reactor);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor000");		// 300F

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 300F

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	efc_ractor01 = SetSelectBoneEffect_("ef800_06_flying_reactor03", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor01, size_reactor);
	
	//=========Wait�̍��v���v280�t���[���ɂȂ�悤����============
	Wait_(80);		// 80F
	
	SetLayoutAnime_("koichi_sugiyama", false);		// �u������܂��������v
	
	Wait_(50);		// 130F
	
	//�܂Ԃ��������̂P
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, size_reactor);
	Wait_(10);		// 140F
	
	DeleteEffectEmitter_(efc_ractor02);
	
	Wait_(50);		// 190F
	
	//�܂Ԃ���������2
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, size_reactor);
	Wait_(10);		// 200F
	DeleteEffectEmitter_(efc_ractor02);
	
	Wait_(80);		// 280F
	//=============================================================
	
	EndDemo(FADE_COLOR_BLACK);
}
