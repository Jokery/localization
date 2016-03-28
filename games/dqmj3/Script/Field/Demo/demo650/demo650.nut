//=============================================
//
//		demo650[�K���}�U�[�h�폟��_9(�E�o)]
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
	local task_cam, task_player, task_player2;
	local efc_player, efc_light, efc_kira;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local model_o_V00_10 = ReadGimmick_("o_V00_10");		// ����

// ���z�u
	// ��l��
	SetPointPosNoFit_(player, "player000");
	//����
	local gmc_o_V00_10 = ArrangePointGimmick_("o_V00_10", model_o_V00_10, "ukisima000");

// ����풓���[�V�����Ǎ�
	local player_light_L = ReadMotion_(player, "Player_wrap_light_L");				// ���ɂ܂��L
	local player_float = ReadMotion_(player, "Player_float");						// ���ɂ܂��i������jL

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(15);		// �嗤�̃`�����h�~

// ���G�t�F�N�g
	LoadEffect_("ef710_05_cha_light_ren");					// ���i�[�e�̌�
	LoadEffect_("ef732_13_light_reactor01");				// ���A�N�^�[�̌��i�܂Ԃ����j
	LoadEffect_("ef731_01_mag_light01");					// �L���L��
	efc_player = SetSelectBoneEffect_("ef710_05_cha_light_ren", player, ATTACH_GLOBAL);

// �����[�V�����ݒ�
	SetMotion_(player, player_light_L, BLEND_N);


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
//cut01===============================================

	WaitLod_();
	StartDemo(FADE_COLOR_BLACK);
	WaitTask(task_cam);
	Wait_(60);


//cut02===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	WaitTask(task_cam);
	SetPointPosNoFit_(player, "player001");


//cut03===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	task_player = Task_AnimeMoveNoDirNoFit_(player, "anm_player000");								//��l����ї���
	efc_kira = SetSelectBoneEffect_("ef731_01_mag_light01", player, ATTACH_EFFECT2);				//���炫��
	SetEffectScale_(efc_kira, 0.3);
	Wait_(30);
	SetMotion_(player, player_float, BLEND_XL);														//�オ��̐�
	Wait_(20);
	efc_light = SetSelectBoneEffectSetOffset_("ef732_13_light_reactor01", player, ATTACH_EFFECT2,Vec3(0.0, 0.0, -10.0));		//���̋�
	SetEffectScale_(efc_light, 0.5);
	DeleteEffectEmitter_(efc_player);
	uChangeEffectScale(efc_light, 0.5, 2.7, 30)						//���̋ʂ�傫��
	SetAlphaFade(player, 0.0, 1);
	uChangeEffectScale(efc_light, 2.7, 0.5, 50)						//���̋ʂ�������
	SetEffectScale_(efc_kira, 0.5);
	Wait_(100);
//	PlaySE_("SE_DEM_175");
	Wait_(50);
	EndDemoBgmFade_(120);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 120);
	WaitFade_();
	Wait_(120);
	DeleteAllTask_();

	End_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		�G�t�F�N�g�T�C�Y�����X�ɕύX
//
//----------------------------------------------------------------------------
//	����	: efc			�G�t�F�N�g�h�c
//			: start_size	�����G�t�F�N�g�T�C�Y
//			: end_size		�ŏI�G�t�F�N�g�T�C�Y
//			: frm			�t���[����
//
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uChangeEffectScale(efc, start_size, end_size, frm)
{
	local change_size;		// �P�t���[���ŕύX����T�C�Y

	change_size = (end_size - start_size) / frm;		// (�ŏI�T�C�Y �| �����T�C�Y) �� �t���[����

	for (local i=1; i<=frm; i++) {
		SetEffectScale_(efc, start_size + (change_size * i));
		Wait_(1);
	}

	SetEffectScale_(efc, end_size);
}
