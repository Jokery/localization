//=============================================
//
//		demo054[�I�[�v�j���O�f��_5(�쓹)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
// �����Ԑݒ�
	SetTime_(15120);													// ��	
	
// ���ϐ���`
	local task_cam, task_player, task_reactor;
	local efc_kiseki, efc_kasoku, efc_flash, efc_shitai00, efc_shitai01, efc_shitai02;
	local size_reactor = SCALE.REACTOR;
	
// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local model_reactor = ReadGimmick_("o_dem_11");						// ���A�N�^�[
	local model_shitai = ReadNpc_("m102_00");							// ������������
	local model_bat = ReadNpc_("m097_00");								// �{�[���o�b�g
	
// ���G�t�F�N�g�Ǎ�
	LoadEffect_("ef800_04_flying_reactor01");							// �O��
	LoadEffect_("ef800_06_flying_reactor03");							// ����
	LoadEffect_("ef800_07_flying_reactor04");							// ���A�N�^�[�̂܂Ԃ�����
	LoadEffect_("ef726_02_nat_zombie");									// �]���r�n���y����o�Ă���Ƃ���
	
// ���z�u
	//���A�N�^�[
	local reactor = ArrangeGimmick_("o_dem_11", model_reactor, false);
//	SetScaleSilhouette(reactor, SCALE.REACTOR, SILHOUETTE_WIDTH.REACTOR);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor001");
	efc_kiseki = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_kiseki, 2.0);	
	
	//������������
	local shitai00 = ArrangePointNpc_(model_shitai, "npc_shitai000");
	SetScaleSilhouette(shitai00, SCALE.N, SILHOUETTE_WIDTH.N);			//N�T�C�Y
	local shitai01 = ArrangePointNpc_(model_shitai, "npc_shitai001");
	SetScaleSilhouette(shitai01, SCALE.N, SILHOUETTE_WIDTH.N);			//N�T�C�Y
	local shitai02 = ArrangePointNpc_(model_shitai, "npc_shitai002");
	SetScaleSilhouette(shitai02, SCALE.M, SILHOUETTE_WIDTH.M);			//M�T�C�Y
	
	//�{�[���o�b�g
	local bat00 = ArrangePointNpc_(model_bat, "npc_bat000");
	SetScaleSilhouette(bat00, SCALE.N, SILHOUETTE_WIDTH.N);				//N�T�C�Y
	SetMotion_(bat00, MOT_WALK, BLEND_M);								//�������[�V����
	task_reactor = Task_AnimeMoveNoFit_(bat00, "anm_bat000");
	
// �������\���ݒ�
	SetVisible(shitai00, false);										//��\���Ȏ���A
	SetVisible(shitai01, false);										//��\���Ȏ���B
	SetVisible(shitai02, false);										//��\���Ȏ���C	

// ���J�����ݒ�
	local task = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);

	Wait_(10);

	efc_flash = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash, 7.0);															//���A�N�^�[�̂܂Ԃ�����1
	Wait_(10);
	DeleteEffectEmitter_(efc_flash);	
	
	Wait_(5);
	SetMotion_(shitai00, MOT_LIFE_SPECIAL_1, BLEND_N);											//�����o�鎀��A
	SetVisible(shitai00, true);																	//�\������鎀��A
	efc_shitai00 = SetSelectBoneEffect_("ef726_02_nat_zombie", shitai00, ATTACH_GLOBAL);		//�y�G�t�F�N�g

	Wait_(35);
	
	efc_flash = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash, 5.0);															//���A�N�^�[�̂܂Ԃ�����2
	Wait_(10);
	DeleteEffectEmitter_(efc_flash);	
	
	Wait_(20);
	
	SetMotion_(shitai01, MOT_LIFE_SPECIAL_1, BLEND_N);											//�����o�鎀��B	
	SetVisible(shitai01, true);																	//�\������鎀��B
	efc_shitai01 = SetSelectBoneEffect_("ef726_02_nat_zombie", shitai01, ATTACH_GLOBAL);		//�y�G�t�F�N�g
	
	WaitMotion(shitai00);
	SetMotion_(shitai00, MOT_WAIT, BLEND_M);													//����A�ҋ@	
	
	WaitMotion(shitai01);
	SetMotion_(shitai01, MOT_WAIT, BLEND_M);													//����B�ҋ@
	
	Wait_(23);
	
	efc_kasoku = SetSelectBoneEffect_("ef800_06_flying_reactor03", reactor, ATTACH_GLOBAL);		//���A�N�^�[����
	SetEffectScale_(efc_kasoku, 1.3);
	efc_flash = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash, 2.0);															//���A�N�^�[�̂܂Ԃ�����3
	Wait_(10);
	DeleteEffectEmitter_(efc_flash);		
	
	SetMotion_(shitai02, MOT_LIFE_SPECIAL_1, BLEND_N);											//�����o�鎀��C
	SetVisible(shitai02, true);																	//�\������鎀��C
	efc_shitai02 = SetSelectBoneEffect_("ef726_02_nat_zombie", shitai02, ATTACH_GLOBAL);		//�y�G�t�F�N�g
	
	WaitMotion(shitai02);
	SetMotion_(shitai02, MOT_WAIT, BLEND_M);													//����C�ҋ@
	
	Wait_(5);
	
	EndDemo(FADE_COLOR_BLACK);
}
