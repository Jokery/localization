//=============================================
//
//		demo331[�ړ����u�g�p_4(�X��)]
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

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(84);
	
	PlaySE_("SE_DEM_022");								//���ėp�E�嗤�ړ����u�N��
	SetMotion_(transfer, MOT_GIMMICK_1, BLEND_N);
	Wait_(190);
	
	SetMotion_(transfer, MOT_GIMMICK_2, BLEND_N);
	Wait_(15);
	
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
//	SetPointCameraEye_("cameye000");
//	SetPointCameraTarget_("camtgt000");
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	Wait_(10);
	
	SetMotion_(player, MOT_JUMP_UP, BLEND_L);
	task_player = Task_AnimeMoveNoFit_(player, "anm_player000");
	efc_transfer00 = SetPointWorldEffect_("ef732_02_tec_device_travel02", "obj_transfer000");
	PlaySE_("SE_DEM_023");							//��SE�F��������
	Wait_(30);
//	DeleteTask_(task_player);
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	
	PlaySE_("SE_DEM_024");								// �����E������n�E�X���E�č��@�嗤�ړ����u�Ŏˏo
//	task_player = Task_AnimeMoveNoFit_(player, "anm_player000");
	efc_player = SetSelectBoneEffect_("ef732_03_tec_device_travel03", player, ATTACH_GLOBAL);
	Wait_(15);
	
	SetMotion_(player, MOT_SPECIAL_WAIT, BLEND_M);
	Wait_(25);
	
	efc_transfer01 = SetPointWorldEffect_("ef732_01_tec_device_travel01", "obj_transfer000");
	Wait_(15);
	
	SetMotion_(player, MOT_SPECIAL_RUN, BLEND_M);
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
