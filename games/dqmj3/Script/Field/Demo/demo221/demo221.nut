//=============================================
//
//		demo221[�ړ����u�g�p_3(�쓹)]
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
	local efc_player, efc_transfer00, efc_transfer01;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_transfer = ReadGimmick_("o_dem_00");	// �]�����u
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	// �G�t�F�N�g
	LoadEffect_("ef732_01_tec_device_travel01");		// �ړ����u�A�N��
	LoadEffect_("ef732_02_tec_device_travel02");		// �ړ����u�A�y��
	LoadEffect_("ef732_03_tec_device_travel03");		// �ړ����u�A�ˏo

// ���z�u
	// �]�����u
	local transfer = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer000");
	
	// ��l��
	SetPointPos_(player, "player000");
	
// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(30);
	
	PlaySE_("SE_DEM_022");		//�ړ����u�N��SE
	SetMotion_(transfer, MOT_GIMMICK_1, BLEND_M);
	Wait_(190);
	SetMotion_(transfer, MOT_GIMMICK_2, BLEND_M);
	Wait_(5);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	Wait_(5);
	
	SetMotion_(player, MOT_JUMP_UP, BLEND_XL);
	task_player = Task_AnimeMoveNoFit_(player, "anm_player001");
	efc_transfer00 = SetPointWorldEffect_("ef732_02_tec_device_travel02", "obj_transfer000");
	PlaySE_("SE_DEM_023");							//��SE�F��������
	Wait_(30);
	DeleteTask_(task_player);
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	PlaySE_("SE_DEM_024");	
	task_player = Task_AnimeMoveNoFit_(player, "anm_player000");
	efc_player = SetSelectBoneEffect_("ef732_03_tec_device_travel03", player, ATTACH_GLOBAL);
	Wait_(15);
	
	SetMotion_(player, MOT_SPECIAL_WAIT, BLEND_L);
	Wait_(25);
	
	efc_transfer01 = SetPointWorldEffect_("ef732_01_tec_device_travel01", "obj_transfer000");
	Wait_(15);
	
	SetMotion_(player, MOT_SPECIAL_RUN, BLEND_L);
	Wait_(40);
	
	EndDemo(FADE_COLOR_BLACK);
}
