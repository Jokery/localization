//=============================================
//
//		demo533[�ړ����u�g�p_6(�ΎR)]
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
	local efc_player, efc_monolith, efc_transfer00, efc_player, efc_transfer01, efc_transfer;

	local player_on1 = [1, 0.9, 0.8,0.7, 0.6,0.5, 0.4, 0.3, 0.2, 0.1, 0];
	local player_on2 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
	
// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	
	LoadEffect_("ef732_02_tec_device_travel02");		// �ړ����u�A�y��
	LoadEffect_("ef732_03_tec_device_travel03");		// �ړ����u�A�ˏo
	LoadEffect_("ef732_04_tec_device_travel04");		// �ړ����u�A�N��(�ΎR�p)

	// �M�~�b�N �ǂݍ���
	local  model_transfer = ReadGimmick_("o_dem_24");	// ���ˑ�̃��t�g(��ҋ@)

// ���z�u
	local transfer = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer000");		// ���ˑ�̃��t�g(��ҋ@)

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
//cut01
	SetMotion_(transfer, MOT_GIMMICK_2, BLEND_N);							// ���ˑ�̃��t�g(��ҋ@)
	SetMotion_(player, MOT_WALK, BLEND_L);
	
// ���J�����ݒ�
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	WaitLod_();
	local task_player = Task_AnimeMoveNoFit_(player, "anmplayer000");		// ��l�� �����A�j��

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(70);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(30);
	PlaySE_("SE_DEM_023");													//�ړ����u�̏�������
	
	efc_transfer01 = SetPointWorldEffect_("ef732_02_tec_device_travel02", "efc_transfer000");

	WaitTask(task_player);
	WaitTask(task_cam);
	Wait_(60);
	DeleteTask_(task_player);
	DeleteTask_(task_cam);

//cut02
	SetMotion_(player, MOT_JUMP_UP, BLEND_XL);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	task_player = Task_AnimeMoveNoFit_(player, "anm_player001");
	PlaySE_("SE_DEM_108");
	efc_player = SetSelectBoneEffect_("ef732_03_tec_device_travel03", player, ATTACH_GLOBAL);
	Wait_(50);
	efc_transfer = SetPointWorldEffect_("ef732_04_tec_device_travel04", "efc_transfer000");
	
	Wait_(40);

	SetAlpha_(player, 0);													// ��l�����l
	DeleteEffectEmitter_(efc_player);
	
	Wait_(30);
	EndDemo(FADE_COLOR_BLACK);
}
